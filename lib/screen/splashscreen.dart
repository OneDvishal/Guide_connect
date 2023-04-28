import 'package:flutter/material.dart';

import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final liquidController = LiquidController();
  final pageController = PageController();
  int currentPage = 0;

  void onPageChangedCallback(int page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: _buildOnBoardingPages(),
            liquidController: liquidController,
            onPageChangeCallback: onPageChangedCallback,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
          ),
          Positioned(
            bottom: 60,
            child: OutlinedButton(
              onPressed: () => animateToNextSlide(),
              style: ElevatedButton.styleFrom(
                side: const BorderSide(color: Colors.black26),
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
                onPrimary: Colors.white,
              ),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              onPressed: skip,
              child: const Text(
                "Skip",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: AnimatedSmoothIndicator(
              activeIndex: currentPage,
              effect: const WormEffect(
                activeDotColor: Colors.black,
                dotHeight: 10.0,
              ),
              count: 3,
            ),
          ),
        ],
      ),
    );
  }

  List<Container> _buildOnBoardingPages() {
    return [
      Container(
        // Build your first onboarding page widget
      ),
      Container(
        // Build your second onboarding page widget
      ),
      Container(
        // Build your third onboarding page widget
      ),
    ];
  }

  void animateToNextSlide() {
    liquidController.animateToPage(
      page: currentPage + 1,
    );
  }

  void skip() {
    // Handle the skip action
  }
}
