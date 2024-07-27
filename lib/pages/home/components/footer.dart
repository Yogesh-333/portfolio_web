import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:YK_portfolio/models/footer_item.dart';
import 'package:YK_portfolio/utils/constants.dart';
import 'package:YK_portfolio/utils/email_sender.dart';
import 'package:YK_portfolio/utils/screen_helper.dart';

final GlobalKey FooterKey = GlobalKey();
final List<FooterItem> footerItems = [
  FooterItem(
      iconPath: "assets/mappin.png",
      title: "ADDRESS",
      text1: "Kitchener, Canada",
      onTap: () {}),
  FooterItem(
      iconPath: "assets/phone.png",
      title: "PHONE",
      text1: "+1 416-824-9791",
      onTap: () {}),
  FooterItem(
    iconPath: "assets/email.png",
    title: "EMAIL",
    text1: "yogeshgopalofficial@gmail.com",
    onTap: () async {
      await launchUrl(Uri.parse('$mailtoLink'));
    },
  ),
  FooterItem(
    iconPath: "assets/whatsapp.png",
    title: "WHATSAPP",
    text1: "+91 7010941276",
    onTap: () async {
      await launchUrl(Uri.parse('https://wa.me/917010941276'));
    },
  )
];

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        key: FooterKey,
        child: ScreenHelper(
          desktop: _buildUi(kDesktopMaxWidth, context),
          tablet: _buildUi(kTabletMaxWidth, context),
          mobile: _buildUi(getMobileMaxWidth(context), context),
        ),
      ),
    );
  }
}

Widget _buildUi(double width, BuildContext context) {
  return Center(
    child: ResponsiveBreakpoints(
      breakpoints: [
        Breakpoint(start: 0, end: 480, name: MOBILE),
        Breakpoint(start: 481, end: 1200, name: TABLET),
        Breakpoint(start: 1201, end: double.infinity, name: DESKTOP),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50.0),
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: footerItems
                      .map(
                        (footerItem) => Container(
                          height: 120.0,
                          width: ScreenHelper.isMobile(context)
                              ? constraints.maxWidth / 2.0 - 20.0
                              : constraints.maxWidth / 4.0 - 20.0,
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      footerItem.iconPath,
                                      width: 25.0,
                                    ),
                                    SizedBox(
                                      width: 15.0,
                                    ),
                                    Text(
                                      footerItem.title,
                                      style: GoogleFonts.oswald(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    footerItem.onTap();
                                  },
                                  child: RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "${footerItem.text1}\n",
                                          style: TextStyle(
                                            color: kCaptionColor,
                                            height: 1.8,
                                          ),
                                        ),
                                        // You can add more TextSpans here if needed
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Flex(
                direction: ScreenHelper.isMobile(context)
                    ? Axis.vertical
                    : Axis.horizontal,
                mainAxisAlignment: ScreenHelper.isMobile(context)
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Copyright (c) 2024 Yogesh Kumar. All rights Reserved",
                      style: TextStyle(
                        color: kCaptionColor,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Text(
                            "Privacy Policy",
                            style: TextStyle(
                              color: kCaptionColor,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "|",
                          style: TextStyle(
                            color: kCaptionColor,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Text(
                            "Terms & Conditions",
                            style: TextStyle(
                              color: kCaptionColor,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          );
        },
      ),
    ),
  );
}
