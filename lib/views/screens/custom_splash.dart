import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/services/local_storage_service.dart';
import '../../helpers/route_helper.dart';
import '../../utils/app_constants.dart';
bool hasToken = false;
int initScreen = 0;
bool isTokenExpired = false;
class CustomSplash extends StatefulWidget {
  const CustomSplash({Key? key}) : super(key: key);

  @override
  State<CustomSplash> createState() => _CustomSplashState();
}

class _CustomSplashState extends State<CustomSplash> with TickerProviderStateMixin{
   late AnimationController _controller;
   late AnimationController _secondController;
   late Animation<double> _animation;
  late Animation<Offset> _animationSecondImage;
   late AnimationController _firstImageSecondController;
   late Animation<Offset> _animationFirstImageSecond;


  @override
  void initState() {
    super.initState();
    //first image controller
    _controller = AnimationController(
        duration: const Duration(seconds: 2), vsync: this);
    //first image animation
    _animation = Tween(
      begin: 1.0,
      end: 0.3,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.bounceInOut));
    _controller.forward();

    //second image controller
    _secondController = AnimationController(
        duration: const Duration(seconds: 4), vsync: this);
    _secondController.forward();

    //second image animation
    _animationSecondImage = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset(0.5, 0),
    ).animate(CurvedAnimation(parent: _secondController, curve: Curves.easeOut
    ));

    //first image second controller
    _firstImageSecondController = AnimationController(
        duration: const Duration(seconds: 3), vsync: this);
    _firstImageSecondController.forward();

    //first image second  animation
    _animationFirstImageSecond = Tween<Offset>(
      begin: Offset(0.3, 0),
      end: Offset(-0.5, 0),
    ).animate(CurvedAnimation(parent: _firstImageSecondController, curve: Curves.easeIn
    ));





  }
 Future<bool> checkToken() async{
    bool token = await AuthService().hasToken(AppConstants.token);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    initScreen = await prefs.getInt("initScreen") ?? 0;
    // await prefs.setInt("initScreen", 1);
    token ? hasToken = true : hasToken = false;
    isTokenExpired = await AuthService().isTokenExpired();
    return true;
  }

  @override
  void dispose() {
    _controller.dispose();
    _secondController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checkToken(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          Future.delayed(Duration(seconds: 5), () =>
          {
            initScreen == 0 ?  Navigator
                .pushReplacementNamed(context, RouteHelper.onBoard) :

              (hasToken && !isTokenExpired) ? Navigator.pushReplacementNamed(
                  context, RouteHelper.home)

                  : Navigator
                  .pushReplacementNamed(context, RouteHelper.login)
            });

        }

        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark),
          child: Scaffold(
            body: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  FutureBuilder(
                    future: Future.delayed(Duration(milliseconds: 2000)),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return SlideTransition(

                          position: _animationSecondImage,
                          child: Container(
                            child: Image.asset(
                              height: 205,
                              width: 220,
                              fit: BoxFit.contain,
                              'assets/images/second_half_image.jpg',


                            ),
                          ),
                        );
                      }
                      return SizedBox();
                    },

                  ),
                  FutureBuilder(
                    future: Future.delayed(Duration(milliseconds: 1450)),
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return SlideTransition(

                          position: _animationFirstImageSecond,
                          child: Container(
                            child: Image.asset(
                              height: 205,
                              width: 170,
                              fit: BoxFit.contain,
                              'assets/images/first_half_image.jpg',


                            ),
                          ),
                        );
                      }

                      return ScaleTransition(

                        scale: _animation,
                        child: SizedBox(
                          height: 300,
                          width: 300,
                          child: Image.asset(

                              'assets/images/first_half_image.jpg'
                          ),
                        ),
                      );
                    },

                  ),


                ],
              ),
            ),
          ),
        );
      }
    );
    }
  }

