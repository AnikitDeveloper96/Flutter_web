import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sample_portfolio_app/src/presentation/constants/colors.dart';

import '../../widgets/textStyles.dart';

class ServicesPageModel {
  String servicesOffered;
  String servicesDescription;
  ServicesPageModel(
      {required this.servicesOffered, required this.servicesDescription});
}

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  int currentIndex = 0;

  List<ServicesPageModel> servicesPages = [
    ServicesPageModel(
        servicesOffered: "Website / App DesignUX / UI Design",
        servicesDescription:
            "Creating Engaging Digital Experiences for Websites and Apps through UX/UI Design"),
    ServicesPageModel(
        servicesOffered: "Strategic Marketing and Creative Content",
        servicesDescription:
            "Elevating Brands and Engagement through Strategic Marketing and Creative Content"),
    ServicesPageModel(
        servicesOffered: "Multivendor eCommerce Website Solutions",
        servicesDescription:
            "Unlocking the World of Multivendor eCommerce Websites"),
    // replica
    ServicesPageModel(
        servicesOffered: "Website / App DesignUX / UI Design",
        servicesDescription:
            "Creating Engaging Digital Experiences for Websites and Apps through UX/UI Design"),
    ServicesPageModel(
        servicesOffered: "Strategic Marketing and Creative Content",
        servicesDescription:
            "Elevating Brands and Engagement through Strategic Marketing and Creative Content"),
    ServicesPageModel(
        servicesOffered: "Multivendor eCommerce Website Solutions",
        servicesDescription:
            "Unlocking the World of Multivendor eCommerce Websites"),
  ];

  bool servicestaken = false;

  servicesSectionsForDesktop() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 652),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Services",
            textAlign: TextAlign.center,
            style: commonTextStyles(AppColors.nameColor, 20, FontWeight.w600),
          ),
          const SizedBox(
            height: 15.0,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Exploring My Design ',
                  style:
                      commonTextStyles(AppColors.headline, 50, FontWeight.w700),
                ),
                TextSpan(
                  text: 'Skills',
                  style: commonTextStyles(
                      AppColors.nameColor, 50, FontWeight.w700),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Container(
            constraints: const BoxConstraints(maxHeight: 85),
            margin: const EdgeInsets.symmetric(
              horizontal: 353,
            ),
            child: Text(
                "We transform your ideas into a distinctive web project that both inspires you and captivates your customers",
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style:
                    commonTextStyles(AppColors.headline, 18, FontWeight.w400)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 30.0, left: 81, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () {
                      currentIndex >= 0
                          ? setState(() => currentIndex--)
                          : Container();
                    },
                    child:
                        Image.asset("assets/images/button_previous_page.png")),
                const SizedBox(
                  width: 20.0,
                ),
                GestureDetector(
                    onTap: () {
                      currentIndex <= servicesPages.length
                          ? setState(() => currentIndex == servicesPages.length
                              ? ()
                              : currentIndex++)
                          : Container();
                    },
                    child: Image.asset("assets/images/button_next_page.png")),
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.only(left: 81),
            child: SizedBox(
              height: 366,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, i) => GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = i;
                          });
                        },
                        child: SizedBox(
                          width: 406,
                          child: Card(
                            color: currentIndex != i
                                ? AppColors.whiteColor
                                : AppColors.nameColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // currentIndex == i
                                  //     ?
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Image.asset(
                                        colorBlendMode: BlendMode.color,
                                        "assets/images/services_jpg.jpg",
                                        height: 95),
                                    // Image.asset(
                                    //     "assets/images/services_enabled.jpg",
                                    //     height: 95),
                                  )
                                  // : Align(
                                  //     alignment: Alignment.topLeft,
                                  //     child: Image.asset(
                                  //         colorBlendMode:
                                  //             BlendMode.color,
                                  //         "assets/images/services_jpg.jpg",
                                  //         height: 95),
                                  //   ),,
                                  ,
                                  Text(
                                    servicesPages[i].servicesOffered,
                                    style: commonTextStyles(
                                        currentIndex != i
                                            ? const Color.fromARGB(
                                                255, 95, 95, 95)
                                            : AppColors.whiteColor,
                                        25,
                                        FontWeight.w700),
                                  ),
                                  Container(
                                    height: 93,
                                    margin: const EdgeInsets.only(top: 10.0),
                                    child: Text(
                                      servicesPages[i].servicesDescription,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: commonTextStyles(
                                          currentIndex != i
                                              ? AppColors.milestonecolor
                                              : AppColors.whiteColor,
                                          18,
                                          FontWeight.w400),
                                    ),
                                  ),
                                  Text(
                                    "Learn More ",
                                    maxLines: 1,
                                    textAlign: TextAlign.left,
                                    style: commonTextStyles(
                                        currentIndex != i
                                            ? AppColors.nameColor
                                            : AppColors.whiteColor,
                                        18,
                                        FontWeight.w400),
                                  ),
                                  // Row(
                                  //   mainAxisSize: MainAxisSize.min,
                                  //   children: [

                                  //     IconButton(
                                  //       icon: Icon(Icons.arrow_forward,
                                  //           color: currentIndex != i
                                  //               ? AppColors.nameColor
                                  //               : AppColors.whiteColor),
                                  //       onPressed: () {},
                                  //     )
                                  //   ],
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 30,
                      ),
                  itemCount: servicesPages.length),
            ),
          )
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     children: [
          //       for (int i = currentIndex;
          //           i < currentIndex + 3 && i < servicesPages.length;
          //           i++)
          //         GestureDetector(
          //           onTap: () {
          //             setState(() {
          //               currentIndex = i;
          //             });
          //           },
          //           child:
          //         )
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }

  servicesSectionsForMobile() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Services",
            textAlign: TextAlign.center,
            style: commonTextStyles(AppColors.nameColor, 20, FontWeight.w600),
          ),
          const SizedBox(
            height: 15.0,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Exploring My Design ',
                  style:
                      commonTextStyles(AppColors.headline, 50, FontWeight.w700),
                ),
                TextSpan(
                  text: 'Skills',
                  style: commonTextStyles(
                      AppColors.nameColor, 50, FontWeight.w700),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Container(
            constraints: const BoxConstraints(maxHeight: 85),
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Text(
                "We transform your ideas into a distinctive web project that both inspires you and captivates your customers",
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style:
                    commonTextStyles(AppColors.headline, 18, FontWeight.w400)),
          ),
          Container(
            margin: const EdgeInsets.only(
                top: 30.0, left: 81, right: 30, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      currentIndex >= 0
                          ? setState(() => currentIndex--)
                          : Container();
                    },
                    child:
                        Image.asset("assets/images/button_previous_page.png")),
                const SizedBox(
                  width: 20.0,
                ),
                GestureDetector(
                    onTap: () {
                      currentIndex <= servicesPages.length
                          ? setState(() => currentIndex == servicesPages.length
                              ? ()
                              : currentIndex++)
                          : Container();
                    },
                    child: Image.asset("assets/images/button_next_page.png")),
              ],
            ),
          ),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: 366,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, i) => GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = i;
                          });
                        },
                        child: SizedBox(
                          width: 406,
                          child: Card(
                            color: currentIndex != i
                                ? AppColors.whiteColor
                                : AppColors.nameColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // currentIndex == i
                                  //     ?
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Image.asset(
                                        colorBlendMode: BlendMode.color,
                                        "assets/images/services_jpg.jpg",
                                        height: 95),
                                    // Image.asset(
                                    //     "assets/images/services_enabled.jpg",
                                    //     height: 95),
                                  )
                                  // : Align(
                                  //     alignment: Alignment.topLeft,
                                  //     child: Image.asset(
                                  //         colorBlendMode:
                                  //             BlendMode.color,
                                  //         "assets/images/services_jpg.jpg",
                                  //         height: 95),
                                  //   ),,
                                  ,
                                  Text(
                                    servicesPages[i].servicesOffered,
                                    style: commonTextStyles(
                                        currentIndex != i
                                            ? const Color.fromARGB(
                                                255, 95, 95, 95)
                                            : AppColors.whiteColor,
                                        25,
                                        FontWeight.w700),
                                  ),
                                  Container(
                                    height: 93,
                                    margin: const EdgeInsets.only(top: 10.0),
                                    child: Text(
                                      servicesPages[i].servicesDescription,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: commonTextStyles(
                                          currentIndex != i
                                              ? AppColors.milestonecolor
                                              : AppColors.whiteColor,
                                          18,
                                          FontWeight.w400),
                                    ),
                                  ),
                                  Text(
                                    "Learn More ",
                                    maxLines: 1,
                                    textAlign: TextAlign.left,
                                    style: commonTextStyles(
                                        currentIndex != i
                                            ? AppColors.nameColor
                                            : AppColors.whiteColor,
                                        18,
                                        FontWeight.w400),
                                  ),
                                  // Row(
                                  //   mainAxisSize: MainAxisSize.min,
                                  //   children: [

                                  //     IconButton(
                                  //       icon: Icon(Icons.arrow_forward,
                                  //           color: currentIndex != i
                                  //               ? AppColors.nameColor
                                  //               : AppColors.whiteColor),
                                  //       onPressed: () {},
                                  //     )
                                  //   ],
                                  // ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) => const SizedBox(
                        width: 30,
                      ),
                  itemCount: servicesPages.length),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return getValueForScreenType<Widget>(
      context: context,
      mobile: servicesSectionsForMobile(),
      tablet: servicesSectionsForDesktop(),
      desktop: servicesSectionsForDesktop(),
    );
  }
}
