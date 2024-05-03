import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sample_portfolio_app/src/presentation/widgets/textStyles.dart';

import '../../constants/colors.dart';

class SkillItem extends StatelessWidget {
  final String skillName;
  final double progress;

  const SkillItem({required this.skillName, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            skillName,
            style: commonTextStyles(AppColors.headline, 20, FontWeight.w600),
          ),
          Container(
            margin: const EdgeInsets.only(top: 9.0, bottom: 25),
            width: MediaQuery.of(context).size.width,
            height: 17,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: AppColors
                    .skillcolor, // Background color of the progress bar
                valueColor: const AlwaysStoppedAnimation<Color>(
                    Colors.blue), // Progress color
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AboutMeSection extends StatefulWidget {
  const AboutMeSection({super.key});

  @override
  State<AboutMeSection> createState() => _AboutMeSectionState();
}

class _AboutMeSectionState extends State<AboutMeSection> {
  final List<Map<String, dynamic>> skills = [
    {'name': 'User Experience Design - UI/UX', 'progress': 0.9},
    {'name': 'Web & User Interface Design - Development', 'progress': 9.6},
    {'name': 'Interaction Design - Animation', 'progress': 0.8},
  ];

  List<String> tabs = ["Main Skills", "Awards", "Education"];

  double _progress = 60.0;

  aboutMeForDesktop() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 83),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 30),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.borderColor)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(300),
              child: Image.asset(
                fit: BoxFit.contain,
                "assets/images/background.jpg",
                width: 527,
                height: 623,
              ),
            ),
          ),
          Flexible(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 619),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10.0, top: 100),
                    child: Text(
                      "About Me",
                      style: commonTextStyles(
                          AppColors.nameColor, 25, FontWeight.w600),
                    ),
                  ),
                  RichText(
                    maxLines: 2,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: '20 Year’s Experience on ',
                          style: commonTextStyles(
                              AppColors.nameColor, 50, FontWeight.w700),
                        ),
                        TextSpan(
                          text: 'Product Design\n',
                          style: commonTextStyles(
                              AppColors.headline, 50, FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 25.0, bottom: 40),
                    child: Text(
                      "Hello there! I'm Robert Junior. I specialize in web design and development, and I'm deeply passionate and committed to my craft. With 20 years of experience as a professional graphic designer",
                      style: commonTextStyles(
                          AppColors.headline, 18, FontWeight.w400),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  /// tabbar and tabbarview
                  TabBar(
                      indicator: BoxDecoration(
                        color: AppColors.nameColor, // Color of the indicator
                        borderRadius:
                            BorderRadius.circular(50), // Rounded corners
                      ),
                      isScrollable: true,
                      labelStyle: commonTextStyles(
                          AppColors.whiteColor, 20, FontWeight.w600),
                      unselectedLabelStyle: commonTextStyles(
                          AppColors.nameColor, 20, FontWeight.w600),
                      labelColor: AppColors.whiteColor,
                      unselectedLabelColor: AppColors.nameColor,
                      indicatorSize: TabBarIndicatorSize.tab,
                      onTap: (index) {
                        // setState(() {
                        //   currentIndex = index;
                        // });
                      },
                      tabs: List.generate(
                          tabs.length,
                          (index) => Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                        width: 1.0,
                                        color: AppColors.nameColor)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(30, 13, 30, 13),
                                  child: Text(
                                    tabs[index],
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ))),
                  SizedBox(
                      height: 364,
                      child: TabBarView(
                          children: List.generate(
                              tabs.length,
                              (index) => ListView.builder(
                                  itemCount: skills.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return SkillItem(
                                      skillName: skills[index]['name'],
                                      progress: skills[index]['progress'],
                                    );
                                  }))))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  aboutMeForMobile() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 30),
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.borderColor)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(300),
              child: Image.asset(
                fit: BoxFit.contain,
                "assets/images/background.jpg",
                width: 350,
                height: 347,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 10.0, top: 30),
            child: Text(
              "About Me",
              textAlign: TextAlign.center,
              style: commonTextStyles(AppColors.nameColor, 25, FontWeight.w600),
            ),
          ),
          RichText(
            maxLines: 2,
            textAlign: TextAlign.center,
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: '20 Year’s Experience on ',
                  style: commonTextStyles(
                      AppColors.nameColor, 50, FontWeight.w700),
                ),
                TextSpan(
                  text: 'Product Design\n',
                  style:
                      commonTextStyles(AppColors.headline, 50, FontWeight.w700),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 25.0, bottom: 50),
            child: Text(
              "Hello there! I'm Robert Junior. I specialize in web design and development, and I'm deeply passionate and committed to my craft. With 20 years of experience as a professional graphic designer",
              style: commonTextStyles(AppColors.headline, 18, FontWeight.w400),
              maxLines: 4,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          /// tabbar and tabbarview
          TabBar(
              indicator: BoxDecoration(
                color: AppColors.nameColor, // Color of the indicator
                borderRadius: BorderRadius.circular(50), // Rounded corners
              ),
              isScrollable: true,
              labelStyle:
                  commonTextStyles(AppColors.whiteColor, 20, FontWeight.w600),
              unselectedLabelStyle:
                  commonTextStyles(AppColors.nameColor, 20, FontWeight.w600),
              labelColor: AppColors.whiteColor,
              unselectedLabelColor: AppColors.nameColor,
              indicatorSize: TabBarIndicatorSize.tab,
              onTap: (index) {
                // setState(() {
                //   currentIndex = index;
                // });
              },
              tabs: List.generate(
                  tabs.length,
                  (index) => Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                                width: 1.0, color: AppColors.nameColor)),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(30, 13, 30, 13),
                          child: Text(
                            tabs[index],
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ))),
          SizedBox(
              height: 364,
              child: TabBarView(
                  children: List.generate(
                      tabs.length,
                      (index) => ListView.builder(
                          itemCount: skills.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return SkillItem(
                              skillName: skills[index]['name'],
                              progress: skills[index]['progress'],
                            );
                          })))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        child: getValueForScreenType<Widget>(
          context: context,
          mobile: aboutMeForMobile(),
          tablet: aboutMeForDesktop(),
          desktop: aboutMeForDesktop(),
        ));
  }
}
