import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nurse_app/src/features/authentication/screens/login/login_screen.dart';
import 'package:nurse_app/src/utils/animations/fade_in_animation/fade_in_animation_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final getcontroller = Get.put(FadeInAnimationController());
    getcontroller.animationIn();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 80.0),
        child: Container(
          child: PageView(
            controller: controller,
            onPageChanged: (index) => setState(() {
              isLastPage = index == 2;
            }),
            children: [
              PageView(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Image.asset("assets/images/welcome_images/welcome-screen-image.png")),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Log. Connect. Thrive',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ]),
              PageView(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Image.asset("assets/images/welcome_images/welcome-screen-image.png")),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Effortless Patient Management',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ]),
              PageView(children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Image.asset("assets/images/welcome_images/welcome-screen-image.png")),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Revolutionize Nursing Care',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ]),
            ],
          ),
        ),
      ),
      bottomSheet: isLastPage
          ? Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                  onPressed: () => Get.to(() => const LoginScreen()),
                  child: Text(
                    'Get Started',
                    style: TextStyle(fontSize: 24),
                  )),
            )
          : Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () => controller.jumpToPage(2),
                      child: Text('Skip')),
                  Center(
                    child: SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      onDotClicked: (index) => controller.animateToPage(index,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeIn),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        controller.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                      },
                      child: Text('Next')),
                ],
              ),
            ),
    );
  }
}