import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'src/presentation/pages/home/homepage.dart';

class ResponsiveBuilderHomepage extends StatefulWidget {
  const ResponsiveBuilderHomepage({super.key});

  @override
  State<ResponsiveBuilderHomepage> createState() =>
      _ResponsiveBuilderHomepageState();
}

class _ResponsiveBuilderHomepageState extends State<ResponsiveBuilderHomepage> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      breakpoints:
          const ScreenBreakpoints(desktop: 900, tablet: 650, watch: 250),
      mobile: (BuildContext context) => const PortfolioHomepage(),
      desktop: (BuildContext context) => const PortfolioHomepage(),
    );
  }
}
