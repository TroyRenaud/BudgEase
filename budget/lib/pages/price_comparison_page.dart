
import 'package:budget/widgets/framework/pageFramework.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class PricedItem {
  final String name;
  final String store;
  final double price;

  PricedItem({required this.name, required this.store, required this.price});
}

class PriceComparisonPage extends StatefulWidget {
  const PriceComparisonPage({Key? key}) : super(key: key);

  @override
  State<PriceComparisonPage> createState() => _PriceComparisonPageState();
}

class _PriceComparisonPageState extends State<PriceComparisonPage> {
  final List<PricedItem> _items = [];

  Map<String, List<PricedItem>> get _groupedItems {
    final map = <String, List<PricedItem>>{};
    for (final item in _items) {
      if (map.containsKey(item.name)) {
        map[item.name]!.add(item);
      } else {
        map[item.name] = [item];
      }
    }
    return map;
  }

  PricedItem? _getCheapestItem(List<PricedItem> items) {
    if (items.isEmpty) return null;
    return items.reduce((a, b) => a.price < b.price ? a : b);
  }

  void _addItem(String name, String store, double price) {
    setState(() {
      _items.add(PricedItem(name: name, store: store, price: price));
    });
  }

  void _showAddItemDialog() {
    final nameController = TextEditingController();
    final storeController = TextEditingController();
    final priceController = TextEditingController();

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
                  _addItem(name, store, price);
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
    final grouped = _groupedItems;
    final groupKeys = grouped.keys.toList();

    return PageFramework(
      title: "price-comparison".tr(),
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: _showAddItemDialog,
        ),
      ],
      slivers: [
        SliverList(
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
                      Text(groupName, style: Theme.of(context).textTheme.headline6),
                      SizedBox(height: 8.0),
                      ...itemsInGroup.map((item) {
                        final isCheapest = item == cheapestItem;
                        return ListTile(
                          title: Text(item.store),
                          trailing: Text(item.price.toStringAsFixed(2)),
                          tileColor: isCheapest ? Colors.green.withOpacity(0.3) : null,
                        );
                      }).toList(),
                    ],
                  ),
                ),
              );
            },
            childCount: groupKeys.length,
          ),
        ),
      ],
    );
  }
}
