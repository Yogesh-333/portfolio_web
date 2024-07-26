import 'package:YK_portfolio/pages/home/components/carousel.dart';
import 'package:YK_portfolio/pages/home/components/education_section.dart';
import 'package:YK_portfolio/pages/home/components/experience_section%20.dart';
import 'package:YK_portfolio/pages/home/components/footer.dart';
import 'package:YK_portfolio/pages/home/components/ios_app_ad.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:YK_portfolio/models/header_item.dart';
import 'package:YK_portfolio/utils/constants.dart';
import 'package:YK_portfolio/utils/email_sender.dart';
import 'package:YK_portfolio/utils/globals.dart';
import 'package:YK_portfolio/utils/screen_helper.dart';

List<HeaderItem> headerItems = [
  HeaderItem(title: "HOME", onTap: () {}, Gkey: CarouselKey),
  HeaderItem(title: "Projects", onTap: () {}, Gkey: FlutterAppAdKey),
  HeaderItem(title: "Education", onTap: () {}, Gkey: EducationSectionKey),
  HeaderItem(title: "Experience", onTap: () {}, Gkey: ExperienceSectionKey),
  HeaderItem(title: "Info", onTap: () {}, Gkey: FooterKey),
  //HeaderItem(title: "TESTIMONIALS", onTap: () {}),
  // HeaderItem(title: "BLOGS", onTap: () {}),
  HeaderItem(
      title: "HIRE ME",
      onTap: () async {
        await launchUrl(Uri.parse('$mailtoLink'));
      },
      isButton: true,
      Gkey: CarouselKey //dummy
      ),
];

class HeaderLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {},
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "YK",
                  style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ".",
                  style: GoogleFonts.oswald(
                    color: kPrimaryColor,
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HeaderRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveVisibility(
      visible: false,
      visibleConditions: [
        Condition.largerThan(name: MOBILE),
      ],
      child: Row(
        children: headerItems
            .map(
              (item) => item.isButton
                  ? MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        decoration: BoxDecoration(
                          color: kDangerColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        child: TextButton(
                          onPressed: item.title == "HIRE ME"
                              ? item.onTap
                              : () {
                                  _scrollToSection(item.Gkey);
                                },
                          child: Text(
                            item.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  : MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        margin: EdgeInsets.only(right: 30.0),
                        child: GestureDetector(
                          onTap: item.title == "HIRE ME"
                              ? item.onTap
                              : () {
                                  _scrollToSection(item.Gkey);
                                },
                          child: Text(
                            item.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
            )
            .toList(),
      ),
    );
  }
}

_scrollToSection(GlobalKey<State<StatefulWidget>> gkey) {
  Scrollable.ensureVisible(
    gkey.currentContext!,
    duration: Duration(seconds: 1),
    curve: Curves.easeInOut,
  );
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: buildHeader(),
        ),
        // We will make this in a bit
        mobile: buildMobileHeader(),
        tablet: buildHeader(),
      ),
    );
  }

  // mobile header
  Widget buildMobileHeader() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Restart server to make icons work
            // Lets make a scaffold key and create a drawer
            GestureDetector(
              onTap: () {
                // Lets open drawer using global key
                Globals.scaffoldKey.currentState?.openEndDrawer();
              },
              child: Icon(
                FontAwesomeIcons.bars,
                color: Colors.white,
                size: 28.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  // Lets plan for mobile and smaller width screens
  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderRow(),
        ],
      ),
    );
  }
}
