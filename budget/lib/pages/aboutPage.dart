import 'dart:math';
import 'package:budget/functions.dart';
import 'package:budget/main.dart';
import 'package:budget/pages/accountsPage.dart';
import 'package:budget/pages/addTransactionPage.dart';
import 'package:budget/pages/debugPage.dart';
import 'package:budget/pages/detailedChangelogPage.dart';
import 'package:budget/pages/licensesPage.dart';
import 'package:budget/pages/onBoardingPage.dart';
import 'package:budget/pages/privacyPolicyPage.dart';
import 'package:budget/struct/databaseGlobal.dart';
import 'package:budget/struct/languageMap.dart';
import 'package:budget/struct/settings.dart';
import 'package:budget/widgets/button.dart';
import 'package:budget/widgets/framework/popupFramework.dart';
import 'package:budget/widgets/moreIcons.dart';
import 'package:budget/widgets/navigationSidebar.dart';
import 'package:budget/widgets/openBottomSheet.dart';
import 'package:budget/widgets/openPopup.dart';
import 'package:budget/widgets/framework/pageFramework.dart';
import 'package:budget/widgets/ratingPopup.dart';
import 'package:budget/widgets/showChangelog.dart';
import 'package:budget/widgets/tappable.dart';
import 'package:budget/widgets/textWidgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:budget/colors.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => AboutPageState();
}

class AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    bool fullScreenLayout = enableDoubleColumn(context);
    Color containerColor = appStateSettings["materialYou"]
        ? dynamicPastel(
            context, Theme.of(context).colorScheme.secondaryContainer,
            amountLight: 0.2, amountDark: 0.6)
        : getColor(context, "lightDarkAccent");

    Widget budgEaseInformation = Wrap(
      alignment: WrapAlignment.center,
      runAlignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: [
        Image(
          image: AssetImage("assets/icon/icon-small.png"),
          height: 70,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Tappable(
              borderRadius: getPlatform() == PlatformOS.isIOS ? 10 : 15,
              onLongPress: () {
                if (allowDebugFlags)
                  pushRoute(
                    context,
                    DebugPage(),
                  );
              },
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                    vertical: 3, horizontal: 10),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontFamily: appStateSettings["font"],
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Budg',
                        style: TextStyle(color: Color(0xFF4285F4)),
                      ),
                      TextSpan(
                        text: 'Ease',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                  vertical: 0, horizontal: 10),
              child: TextFont(
                text: getVersionString(),
                fontSize: 14,
                textAlign: TextAlign.center,
                maxLines: 5,
              ),
            ),
          ],
        )
      ],
    );

    return PageFramework(
      dragDownToDismiss: true,
      title: "about".tr(),
      listWidgets: [
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 15, vertical: 7),
          child: budgEaseInformation,
        ),
        SizedBox(height: 5),
        AboutLinks(containerColor: containerColor),
        SizedBox(height: 10),
        HorizontalBreak(),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 15, vertical: 7),
          child: AboutDeepLinking(),
        ),
      ],
    );
  }
}

void showChangelogForce(BuildContext context) {
  showChangelog(
    context,
    forceShow: true,
    majorChangesOnly: true,
    extraWidget: Padding(
      padding: const EdgeInsetsDirectional.only(
        bottom: 10,
      ),
      child: Button(
        label: "view-detailed-changelog".tr(),
        onTap: () {
          popRoute(context);
          pushRoute(context, DetailedChangelogPage());
        },
      ),
    ),
  );
}

void openOnBoarding(BuildContext context) {
  pushRoute(
    context,
    OnBoardingPage(
      popNavigationWhenDone: true,
    ),
  );
}

