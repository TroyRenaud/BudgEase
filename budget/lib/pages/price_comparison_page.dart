
import 'package:budget/database/tables.dart';
import 'package:budget/struct/databaseGlobal.dart';
import 'package:budget/widgets/framework/pageFramework.dart';
import 'package:budget/widgets/selectChips.dart';
import 'package:budget/widgets/textWidgets.dart';
import 'package:drift/drift.dart' as drift;
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:budget/struct/currencyFunctions.dart';

class PriceComparisonPage extends StatefulWidget {
  const PriceComparisonPage({Key? key}) : super(key: key);

  @override
  State<PriceComparisonPage> createState() => _PriceComparisonPageState();
}

class _PriceComparisonPageState extends State<PriceComparisonPage> {
  Map<String, List<PricedItemWithWallet>> _groupPricedItems(
      List<PricedItemWithWallet> pricedItems) {
    final map = <String, List<PricedItemWithWallet>>{};
    for (final item in pricedItems) {
      if (map.containsKey(item.pricedItem.name)) {
        map[item.pricedItem.name]!.add(item);
      } else {
        map[item.pricedItem.name] = [item];
      }
    }
    return map;
  }

  PricedItemWithWallet? _getCheapestItem(List<PricedItemWithWallet> items) {
    if (items.isEmpty) return null;
    return items.reduce((a, b) =>
        a.pricedItem.price < b.pricedItem.price ? a : b);
  }

  void _addItem(String name, String store, double price, String walletFk) {
    final newPricedItem = PricedItemsCompanion(
      name: drift.Value(name),
      store: drift.Value(store),
      price: drift.Value(price),
      walletFk: drift.Value(walletFk),
      dateCreated: drift.Value(DateTime.now()),
    );
    database.createOrUpdatePricedItem(newPricedItem);
  }

  void _showAddItemDialog() {
    final nameController = TextEditingController();
    final storeController = TextEditingController();
    final priceController = TextEditingController();
    String selectedWalletPk = appStateSettings["selectedWalletPk"];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('add-item'.tr()),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'item-name'.tr()),
              ),
              TextField(
                controller: storeController,
                decoration: InputDecoration(labelText: 'store-name'.tr()),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'price'.tr()),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              SelectChips(
                items: Provider.of<AllWallets>(context).list,
                getSelected: (TransactionWallet wallet) {
                  return selectedWalletPk == wallet.walletPk;
                },
                onSelected: (TransactionWallet wallet) {
                  setState(() {
                    selectedWalletPk = wallet.walletPk;
                  });
                },
                getLabel: (TransactionWallet wallet) {
                  return wallet.name;
                },
              )
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('cancel'.tr()),
            ),
            TextButton(
              onPressed: () {
                final name = nameController.text;
                final store = storeController.text;
                final price = double.tryParse(priceController.text) ?? 0.0;
                if (name.isNotEmpty && store.isNotEmpty && price > 0) {
                  _addItem(name, store, price, selectedWalletPk);
                  Navigator.of(context).pop();
                }
              },
              child: Text('add'.tr()),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageFramework(
      title: "price-comparison".tr(),
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: _showAddItemDialog,
        ),
      ],
      slivers: [
        StreamBuilder<List<PricedItemWithWallet>>(
          stream: database.watchAllPricedItemsWithWallet(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final grouped = _groupPricedItems(snapshot.data!);
              final groupKeys = grouped.keys.toList();
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final groupName = groupKeys[index];
                    final itemsInGroup = grouped[groupName]!;
                    final cheapestItem = _getCheapestItem(itemsInGroup);

                    return Card(
                      margin: EdgeInsets.all(8.0),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(groupName,
                                style: Theme.of(context).textTheme.headline6),
                            SizedBox(height: 8.0),
                            ...itemsInGroup.map((item) {
                              final isCheapest = item == cheapestItem;
                              return ListTile(
                                title: Text(item.pricedItem.store),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFont(
                                      text: convertToMoney(
                                        Provider.of<AllWallets>(context),
                                        item.pricedItem.price,
                                        currencyKey: item.wallet.currency,
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        database.deletePricedItem(
                                            item.pricedItem.pricedItemPk);
                                      },
                                    ),
                                  ],
                                ),
                                tileColor: isCheapest
                                    ? Colors.green.withOpacity(0.3)
                                    : null,
                              );
                            }).toList(),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: groupKeys.length,
                ),
              );
            } else {
              return SliverToBoxAdapter(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
