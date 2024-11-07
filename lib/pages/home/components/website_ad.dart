import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:YK_portfolio/utils/constants.dart';
import 'package:YK_portfolio/utils/screen_helper.dart';

class BackednAd extends StatelessWidget {
  // We can use same idea as ios_app_ad.dart and swap children order, let's copy code
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "BACK-END",
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
                          "H-Pod",
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
                          "Developed a robust Cloud based backend system for IHL applications, focusing on API creation and database management. Implemented secure user authentication and optimized server performance.",
                          style: TextStyle(
                            color: kCaptionColor,
                            height: 1.5,
                            fontSize: 15.0,
                          ),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        Row(
                          children: [
                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                height: 48.0,
                                width: 160,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 28.0,
                                ),
                                child: TextButton(
                                  onPressed: () async {
                                    await launchUrl(Uri.parse(
                                        'https://dashboard.indiahealthlink.com/dashboard'));
                                  },
                                  child: Center(
                                    child: Row(
                                      children: [
                                        Icon(Icons.public, color: Colors.white),
                                        SizedBox(width: 5.0),
                                        Text(
                                          "Website",
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
                                      _buildIHLHPODDetailsDialog(context),
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
                        SizedBox(
                          height: 70.0,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 25.0,
                  ),
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
                        "assets/laptop.png",
                        "assets/hpod/images-0.jpg",
                        "assets/hpod/images-1.jpg",
                        "assets/hpod/images-2.jpg",
                        "assets/hpod/images-3.jpg",
                        "assets/hpod/images-4.jpg",
                        "assets/hpod/images-5.jpg",
                        "assets/hpod/images-6.jpg",
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// In website_ad.dart

Widget _buildIHLHPODDetailsDialog(BuildContext context) {
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
          "Project Name: IHL HPOD",
          style: GoogleFonts.oswald(
            color: kPrimaryColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Description: A health kiosk system designed to integrate with the IHL platform, supporting data-driven health monitoring and patient data management.",
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
          "- Developed backend APIs for secure health data exchange.\n"
          "- Led VAPT certifications to ensure data security.\n"
          "- Integrated ABHA for seamless health information access.\n"
          "- Migrated backend services to Azure Functions for scalability.\n"
          "- Utilized Power Automate for workflow automation.\n"
          "- Led sprints, mentored team members, and managed stakeholder interactions.\n",
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
