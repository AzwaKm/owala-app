import 'package:flutter/material.dart';
import 'package:owala_app/data/onboarding_data.dart';
import 'package:owala_app/utils/consts.dart';
import 'package:owala_app/views/onboarding/components/boarding_content.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: onBoardingData.length,
                itemBuilder: (context, index) => OnboardingContent(
                  text: onBoardingData[index].text,
                  image: onBoardingData[index].image,
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  onBoardingData.length,
                  (index) => _dotsIndicator(index: index)
                ),
              )
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    side: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (currentPage == onBoardingData.length - 1) {
                      Navigator.pushNamed(context, '/login');
                    } else {
                      _pageController.animateToPage(
                        currentPage + 1,
                        duration: animationDuration,
                        curve: Curves.ease
                      );
                    }
                  },
                  child: Text(
                    currentPage == onBoardingData.length - 1 ? "Starting Now" : "Ready",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  AnimatedContainer _dotsIndicator({required int index}) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: currentPage == index ? primaryColor : secondaryColor,
      ),
      width: currentPage == index ? 20 : 7,
      height: 5,
      duration: animationDuration,
    );
  }
}