void deleteAllDataFlow(BuildContext context) {
  openPopup(
    context,
    title: "erase-everything".tr(),
    description: "erase-everything-description".tr(),
    icon: appStateSettings["outlinedIcons"]
        ? Icons.warning_outlined
        : Icons.warning_rounded,
    onExtraLabel2: "erase-synced-data-and-cloud-backups".tr(),
    onExtra2: () {
      popRoute(context);
      openBottomSheet(
        context,
        PopupFramework(
          title: "erase-cloud-data".tr(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 18,
                  start: 5,
                  end: 5,
                ),
                child: TextFont(
                  text: "erase-cloud-data-description".tr(),
                  fontSize: 16.5,
                  textAlign: TextAlign.center,
                  maxLines: 10,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: SyncCloudBackupButton(
                      onTap: () async {
                        popRoute(context);
                        pushRoute(context, AccountsPage());
                      },
                    ),
                  ),
                  SizedBox(width: 18),
                  Expanded(
                    child: BackupsCloudBackupButton(
                      onTap: () async {
                        popRoute(context);
                        pushRoute(context, AccountsPage());
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
    onSubmit: () async {
      popRoute(context);
      openPopup(
        context,
        title: "erase-everything-warning".tr(),
        description: "erase-everything-warning-description".tr(),
        icon: appStateSettings["outlinedIcons"]
            ? Icons.warning_amber_outlined
            : Icons.warning_amber_rounded,
        onSubmit: () async {
          popRoute(context);
          clearDatabase(context);
        },
        onSubmitLabel: "erase".tr(),
        onCancelLabel: "cancel".tr(),
        onCancel: () {
          popRoute(context);
        },
      );
    },
    onSubmitLabel: "erase".tr(),
    onCancelLabel: "cancel".tr(),
    onCancel: () {
      popRoute(context);
    },
  );
}

class AboutLinks extends StatelessWidget {
  const AboutLinks({required this.containerColor, Key? key}) : super(key: key);
  final Color containerColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 15, vertical: 5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          getPlatform() == PlatformOS.isIOS ? 10 : 15,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildTappable(
              context: context,
              isExternalLink: true,
              onTap: () => openUrl("https://github.com/jameskokoska/Cashew"),
              icon: MoreIcons.github,
              text: "app-is-open-source".tr(namedArgs: {"app": globalAppName}),
            ),
            // const HorizontalBreak(padding: EdgeInsetsDirectional.zero),
            // _buildTappable(
            //   context: context,
            //   isExternalLink: true,
            //   onTap: () => openUrl("https://cashewapp.web.app/faq.html"),
            //   icon: appStateSettings["outlinedIcons"]
            //       ? Icons.live_help_outlined
            //       : Icons.live_help_rounded,
            //   text: "guide-and-faq".tr(),
            // ),
            const HorizontalBreak(padding: EdgeInsetsDirectional.zero),
            _buildTappable(
              context: context,
              isExternalLink: false,
              onTap: () =>
                  openBottomSheet(context, RatingPopup(), fullSnap: true),
              icon: appStateSettings["outlinedIcons"]
                  ? Icons.rate_review_outlined
                  : Icons.rate_review_rounded,
              text: "feedback".tr(),
            ),
            const HorizontalBreak(padding: EdgeInsetsDirectional.zero),
            _buildTappable(
              context: context,
              isExternalLink: false,
              onTap: () => showChangelogForce(context),
              icon: appStateSettings["outlinedIcons"]
                  ? Icons.list_alt_outlined
                  : Icons.list_alt_rounded,
              text: "changelog".tr(),
            ),
            const HorizontalBreak(padding: EdgeInsetsDirectional.zero),
            _buildTappable(
              context: context,
              isExternalLink: false,
              onTap: () => openOnBoarding(context),
              icon: appStateSettings["outlinedIcons"]
                  ? Icons.door_front_door_outlined
                  : Icons.door_front_door_rounded,
              text: "view-app-intro".tr(),
            ),
            const HorizontalBreak(padding: EdgeInsetsDirectional.zero),
            _buildTappable(
              context: context,
              isExternalLink: false,
              onTap: () => pushRoute(context, PrivacyPolicyPage()),
              icon: appStateSettings["outlinedIcons"]
                  ? Icons.policy_outlined
                  : Icons.policy_rounded,
              text: "privacy-policy".tr(),
            ),
            const HorizontalBreak(padding: EdgeInsetsDirectional.zero),
            _buildTappable(
              context: context,
              isExternalLink: false,
              onTap: () => pushRoute(context, LicensesPage()),
              icon: appStateSettings["outlinedIcons"]
                  ? Icons.account_balance_outlined
                  : Icons.account_balance_rounded,
              text: "licenses".tr(),
            ),
            const HorizontalBreak(padding: EdgeInsetsDirectional.zero),
            _buildTappable(
              context: context,
              isExternalLink: false,
              onTap: () => deleteAllDataFlow(context),
              icon: appStateSettings["outlinedIcons"]
                  ? Icons.delete_sweep_outlined
                  : Icons.delete_sweep_rounded,
              text: "delete-all-data".tr(),
              color: Colors.red.withOpacity(0.4),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTappable(
      {required BuildContext context,
      required VoidCallback onTap,
      required IconData icon,
      required String text,
      required bool isExternalLink,
      Color? color}) {
    return Tappable(
      onTap: onTap,
      borderRadius: 0,
      color: color ?? containerColor,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 18, end: 18, top: 11, bottom: 11),
        child: Row(
          children: [
            Icon(
              icon,
              size: 25,
              color: Theme.of(context).colorScheme.secondary,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFont(
                text: text,
                fontSize: 17,
                maxLines: 5,
              ),
            ),
            Icon(
              isExternalLink
                  ? appStateSettings["outlinedIcons"]
                      ? Icons.open_in_new_outlined
                      : Icons.open_in_new_rounded
                  : appStateSettings["outlinedIcons"]
                      ? Icons.keyboard_arrow_right_outlined
                      : Icons.keyboard_arrow_right_rounded,
              size: 22,
              color: getColor(context, "black").withOpacity(0.3),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutDeepLinking extends StatelessWidget {
  const AboutDeepLinking({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFont(
          text: "deep-linking".tr(),
          fontSize: 20,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
          maxLines: 5,
        ),
        SizedBox(height: 10),
        TextFont(
          text: "deep-linking-description".tr(),
          fontSize: 16,
          textAlign: TextAlign.center,
          maxLines: 10,
        ),
        SizedBox(height: 10),
        Tappable(
          onTap: () {
            openUrl(
                "https://github.com/jameskokoska/Cashew?tab=readme-ov-file#app-links");
          },
          child: TextFont(
            text: "learn-more".tr(),
            textColor: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}

// Note that this is different than forceDeleteDB()
Future clearDatabase(BuildContext context) async {
  openLoadingPopup(context);
  await Future.wait([database.deleteEverything(), sharedPreferences.clear()]);
  await database.close();
  popRoute(context);
  restartAppPopup(context);
}