import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:YK_portfolio/utils/constants.dart';
import 'package:YK_portfolio/utils/screen_helper.dart';

final GlobalKey FlutterAppAdKey = GlobalKey();

class FlutterAppAd extends StatelessWidget {
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
                        "assets/1.jpg",
                        "assets/2.jpg",
                        "assets/3.jpg",
                        "assets/4.jpg",
                        "assets/5.jpg",
                        "assets/6.jpg",
                        "assets/7.jpg",
                        "assets/8.jpg",
                        "assets/9.jpg",
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
                          "Flutter (Android / IOS) APP",
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
                          "H - Care APP",
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
                          "HCare comes from the idea to provide primary and preventive care to everyone in India. The IHL platform makes getting healthy, fun and rewarding.",
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
                                              'https://play.google.com/store/apps/details?id=com.indiahealthlink.ihlhealth'));
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
                                              'https://apps.apple.com/us/app/hcare/id1531266761'));
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
