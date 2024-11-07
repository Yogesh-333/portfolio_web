import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:YK_portfolio/models/Experience.dart';
import 'package:YK_portfolio/utils/constants.dart';
import 'package:YK_portfolio/utils/screen_helper.dart';

final GlobalKey ExperienceSectionKey = GlobalKey();
final List<Experience> ExperienceList = [
  Experience(
    description:
        "Leading the team with current project development of Aila Money, a secure, user-friendly financial app that empowers users to manage their finances efficiently.",
    period: "2024 - PRESENT Technical Lead at G19 Studio",
  ),
  Experience(
    description:
        "Enhanced development efficiency by 30% through cross-functional collaboration and Agile methodologies. Led R&D in Generative AI and designed backend systems with C#/.NET, robust APIs, and error handling. Directed a secure healthcare data consent management project, ensuring privacy and compliance.",
    period: "2023 - 2024 Assistant Engineering Manager at India Health Link",
  ),
  Experience(
    description:
        "Developed hybrid cloud infrastructure and cloud-native data pipelines for AWS and Azure, leading VAPT Certification. Built and deployed cloud applications, microservices, and secure ABHA login systems. Managed API design, data integration, and encryption for healthcare data, improving organization and mitigating high-risk vulnerabilities.",
    period: "2022 - 2023 Cloud Development Engineer at India Health Link",
  ),
  Experience(
    description:
        "Proficient in full-stack development, integrating RESTful APIs and managing databases. Developed cross-platform apps with Flutter, including health tracking and teleconsultation features, integrating Google Fit, Apple HealthKit, and SSO solutions. Skilled in API design, OAuth2.0, and real-time data handling with Firestore and Firebase.",
    period: "2021 - 2022 Full-Stack Developer at India Health Link",
  ),
  Experience(
    description:
        "Expert in Flutter for building cross-platform apps with a focus on UI/UX design, API integration, and real-time features. Developed teleconsultation functionalities, including real-time video chat with Jitsi SDK and data synchronization with Firestore and Firebase. Strong debugging and testing skills ensure robust and efficient applications.",
    period: "2020 - 2021 Mobile Developer at India Health Link ",
  ),
];

class ExperienceSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      key: ExperienceSectionKey,
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth),
        tablet: _buildUi(kTabletMaxWidth),
        mobile: _buildUi(getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(double width) {
    return ResponsiveBreakpoints(
      breakpoints: [
        Breakpoint(start: 0, end: 480, name: MOBILE),
        Breakpoint(start: 481, end: 1200, name: TABLET),
        Breakpoint(start: 1201, end: double.infinity, name: DESKTOP),
      ],
      child: Container(
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Experience",
              style: GoogleFonts.oswald(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 30.0,
                height: 1.3,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Wrap(
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: 500.0),
                  child: Text(
                    "'Experience is the teacher of all things.'— Julius Caesar",
                    style: TextStyle(
                      color: kPrimaryColor,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  child: Wrap(
                    spacing: 20.0,
                    runSpacing: 20.0,
                    children: ExperienceList.map(
                      (Experience) => Container(
                        width: constraints.maxWidth / 2.0 - 20.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              Experience.period,
                              style: GoogleFonts.oswald(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.0,
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              Experience.description,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: kCaptionColor,
                                height: 1.5,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                          ],
                        ),
                      ),
                    ).toList(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
