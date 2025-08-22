
import 'package:budget/colors.dart';
import 'package:budget/functions.dart';
import 'package:budget/struct/settings.dart';
import 'package:budget/widgets/framework/pageFramework.dart';
import 'package:budget/widgets/tappable.dart';
import 'package:budget/widgets/textWidgets.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class LicensesPage extends StatelessWidget {
  const LicensesPage({Key? key}) : super(key: key);

  Future<String> loadLicense() async {
    return await rootBundle.loadString('assets/LICENSE.txt');
  }

  @override
  Widget build(BuildContext context) {
    bool fullScreenLayout = false;
    Color containerColor = appStateSettings["materialYou"]
        ? dynamicPastel(
            context, Theme.of(context).colorScheme.secondaryContainer,
            amountLight: 0.2, amountDark: 0.6)
        : getColor(context, "lightDarkAccent");
    List<Widget> developmentTeam = [
      Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 15, vertical: 7),
        child: Center(
          child: TextFont(
            text: "development-team".tr(),
            fontSize: 20,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
            maxLines: 5,
          ),
        ),
      ),
      Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 15, vertical: 5),
        child: Tappable(
          onTap: () {
            openUrl('mailto:dapperappdeveloper@gmail.com');
          },
          onLongPress: () {
            copyToClipboard("dapperappdeveloper@gmail.com");
          },
          color: containerColor,
          borderRadius: getPlatform() == PlatformOS.isIOS ? 10 : 15,
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 13, vertical: 15),
            child: Column(
              children: [
                TextFont(
                  text: "lead-developer".tr(),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                ),
                TextFont(
                  text: "James",
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                  textColor: Theme.of(context).colorScheme.onPrimaryContainer,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                ),
                TextFont(
                  text: "dapperappdeveloper@gmail.com",
                  fontSize: 16,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  textColor: getColor(context, "textLight"),
                ),
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 15, vertical: 5),
        child: Tappable(
          onTap: () {},
          color: containerColor,
          borderRadius: getPlatform() == PlatformOS.isIOS ? 10 : 15,
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 13, vertical: 15),
            child: Column(
              children: [
                TextFont(
                  text: "database-designer".tr(),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                ),
                TextFont(
                  text: "YuYing",
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                  textColor: Theme.of(context).colorScheme.onPrimaryContainer,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                ),
              ],
            ),
          ),
        ),
      ),
      SizedBox(height: 10),
      Padding(
        padding:
            const EdgeInsetsDirectional.symmetric(horizontal: 15, vertical: 7),
        child: Center(
          child: TextFont(
            text: "made-in-canada".tr() + " " + "🍁",
            fontSize: 14,
            textAlign: TextAlign.center,
            maxLines: 5,
          ),
        ),
      ),
    ];

    List<Widget> graphics = [
      AboutInfoBox(
        title: "freepik-credit".tr(),
        link: "https://www.flaticon.com/authors/freepik",
      ),
      AboutInfoBox(
        title: "font-awesome-credit".tr(),
        link: "https://fontawesome.com/",
      ),
      AboutInfoBox(
        title: "pch-vector-credit".tr(),
        link: "https://www.freepik.com/author/pch-vector",
      ),
    ];

    List<Widget> majorTools = [
      AboutInfoBox(
        title: "Flutter",
        link: "https://flutter.dev/",
        padding: fullScreenLayout
            ? EdgeInsetsDirectional.symmetric(horizontal: 7.5, vertical: 5)
            : null,
      ),
      AboutInfoBox(
        title: "Google Cloud APIs",
        link: "https://cloud.google.com/",
        padding: fullScreenLayout
            ? EdgeInsetsDirectional.symmetric(horizontal: 7.5, vertical: 5)
            : null,
      ),
      AboutInfoBox(
        title: "Drift SQL Database",
        link: "https://drift.simonbinder.eu/",
        padding: fullScreenLayout
            ? EdgeInsetsDirectional.symmetric(horizontal: 7.5, vertical: 5)
            : null,
      ),
      AboutInfoBox(
        title: "FL Charts",
        link: "https://github.com/imaNNeoFighT/fl_chart",
        padding: fullScreenLayout
            ? EdgeInsetsDirectional.symmetric(horizontal: 7.5, vertical: 5)
            : null,
      ),
      AboutInfoBox(
        title: "exchange-rates-api".tr(),
        link: "https://github.com/fawazahmed0/exchange-api",
        padding: fullScreenLayout
            ? EdgeInsetsDirectional.symmetric(horizontal: 7.5, vertical: 5)
            : null,
      ),
    ];

    List<Widget> translators = [
      TranslationInfoBox(
        title: "Italian",
        list: [
          "Thomas B.",
          "Mattia A.",
        ],
      ),
      TranslationInfoBox(
        title: "Polish",
        list: [
          "Michał S.",
          "Michał P.",
          "Kaczusia",
        ],
      ),
      TranslationInfoBox(
        title: "Serbian",
        list: [
          "Jovan P.",
        ],
      ),
      TranslationInfoBox(
        title: "Swahili",
        list: [
          "Anthony K.",
        ],
      ),
      TranslationInfoBox(
        title: "German",
        list: [
          "Fabian S.",
          "Christian R.",
          "Samuel R.",
          "Bettina S.",
        ],
      ),
      TranslationInfoBox(
        title: "Arabic",
        list: [
          "Dorra Y.",
          "Ammar N.",
          "Hussain A.",
          "Mahmoud E.",
        ],
      ),
      TranslationInfoBox(
        title: "Portuguese",
        list: [
          "Alexander G.",
          "Jean J.",
          "João P.",
          "Junior M.",
          "Leandro",
          "Xavier B.",
        ],
      ),
      TranslationInfoBox(
        title: "Bulgarian",
        list: [
          "Денислав C.",
        ],
      ),
      TranslationInfoBox(
        title: "Chinese (Simplified)",
        list: [
          "Clyde",
        ],
      ),
      TranslationInfoBox(
        title: "Chinese (Traditional)",
        list: [
          "qazlll456",
        ],
      ),
      TranslationInfoBox(
        title: "Hindi",
        list: [
          "Dikshant S.",
          "Nikunj K.",
          "Darshan L.",
        ],
      ),
      TranslationInfoBox(
        title: "Vietnamese",
        list: [
          "Ng. Anh",
        ],
      ),
      TranslationInfoBox(
        title: "French",
        list: [
          "Antoine C.",
          "Fabien H.",
          "Samuel S.",
        ],
      ),
      TranslationInfoBox(
        title: "Indonesian",
        list: [
          "Gusairi P.",
        ],
      ),
      TranslationInfoBox(
        title: "Ukrainian",
        list: [
          "Chris M.",
          "Yurii S.",
          "Mariia",
        ],
      ),
      TranslationInfoBox(
        title: "Russian",
        list: [
          "Ilya A.",
          "Konstantin B.",
          "Dennis Q",
          "Innokentii B.",
        ],
      ),
      TranslationInfoBox(
        title: "Romanian",
        list: [
          "Valentin G.",
          "Tarciziu",
        ],
      ),
      TranslationInfoBox(
        title: "Spanish",
        list: [
          "Pablo S.",
          "Gonzalo R.",
          "Ramon M.",
        ],
      ),
      TranslationInfoBox(
        title: "Swedish",
        list: [
          "Anna M.",
        ],
      ),
      TranslationInfoBox(
        title: "Danish",
        list: [
          "Mittheo",
        ],
      ),
      TranslationInfoBox(
        title: "Turkish",
        list: [
          "Serdar A.",
        ],
      ),
      TranslationInfoBox(
        title: "Slovak",
        list: [
          "Igor V.",
        ],
      ),
      TranslationInfoBox(
        title: "Macedonian",
        list: [
          "Andrej A.",
        ],
      ),
      TranslationInfoBox(
        title: "Czech",
        list: [
          "Kamil T.",
          "Hana B.",
        ],
      ),
      TranslationInfoBox(
        title: "Hebrew",
        list: [
          "Happy Bear",
        ],
      ),
      TranslationInfoBox(
        title: "Afrikaans",
        list: [
          "Andrè B.",
        ],
      ),
      TranslationInfoBox(
        title: "Filipino",
        list: [
          "Waren G.",
        ],
      ),
      TranslationInfoBox(
        title: "Tamil",
        list: [
          "Mohamed A.",
        ],
      ),
      TranslationInfoBox(
        title: "Japanese",
        list: [
          "Tetta N.",
        ],
      ),
      TranslationInfoBox(
        title: "Hungarian",
        list: [
          "Döbröntei S.",
          "Myra S.",
        ],
      ),
      TranslationInfoBox(
        title: "Thai",
        list: [
          "Jateniphat U.",
        ],
      ),
      TranslationInfoBox(
        title: "Gujarati",
        list: [
          "Darshan L.",
          "Harsh S.",
        ],
      ),
      TranslationInfoBox(
        title: "Finnish",
        list: [
          "Mirko J.",
        ],
      ),
      TranslationInfoBox(
        title: "Dutch",
        list: [
          "Niels S.",
        ],
      ),
      TranslationInfoBox(
        title: "Malay",
        list: [
          "アリフ",
        ],
      ),
      TranslationInfoBox(
        title: "Sinhala",
        list: [
          "Bhagya S.",
        ],
      ),
    ];
    return PageFramework(
      dragDownToDismiss: true,
      title: "licenses".tr(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(height: 20),
              FutureBuilder<String>(
                future: loadLicense(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFont(
                        text: snapshot.data!,
                        fontSize: 14,
                        textAlign: TextAlign.center,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
              SizedBox(height: 20),
              ...developmentTeam,
              SizedBox(height: 10),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 15, vertical: 7),
                child: Center(
                  child: TextFont(
                    text: "graphics".tr(),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                    maxLines: 5,
                  ),
                ),
              ),
              ...graphics,
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 15, vertical: 7),
                child: Center(
                  child: TextFont(
                    text: "major-tools".tr(),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                    maxLines: 5,
                  ),
                ),
              ),
              ...majorTools,
              Container(height: 15),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 15, vertical: 7),
                child: Center(
                  child: TextFont(
                    text: "translations".tr().capitalizeFirst,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                    maxLines: 5,
                  ),
                ),
              ),
            ],
          ),
        ),
        SliverPadding(
          padding: fullScreenLayout
              ? EdgeInsets.zero
              : EdgeInsetsDirectional.symmetric(horizontal: 7.5),
          sliver: SliverMasonryGrid(
            gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: fullScreenLayout ? 2 : 1,
            ),
            mainAxisSpacing: 0,
            crossAxisSpacing: 0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return translators[index];
              },
              childCount: translators.length,
            ),
          ),
        ),
      ],
    );
  }
}


