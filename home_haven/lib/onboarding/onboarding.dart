import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:home_haven/modules/login/login_screen.dart';
import 'package:home_haven/shared/components/components.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Model {
  String? image;
  String? title;
  String? body;

  Model({this.image, this.title, this.body});
}

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  PageController controller = PageController();
  bool isLast = false;

  List<Model> onboardModel = [
    Model(
      image: 'assets/images/onboard1.png',
      title: 'Online Home Store and Furniture',
      body:
          'Discover all style and budgets of furniture, appliances, kitchen, and more from 500+ brands in your hand.',
    ),
    Model(
      image: 'assets/images/onboard2.png',
      title: 'Delivery Right to Your Doorstep',
      body:
          'Sit back, and enjoy the convenience of our drivers delivering your order to your doorstep.',
    ),
    Model(
      image: 'assets/images/onboard3.png',
      title: 'Get Support From Our Skilled Team',
      body:
          'If our products don\'t meet your expectations, we\'re available 24/7 to assist you.',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Flexible(
            child: PageView.builder(
              controller: controller,
              itemBuilder: (context, index) => onboardItem(onboardModel[index]),
              onPageChanged: (int index) {
                if (index == onboardModel.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
              itemCount: onboardModel.length,
            ),
          ),
          SmoothPageIndicator(
            controller: controller,
            effect: ColorTransitionEffect(
              dotHeight: 10.0,
              dotWidth: 10.0,
              activeDotColor: HexColor('#156651'),
              dotColor: HexColor('#C2C2C2'),
              spacing: 5.0,
            ),
            count: onboardModel.length,
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              bottom: 40.0,
              start: 18.0,
              end: 18.0,
            ),
            child: defaultButton(
              text: 'Next',
              onPressed: () {
                if (isLast) {
                  navigateAndFinish(context: context, widget: LoginScreen());
                } else {
                  controller.nextPage(
                    duration: Duration(milliseconds: 750),
                    curve: Curves.fastEaseInToSlowEaseOut,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget onboardItem(Model model) => Column(
      children: [
        Image(
          image: AssetImage('${model.image}'),
          fit: BoxFit.cover,
          height: 430.0,
          width: double.infinity,
        ),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              Text(
                '${model.title}',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                '${model.body}',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13.5, color: HexColor('#616161')),
              ),
            ],
          ),
        ),
      ],
    );
