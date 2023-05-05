import 'package:e_bidir/helpers/route_helper.dart';
import 'package:e_bidir/utils/color_resource.dart';
import 'package:flutter/material.dart';

List<Widget> onBoardingPages = [];

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  late Image intoImage1;
  late Image intoImage2;
  late Image intoImage3;
  late Image intoImage4;
  @override
  void initState() {
    super.initState();
    intoImage1 = Image.asset("assets/images/intro_1.jpg",
      height: double.infinity,
      width: double.infinity,
      fit: BoxFit.cover,
      color: Colors.black45,
      colorBlendMode: BlendMode.darken,);
    intoImage2 = Image.asset("assets/images/intro_2.jpeg",
      height: double.infinity,
      width: double.infinity,
      fit: BoxFit.cover,
      color: Colors.black45,
      colorBlendMode: BlendMode.darken,);
    intoImage3 = Image.asset("assets/images/intro_3.jpeg",
      height: double.infinity,
      width: double.infinity,
      fit: BoxFit.cover,
      color: Colors.black45,
      colorBlendMode: BlendMode.darken,
    );
    intoImage4 = Image.asset("assets/images/intro_4.jpeg",
      height: double.infinity,
      width: double.infinity,
      fit: BoxFit.cover,
      color: Colors.black45,
      colorBlendMode: BlendMode.darken,
    );
    _pageController = PageController();

  }
@override
void didChangeDependencies(){
  super.didChangeDependencies();
  precacheImage(intoImage1.image, context);
  precacheImage(intoImage2.image, context);
  precacheImage(intoImage3.image, context);
  precacheImage(intoImage4.image, context);
  }

  @override
  Widget build(BuildContext context) {


    onBoardingPages = [
      Introductions(
          pageController: _pageController,
          iconName: Icons.next_plan_outlined,
          moveTo: 1,
          title: 'Easy Access',
          paragraph: 'E-bidir app allow you to access to loans',
          imageAsset: intoImage2),
      Introductions(
          pageController: _pageController,
          iconName: Icons.payment,
          moveTo: 2,
          title: 'Interest',
          paragraph:
              'Interest fees between the range of 2.5 to 30% which is dependent on loan amount',
          imageAsset: intoImage1),
      Introductions(
          pageController: _pageController,
          iconName: Icons.directions_outlined,
          moveTo: 3,
          title: 'Flexible Repayment',
          paragraph:
              'Repayment of fees with tenors between the period of 2 to 96 weeks',
          imageAsset: intoImage3),
      Introductions(
        pageController: _pageController,
        iconName: Icons.speed,
        moveTo: 4,
        title: 'Speedy Loan Process',
        paragraph:
            'Very fast loan application process with less back and forth running and papewor',
        imageAsset: intoImage4,
      ),
    ];
    return Scaffold(
      body: PageView.builder(
        allowImplicitScrolling: true,
        itemCount: onBoardingPages.length,
        // assign it to PageView
        controller: _pageController,
        itemBuilder: (context, index) {
          return onBoardingPages[index];
        },
      ),
    );
  }
}

class Introductions extends StatelessWidget {
  Introductions(
      {super.key,
      required PageController pageController,
      required this.iconName,
      this.moveTo = 1,
      required this.title,
      required this.paragraph,
      required this.imageAsset,
      isLast})
      : _pageController = pageController;

  final PageController _pageController;
  final IconData iconName;
  final int moveTo;
  final String title;
  final String paragraph;

  final Image imageAsset;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [

        imageAsset,
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            iconName,
            size: 80,
            color: ColorResources.scaffoldColor,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 30,
                color: ColorResources.scaffoldColor),
          ),
          Text(
            paragraph,
            style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 15,
                color: ColorResources.scaffoldColor),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                onBoardingPages.length,
                (index) => Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: index == (moveTo - 1)
                            ? BoxDecoration(
                                border: Border.all(
                                    color: ColorResources.scaffoldColor),
                                color: ColorResources.accentColor,
                                borderRadius: BorderRadius.circular(10))
                            : BoxDecoration(
                                border: Border.all(
                                    color: ColorResources.scaffoldColor),
                                color:
                                    ColorResources.accentColor.withOpacity(.4),
                                borderRadius: BorderRadius.circular(10)),
                      ),
                    )),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: 70,
            width: 70,
            margin: EdgeInsets.only(bottom: 40),
            decoration: BoxDecoration(
              color: ColorResources.scaffoldColor,
              borderRadius: BorderRadius.circular(70),
            ),
            child: IconButton(
              onPressed: () {
                if (moveTo == 4) {
                  Navigator.pushReplacementNamed(context, RouteHelper.login);
                } else {
                  if (_pageController.hasClients) {
                    _pageController.animateToPage(
                      moveTo,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  }
                }
              },
              icon: Icon(Icons.arrow_forward,
                  color: ColorResources.accentColor, size: 35),
            ),
          )
        ],
      )
    ]);
  }
}