class TranslationInfoBox extends StatelessWidget {
  const TranslationInfoBox({
    Key? key,
    required this.title,
    this.list,
  }) : super(key: key);

  final String title;
  final List<String>? list;

  @override
  Widget build(BuildContext context) {
    return AboutInfoBox(
      title: title,
      list: list,
      listTextColor: getColor(context, "black").withOpacity(0.5),
      padding: EdgeInsetsDirectional.symmetric(horizontal: 7.5, vertical: 5),
    );
  }
}

class AboutInfoBox extends StatelessWidget {
  const AboutInfoBox({
    Key? key,
    required this.title,
    this.link,
    this.list,
    this.color,
    this.listTextColor,
    this.padding,
    this.showLink = true,
  }) : super(key: key);

  final String title;
  final String? link;
  final List<String>? list;
  final Color? color;
  final Color? listTextColor;
  final EdgeInsetsGeometry? padding;
  final bool showLink;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          EdgeInsetsDirectional.symmetric(horizontal: 15, vertical: 5),
      child: Tappable(
        onTap: () async {
          if (link != null) openUrl(link ?? "");
        },
        onLongPress: () {
          if (link != null) copyToClipboard(link ?? "");
        },
        color: color ??
            (appStateSettings["materialYou"]
                ? dynamicPastel(
                    context, Theme.of(context).colorScheme.secondaryContainer,
                    amountLight: 0.2, amountDark: 0.6)
                : getColor(context, "lightDarkAccent")),
        borderRadius: getPlatform() == PlatformOS.isIOS ? 10 : 15,
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 13, vertical: 15),
          child: Column(
            children: [
              TextFont(
                text: title,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
                maxLines: 5,
              ),
              SizedBox(height: 6),
              if (link != null && showLink)
                TextFont(
                  text: link ?? "",
                  fontSize: 14,
                  textAlign: TextAlign.center,
                  textColor: getColor(context, "textLight"),
                  maxLines: 1,
                ),
              for (String item in list ?? [])
                TextFont(
                  text: item,
                  fontSize: 14,
                  textAlign: TextAlign.center,
                  textColor: listTextColor ?? getColor(context, "textLight"),
                  maxLines: 10,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
