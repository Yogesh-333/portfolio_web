import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:YK_portfolio/utils/constants.dart';
import 'package:YK_portfolio/utils/screen_helper.dart';
import 'package:url_launcher/url_launcher.dart';

final List<Map<String, String>> links = [
  {
    "name": "LinkedIn",
    "image": "assets/LinkedIn.png",
    "url": "https://www.linkedin.com/in/yogeshkumar333/"
  },
  {
    "name": "GitHub",
    "image": "assets/GitHub.png",
    "url": "https://github.com/yogeshkumar333"
  },
  {
    "name": "Blog",
    "image": "assets/Blogger.png",
    "url": "https://medium.com/@yogeshkumar333"
  },
];

class Links extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50.0),
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
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
        builder: (BuildContext context, BoxConstraints constraints) {
          return Wrap(
            runSpacing: 20.0,
            spacing: 20.0,
            children: links.map((link) {
              return Container(
                height: 80.0,
                width: ScreenHelper.isMobile(context)
                    ? constraints.maxWidth / 3.0 - 50.0
                    : constraints.maxWidth / 5.0 - 50.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.all(8.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    final url = link["url"]!;
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(link["image"]!, height: 80.0),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    ),
  );
}
