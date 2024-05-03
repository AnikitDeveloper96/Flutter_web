import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sample_portfolio_app/src/presentation/constants/colors.dart';
import 'package:sample_portfolio_app/src/presentation/widgets/textStyles.dart';

class TestimonialPageModel {
  String servicesOffered;
  String servicesDescription;
  String servicePost;
  TestimonialPageModel(
      {required this.servicesOffered,
      required this.servicesDescription,
      required this.servicePost});
}

class TestimonialPage extends StatefulWidget {
  const TestimonialPage({super.key});

  @override
  State<TestimonialPage> createState() => _TestimonialPageState();
}

class _TestimonialPageState extends State<TestimonialPage> {
  int currentIndex = 0;

  List<String> testimonialsImages = [
    "assets/images/test_one.png",
    "assets/images/test_two.png",
    "assets/images/test_three.png",
    "assets/images/test_four.png",
  ];

  List<TestimonialPageModel> servicesPages = [
    TestimonialPageModel(
        servicesOffered:
            "Lorem ipsum dolor sit amet consectetur. Nibh porttitor aliquet tellus eget egestas. Enim ultrices dictumst tortor in eget neque vestibulum potenti tempus",
        servicesDescription: "Savannah Nguyen",
        servicePost: "President of Sales"),
    TestimonialPageModel(
        servicesOffered:
            "Lorem ipsum dolor sit amet consectetur. Nibh porttitor aliquet tellus eget egestas. Enim ultrices dictumst tortor in eget neque vestibulum potenti tempus",
        servicesDescription: "Jenny Wilson",
        servicePost: "Medical Assistant"),
    TestimonialPageModel(
      servicesOffered:
          "Lorem ipsum dolor sit amet consectetur. Nibh porttitor aliquet tellus eget egestas. Enim ultrices dictumst tortor in eget neque vestibulum potenti tempus",
      servicesDescription: "Esther Howard",
      servicePost: "Marketing Coordinator",
    ),
    // replica
    TestimonialPageModel(
        servicesOffered:
            "Lorem ipsum dolor sit amet consectetur. Nibh porttitor aliquet tellus eget egestas. Enim ultrices dictumst tortor in eget neque vestibulum potenti tempus",
        servicesDescription: "Cameron Williamson",
        servicePost: "Marketing Coordinator"),
  ];

  bool servicestaken = false;
  testimonialForDesktop() {
    return Container(
      margin: const EdgeInsets.only(top: 200),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "TESTIMONIALS",
            textAlign: TextAlign.center,
            style: commonTextStyles(AppColors.nameColor, 20, FontWeight.w600),
          ),
          const SizedBox(
            height: 20,
          ),
          Text("The Trust From Clients",
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: commonTextStyles(AppColors.headline, 50, FontWeight.w700)),
          Container(
            margin: const EdgeInsets.only(top: 50.0, left: 81, right: 50),
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
                      currentIndex < servicesPages.length
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
            margin: const EdgeInsets.symmetric(horizontal: 81),
            child: SizedBox(
              height: 465,
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
                          width: 297,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Card(
                                color: currentIndex != i
                                    ? AppColors.whiteColor
                                    : AppColors.nameColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ClipOval(
                                        clipBehavior: Clip.antiAlias,
                                        child: Image.asset(
                                          testimonialsImages[i],

                                          ///   "https://images.pexels.com/photos/3973089/pexels-photo-3973089.jpeg?auto=compress&cs=tinysrgb&w=600",
                                          fit: BoxFit.cover,
                                          width: 150,
                                          height: 150,
                                        ),
                                      ),
                                      Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 20.0),
                                          child: Image.asset(
                                              "assets/images/star.png")),
                                      Text(
                                        servicesPages[i].servicesOffered,
                                        style: commonTextStyles(
                                            currentIndex == i
                                                ? AppColors.whiteColor
                                                : AppColors.headline,
                                            16,
                                            FontWeight.w400),
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(top: 20.0),
                                        child: Text(
                                          servicesPages[i].servicesDescription,
                                          maxLines: 1,
                                          style: commonTextStyles(
                                              AppColors.headline,
                                              16,
                                              FontWeight.w600),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          servicesPages[i].servicePost,
                                          maxLines: 1,
                                          style: commonTextStyles(
                                              currentIndex != i
                                                  ? AppColors.testimonialColor
                                                  : AppColors.whiteColor,
                                              16,
                                              FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) => Container(),
                  itemCount: servicesPages.length),
            ),
          )
        ],
      ),
    );
  }

  testimonialForMobile() {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "TESTIMONIALS",
            textAlign: TextAlign.center,
            style: commonTextStyles(AppColors.nameColor, 20, FontWeight.w600),
          ),
          const SizedBox(
            height: 20,
          ),
          Text("The Trust From Clients",
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: commonTextStyles(AppColors.headline, 50, FontWeight.w700)),
          Container(
            margin: const EdgeInsets.only(top: 30.0, left: 10, bottom: 30),
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
                      currentIndex < servicesPages.length
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
              height: 465,
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
                          width: 297,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Card(
                                color: currentIndex != i
                                    ? AppColors.whiteColor
                                    : AppColors.nameColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ClipOval(
                                        clipBehavior: Clip.antiAlias,
                                        child: Image.asset(
                                          testimonialsImages[i],

                                          ///   "https://images.pexels.com/photos/3973089/pexels-photo-3973089.jpeg?auto=compress&cs=tinysrgb&w=600",
                                          fit: BoxFit.cover,
                                          width: 150,
                                          height: 150,
                                        ),
                                      ),
                                      Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 20.0),
                                          child: Image.asset(
                                              "assets/images/star.png")),
                                      Text(
                                        servicesPages[i].servicesOffered,
                                        style: commonTextStyles(
                                            currentIndex == i
                                                ? AppColors.whiteColor
                                                : AppColors.headline,
                                            16,
                                            FontWeight.w400),
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(top: 20.0),
                                        child: Text(
                                          servicesPages[i].servicesDescription,
                                          maxLines: 1,
                                          style: commonTextStyles(
                                              AppColors.headline,
                                              16,
                                              FontWeight.w600),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 5.0),
                                        child: Text(
                                          servicesPages[i].servicePost,
                                          maxLines: 1,
                                          style: commonTextStyles(
                                              currentIndex != i
                                                  ? AppColors.testimonialColor
                                                  : AppColors.whiteColor,
                                              16,
                                              FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) => Container(),
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
      mobile: testimonialForMobile(),
      tablet: testimonialForDesktop(),
      desktop: testimonialForDesktop(),
    );
  }
}
