import 'package:YK_portfolio/utils/email_sender.dart';
import 'package:blobs/blobs.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:YK_portfolio/pages/home/components/carousel_items.dart';
import 'package:YK_portfolio/utils/constants.dart';
import 'package:YK_portfolio/utils/screen_helper.dart';
import 'package:url_launcher/url_launcher.dart';

final GlobalKey CarouselKey = GlobalKey();

class Carousel extends StatelessWidget {
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
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ResponsiveBreakpoints(
            breakpoints: [
              Breakpoint(start: 0, end: 480, name: MOBILE),
              Breakpoint(start: 481, end: 1200, name: TABLET),
              Breakpoint(start: 1201, end: double.infinity, name: DESKTOP),
            ],
            child: Flex(
              direction: ScreenHelper.isMobile(context)
                  ? Axis.vertical
                  : Axis.horizontal,
              children: [
                Expanded(
                  flex: ScreenHelper.isMobile(context) ? 0 : 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "TECH LEAD / SOFTWARE ENGINEER",
                        style: GoogleFonts.oswald(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: 18.0,
                      ),
                      Text(
                        "YOGESH\nKUMAR",
                        style: GoogleFonts.oswald(
                          color: Colors.white,
                          fontSize: 40.0,
                          fontWeight: FontWeight.w900,
                          height: 1.3,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Application Developer, based in Canada",
                        style: TextStyle(
                          color: kCaptionColor,
                          fontSize: 15.0,
                          height: 1.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        child: Wrap(
                          children: [
                            Text(
                              "Need a full custom mobile / web app ?",
                              style: TextStyle(
                                color: kCaptionColor,
                                fontSize: 15.0,
                                height: 1.5,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: Text(
                                  " Got a project ?",
                                  style: TextStyle(
                                    height: 1.5,
                                    color: Colors.white,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          height: 48.0,
                          padding: EdgeInsets.symmetric(
                            horizontal: 28.0,
                          ),
                          child: TextButton(
                            onPressed: () async {
                              await launchUrl(Uri.parse('$mailtoLink'));
                            },
                            child: Text(
                              "GET STARTED",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  flex: ScreenHelper.isMobile(context) ? 0 : 3,
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 600.0, // Set maximum width
                        maxHeight: 600.0, // Set maximum height
                      ),
                      child: Stack(
                        children: [
                          Blob.animatedRandom(
                            size: 700,
                            edgesCount: 5,
                            minGrowth: 4,
                            loop: true,
                            duration: Duration(milliseconds: 1700),
                            styles: BlobStyles(
                              color: Colors.green,
                              fillType: BlobFillType.stroke,
                              gradient: LinearGradient(
                                      colors: [Colors.red, Colors.green])
                                  .createShader(Rect.fromLTRB(0, 0, 300, 300)),
                              strokeWidth: 3,
                            ),
                          ),
                          Blob.animatedRandom(
                            size: 700,
                            edgesCount: 5,
                            minGrowth: 4,
                            loop: true,
                            duration: Duration(milliseconds: 1500),
                            styles: BlobStyles(
                              color: Colors.green,
                              fillType: BlobFillType.stroke,
                              gradient: LinearGradient(colors: [
                                Color.fromARGB(255, 211, 202, 37),
                                Color.fromARGB(255, 114, 139, 230)
                              ]).createShader(Rect.fromLTRB(0, 0, 300, 300)),
                              strokeWidth: 3,
                            ),
                          ),
                          Blob.animatedRandom(
                            size: 170,
                            edgesCount: 5,
                            minGrowth: 4,
                            loop: true,
                            duration: Duration(milliseconds: 1000),
                            styles: BlobStyles(
                              fillType: BlobFillType.fill,
                              gradient: LinearGradient(colors: [
                                const Color.fromARGB(255, 177, 244, 54),
                                Color.fromARGB(255, 175, 76, 89),
                                const Color.fromARGB(255, 76, 78, 175)
                              ]).createShader(Rect.fromLTRB(0, 0, 300, 300)),
                              strokeWidth: 3,
                            ),
                          ),
                          Container(
                            child: Image.asset(
                              "assets/person.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

///Unwanted code below just for future reference
// Big screens
Widget _buildDesktop(BuildContext context, Widget text, Widget image) {
  return ResponsiveBreakpoints(
      breakpoints: [
        Breakpoint(start: 0, end: 480, name: MOBILE),
        Breakpoint(start: 481, end: 1200, name: TABLET),
        Breakpoint(start: 1201, end: double.infinity, name: DESKTOP),
      ],
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: text,
            ),
            Expanded(
              child: image,
            )
          ],
        ),
      ));
}

// Mid screens
Widget _buildTablet(BuildContext context, Widget text, Widget image) {
  return ResponsiveBreakpoints(
    breakpoints: [
      Breakpoint(start: 0, end: 480, name: MOBILE),
      Breakpoint(start: 481, end: 1200, name: TABLET),
      Breakpoint(start: 1201, end: double.infinity, name: DESKTOP),
    ],
    child: Center(
      child: Row(
        children: [
          Expanded(
            child: text,
          ),
          Expanded(
            child: image,
          )
        ],
      ),
    ),
  );
}

// SMall Screens

Widget _buildMobile(BuildContext context, Widget text, Widget image) {
  return Container(
    constraints: BoxConstraints(
      maxWidth: getMobileMaxWidth(context),
    ),
    width: double.infinity,
    child: text,
  );
}
