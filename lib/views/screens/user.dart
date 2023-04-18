import 'package:e_bidir/bloc/user_profile/user_profile_bloc.dart';
import 'package:e_bidir/repositories/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/api/api_client.dart';
import '../../helpers/route_helper.dart';
import '../../utils/color_resource.dart';
import '../../utils/size_config.dart';
import '../widgets/shared_button.dart';
import '../widgets/tab_button.dart';
import '../widgets/tab_text_field.dart';
class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  List<String> tabText = ['User Info','Additional','Account'];
  int currentIndex = 0;
  bool isSending = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    TextTheme _textTheme = Theme.of(context).textTheme;

    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark
      ),
      child: RepositoryProvider(
        create: (context)=> AuthRepo(apiClient: ApiClient()),
        child: BlocProvider(
            create: (context)=> UserProfileBloc(userProfileRepo: context.read<AuthRepo>())..add(GetUserProfile()),
          child: BlocConsumer<UserProfileBloc,UserProfileState>(
              listener: (context, state) {
                if (state.status.hasError) {
                  showSnackBar(context, state, _textTheme);
                }
              },
            builder: (context,state) {

              return SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizeConfig.screenWidth! * 0.08,
                      vertical: SizeConfig.screenHeight! * 0.03),
                  child: ListView(
                    children: [
                      Align(
                          alignment: Alignment.bottomLeft,
                          child: IconButton(
                            onPressed: () =>
                                Navigator.pushReplacementNamed(
                                    context, RouteHelper.home),
                            icon: Icon(Icons.arrow_back_sharp, weight: 30,
                              size: 40,),
                            color: ColorResources.accentColor,)),
                      Text('User Profile',
                        style: _textTheme.headlineSmall?.copyWith(
                            color: ColorResources.accentColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),),
                      Container(
                        height: SizeConfig.screenHeight! * 0.14,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: tabText.length,
                          primary: false,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.only(left: 10,
                                  right: SizeConfig.screenWidth! * 0.1,
                                  top: 10,
                                  bottom: 5),
                              child: Column(

                                children: [
                                  GestureDetector(
                                    onTap: () =>
                                    {
                                      setState(() =>
                                      {
                                        currentIndex = index
                                      })},
                                    child: Container(
                                      height: SizeConfig.screenHeight! * 0.08,
                                      width: SizeConfig.screenHeight! * 0.08,
                                      decoration: currentIndex == index ?
                                      BoxDecoration(
                                          color: ColorResources.accentColor,
                                          border: Border.all(
                                              color: ColorResources.accentColor,
                                              width: 3
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              100)
                                      ) : BoxDecoration(

                                          border: Border.all(
                                              color: ColorResources.accentColor,
                                              width: 3
                                          ),
                                          borderRadius: BorderRadius.circular(
                                              100)
                                      ),
                                      child: Center(
                                          child: Text((index + 1).toString(),
                                            style: _textTheme.headlineSmall
                                                ?.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25,
                                                color: currentIndex == index
                                                    ? ColorResources
                                                    .scaffoldColor
                                                    : ColorResources.accentColor
                                            ),
                                            textAlign: TextAlign.center,
                                          )),
                                    ),
                                  ),
                                  Text(tabText[index],
                                    style: _textTheme.labelMedium?.copyWith(
                                        color: currentIndex == index
                                            ? ColorResources.accentColor
                                            : ColorResources
                                            .lightStatusTextColor,
                                        fontWeight: FontWeight.w700
                                    ),),
                                ],
                              ),
                            );
                          },

                        ),
                      ),
                      SizedBox(height: 15,),
                      currentIndex == 0 ? Center(
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(
                                state.userInfo?.profile['url']?? ''),

                          )
                      ) : SizedBox(),

                      Column(
                          children: getTabItems(_textTheme,state.userInfo)[currentIndex]
                      ),
                      SizedBox(height: SizeConfig.screenHeight! * 0.03,),
                      currentIndex == 3 ?
                      SharedButton(
                        textTheme: _textTheme,
                        buttonText: 'Submit',
                        buttonColor: ColorResources.accentColor,
                        isSending: isSending,
                        onPressed: () {
                          setState(() {
                            isSending = true;
                          });
                          Future.delayed(Duration(seconds: 3), () {
                            Navigator.pushReplacementNamed(
                                context, RouteHelper.home);
                          });
                        },
                      ) :
                      TabButton(
                        onPressed: () =>
                        {
                          setState(() =>
                          {
                            currentIndex++
                          })
                        },
                      ),

                      SizedBox(height: SizeConfig.screenHeight! * 0.01,),


                    ],
                  ),
                ),
              );
            }
          )
        ),
      ),
    );
  }
  void showSnackBar(context, state, _textTheme) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 10),
        backgroundColor: ColorResources.errorText,
        content: Center(
            child: Text(state.errorMessage ?? '',
                style: _textTheme.titleSmall?.copyWith(color: Colors.white)))));
  }
  List<List<Widget>> getTabItems(_textTheme,value){

      List<List<Widget>> myW = [
      [
        SizedBox(height: 15,),
        TabTextField(textTheme: _textTheme,label: 'Name',value:value?.name),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Email',value:value?.email),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Phone Number',value:value?.phoneNo),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Tin Number',value:value?.TIN_Number),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Score',value:value?.score),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Role',value:value?.role),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Rank',value:value?.rank),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Gender',value:value?.gender),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Status',value:value?.status),
      ],


      [
        SizedBox(height: 15,),
        TabTextField(textTheme: _textTheme,label: 'Field Of Employment',value:value),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Source Of Income',value:value),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Experience',value:value),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Number Of Loans',value:value),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Fully Repaid Loans',value:value),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Total Monthly Income',value:value),
      ],
      [
        SizedBox(height: 15,),
        TabTextField(textTheme: _textTheme,label: 'Field Of Employment',value:value),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Source Of Income',value:value),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Experience',value:value),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Number Of Loans',value:value),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Fully Repaid Loans',value:value),
        SizedBox(height: SizeConfig.screenHeight! * 0.03,),
        TabTextField(textTheme: _textTheme,label: 'Total Monthly Income',value:value),
      ],

    ];
      return myW;
  }
}
