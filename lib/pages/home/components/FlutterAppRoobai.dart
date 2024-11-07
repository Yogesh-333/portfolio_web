import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:YK_portfolio/utils/constants.dart';
import 'package:YK_portfolio/utils/screen_helper.dart';

final GlobalKey FlutterAppAdKey = GlobalKey();

class FlutterAppRoobai extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth),
        tablet: _buildUi(kTabletMaxWidth),
        mobile: _buildUi(getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(double width) {
    return Center(
      key: FlutterAppAdKey,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ResponsiveBreakpoints(
            breakpoints: [
              Breakpoint(start: 0, end: 480, name: MOBILE),
              Breakpoint(start: 481, end: 1200, name: TABLET),
              Breakpoint(start: 1201, end: double.infinity, name: DESKTOP),
            ],
            child: Container(
              child: Flex(
                direction: constraints.maxWidth > 720
                    ? Axis.horizontal
                    : Axis.vertical,
                children: [
                  // Disable expanded on smaller screen to avoid Render errors by setting flex to 0
                  Expanded(
                    flex: constraints.maxWidth > 720.0 ? 1 : 0,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: constraints.maxWidth > 720.0 ? null : 350.0,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 2),
                        aspectRatio: 1.5,
                        enlargeCenterPage: true,
                      ),
                      items: [
                        "assets/roobai/image-1.png",
                        "assets/roobai/image-2.png",
                        "assets/roobai/image-3.png",
                        "assets/roobai/image-4.png",
                        "assets/roobai/image-5.png",
                        "assets/roobai/image-6.png",
                      ].map((imagePath) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Image.asset(
                              imagePath,
                              width:
                                  constraints.maxWidth > 720.0 ? null : 350.0,
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  Expanded(
                    flex: constraints.maxWidth > 720.0 ? 1 : 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Flutter (Android / IOS) APP - Migrated from native",
                          style: GoogleFonts.oswald(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "Roobai APP",
                          style: GoogleFonts.oswald(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            height: 1.3,
                            fontSize: 35.0,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Roobai.com is a one stop platform of Loots, Deals, Offers and Coupons in the world of online shopping.",
                          style: TextStyle(
                            color: kCaptionColor,
                            height: 1.5,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Row(
                          children: [
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: kPrimaryColor,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      height: 48.0,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 28.0),
                                      child: TextButton(
                                        onPressed: () async {
                                          await launchUrl(Uri.parse(
                                              'https://play.google.com/store/apps/details?id=com.roobai&hl=ln'));
                                        },
                                        child: Center(
                                          child: Row(
                                            children: [
                                              Icon(Icons.android,
                                                  color: Colors.white),
                                              SizedBox(width: 8.0),
                                              Text(
                                                "Android",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 20.0),
                                  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: kPrimaryColor,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      height: 48.0,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 28.0),
                                      child: TextButton(
                                        onPressed: () async {
                                          await launchUrl(Uri.parse(
                                              'https://apps.apple.com/in/app/roobai-instant-loot-deals/id1329408096?platform=iphone'));
                                        },
                                        child: Center(
                                          child: Row(
                                            children: [
                                              Icon(Icons.apple,
                                                  color: Colors.white),
                                              SizedBox(width: 8.0),
                                              Text(
                                                "IOS",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            _buildRoobaiMigrationDetailsDialog(
                                                context),
                                      );
                                    },
                                    child: MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: Text(
                                        "Know More >>>",
                                        style: TextStyle(
                                          color: kPrimaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget _buildRoobaiMigrationDetailsDialog(BuildContext context) {
  return AlertDialog(
    backgroundColor: kBackgroundColor,
    title: Text(
      "Project Details",
      style: GoogleFonts.oswald(
        color: Colors.white,
        fontWeight: FontWeight.w900,
      ),
    ),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Project Name: Roobai Native to Flutter Migration",
          style: GoogleFonts.oswald(
            color: kPrimaryColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Description: Migration of an e-commerce platform from native mobile development to Flutter, enhancing performance and feature consistency across platforms.",
          style: TextStyle(color: kCaptionColor),
        ),
        SizedBox(height: 16),
        Text(
          "My Contributions:",
          style: GoogleFonts.oswald(
            color: kPrimaryColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "- Independently migrated the app from native to Flutter within a tight timeline.\n"
          "- Implemented additional features for improved user engagement.\n"
          "- Optimized the app’s performance and ensured consistency across iOS and Android.\n",
          style: TextStyle(color: kCaptionColor),
        ),
      ],
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context, 'OK'),
        child: const Text(
          'OK',
          style: TextStyle(color: Colors.white),
        ),
      ),
    ],
  );
}
