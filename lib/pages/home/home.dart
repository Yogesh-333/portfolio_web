import 'package:YK_portfolio/pages/home/components/FlutterAppRoobai.dart';
import 'package:YK_portfolio/pages/home/components/Links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:YK_portfolio/pages/home/components/carousel.dart';
import 'package:YK_portfolio/pages/home/components/cv_section.dart';
import 'package:YK_portfolio/pages/home/components/education_section.dart';
import 'package:YK_portfolio/pages/home/components/experience_section%20.dart';
import 'package:YK_portfolio/pages/home/components/footer.dart';
import 'package:YK_portfolio/pages/home/components/header.dart';
import 'package:YK_portfolio/pages/home/components/FlutterAppIHL.dart';
import 'package:YK_portfolio/pages/home/components/portfolio_stats.dart';
import 'package:YK_portfolio/pages/home/components/skill_section.dart';
import 'package:YK_portfolio/pages/home/components/testimonial_widget.dart';
import 'package:YK_portfolio/pages/home/components/website_ad.dart';
import 'package:YK_portfolio/utils/constants.dart';
import 'package:YK_portfolio/utils/globals.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: Globals.scaffoldKey,
        endDrawer: Drawer(
          backgroundColor: kBackgroundColor.withOpacity(0.5),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 24.0,
              ),
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return headerItems[index].isButton
                      ? MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Container(
                            decoration: BoxDecoration(
                              color: kDangerColor,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 28.0),
                            child: TextButton(
                              onPressed: headerItems[index].onTap,
                              child: Text(
                                headerItems[index].title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
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
                              onTap: () {
                                _scrollToSection(headerItems[index].Gkey);
                              },
                              child: Text(
                                headerItems[index].title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 50.0,
                  );
                },
                itemCount: headerItems.length,
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60), // Height of the Header
                    Carousel(),
                    SizedBox(height: 20.0),
                    CvSection(),
                    FlutterAppIHL(),
                    SizedBox(height: 70.0),
                    BackednAd(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 28.0),
                      child: PortfolioStats(),
                    ),
                    SizedBox(height: 50.0),
                    FlutterAppRoobai(),
                    SizedBox(height: 70.0),
                    EducationSection(),
                    SizedBox(height: 50.0),
                    SkillSection(),
                    SizedBox(height: 50.0),
                    ExperienceSection(),
                    Links(),
                    SizedBox(height: 50.0),
                    TestimonialWidget(),
                    Footer(),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Header(),
            ),
          ],
        ),
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
