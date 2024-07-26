import 'package:blobs/blobs.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:YK_portfolio/models/skill.dart';
import 'package:YK_portfolio/utils/constants.dart';
import 'package:YK_portfolio/utils/screen_helper.dart';

List<Skill> skills = [
  Skill(
    skill: "Dart",
    percentage: 75,
  ),
  Skill(
    skill: "C#",
    percentage: 70,
  ),
  Skill(
    skill: ".NET",
    percentage: 60,
  ),
  Skill(
    skill: "Flutter",
    percentage: 70,
  ),
  Skill(
    skill: "Azure",
    percentage: 35,
  ),
  Skill(
    skill: "AWS",
    percentage: 30,
  ),
  Skill(
    skill: "Team Management",
    percentage: 40,
  ),
];

class SkillSection extends StatelessWidget {
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
                  flex: ScreenHelper.isMobile(context) ? 0 : 2,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 400.0, // Set maximum width
                      maxHeight: 400.0, // Set maximum height
                    ),
                    child: Stack(
                      children: [
                        Blob.animatedRandom(
                          size: 500,
                          edgesCount: 5,
                          minGrowth: 4,
                          loop: true,
                          duration: Duration(milliseconds: 1700),
                          styles: BlobStyles(
                            color: Colors.green,
                            fillType: BlobFillType.fill,
                            gradient: LinearGradient(colors: [
                              Colors.red,
                              const Color.fromARGB(255, 160, 175, 76)
                            ]).createShader(Rect.fromLTRB(0, 0, 300, 300)),
                            strokeWidth: 3,
                          ),
                        ),
                        Blob.animatedRandom(
                          size: 400,
                          edgesCount: 5,
                          minGrowth: 4,
                          loop: true,
                          duration: Duration(milliseconds: 1500),
                          styles: BlobStyles(
                            color: Colors.green,
                            fillType: BlobFillType.fill,
                            gradient: LinearGradient(colors: [
                              Color.fromARGB(255, 244, 54, 162),
                              Color.fromARGB(255, 122, 236, 80),
                              Color.fromARGB(255, 108, 110, 233)
                            ]).createShader(Rect.fromLTRB(0, 100, 200, 300)),
                            strokeWidth: 3,
                          ),
                        ),
                        Blob.animatedRandom(
                          size: 120,
                          edgesCount: 5,
                          minGrowth: 4,
                          loop: true,
                          duration: Duration(milliseconds: 1000),
                          styles: BlobStyles(
                            fillType: BlobFillType.stroke,
                            gradient: LinearGradient(colors: [
                              Color.fromARGB(255, 244, 54, 162),
                              Color.fromARGB(255, 122, 236, 80),
                              Color.fromARGB(255, 0, 3, 176)
                            ]).createShader(Rect.fromLTRB(0, 0, 300, 300)),
                            strokeWidth: 3,
                          ),
                        ),
                        Center(
                          child: Container(
                            child: Image.asset(
                              "assets/person_small.png",
                              fit: BoxFit
                                  .contain, // Adjust how the image fits within the constraints
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 50.0,
                ),
                Expanded(
                  flex: ScreenHelper.isMobile(context) ? 0 : 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "SKILLS",
                        style: GoogleFonts.oswald(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 28.0,
                          height: 1.3,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "Showcasing a diverse set of technical skills honed through extensive experience in software development and problem-solving.",
                        style: TextStyle(
                          color: kCaptionColor,
                          height: 1.5,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Column(
                        children: skills
                            .map(
                              (skill) => Container(
                                margin: EdgeInsets.only(bottom: 15.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: skill.percentage,
                                      child: Container(
                                        padding: EdgeInsets.only(left: 10.0),
                                        alignment: Alignment.centerLeft,
                                        height: 38.0,
                                        child: Text(skill.skill),
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Expanded(
                                      // remaining (blank part)
                                      flex: 100 - skill.percentage,
                                      child: Divider(
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      "${skill.percentage}%",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
