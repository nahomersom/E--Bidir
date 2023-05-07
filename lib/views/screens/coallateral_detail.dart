import 'package:e_bidir/utils/color_resource.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class CollateralDetail extends StatelessWidget {

  CollateralDetail({Key? key,required this.type,required this.loanDetail}) : super(key: key);
  final dynamic loanDetail;
  final dynamic type;

  @override
  Widget build(BuildContext context) {
    print(type);
    print(loanDetail[9].value);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: ColorResources.accentColor,
          title: Text(
              textAlign:TextAlign.center,
              'Collateral Detail'),
        ),
        body: ListView(

          children: [

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) => Padding(
                      padding:EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: 150,
                        width: 300,
                        margin: EdgeInsets.only(top: 40),
                        decoration: BoxDecoration(
                            color: ColorResources.accentColor,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(child: Text('Your Ad will appear here.....',style: TextStyle(
                            color: ColorResources.scaffoldColor
                        ),),),
                      ),
                    ),


                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        3,
                            (index) => Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: index == 0
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
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 25),
              child: Container(
                color: Color(0xffF5F7F9),
                child: Column(
                  children: [
                    ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.buildingColumns,
                        color: ColorResources.accentColor,
                      ),
                      title: Text(type == 0 ? 'Type Of Vehicle': 'Type Of Building'),
                      trailing: Text(
                            loanDetail[1].value
                              ?? '-'                  ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Divider(thickness: 1,)),
                    ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.signal,
                        color: ColorResources.accentColor,
                      ),
                      title: Text(type == 0 ? 'Brand Of Vehicle' : 'Total Area'),
                      trailing: Text(
                          loanDetail[2].value
                              ?? '-'                    ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Divider(thickness: 1,)),
                    ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.briefcase,
                        color: ColorResources.accentColor,
                      ),
                      title: Text(type == 0 ? 'Model Of Vehicle':'Location' ),
                      trailing: Text(
                          loanDetail[3].value
                              ?? '-'                    ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Divider(thickness: 1,)),
                    ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.handHoldingDollar,
                        color: ColorResources.accentColor,
                      ),
                      title: Text(type == 0 ? 'Plate Number': 'Distance from the main road'),
                      trailing: Text(
                          loanDetail[4].value
                              ?? '-'                    ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Divider(thickness: 1,)),
                    ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.car,
                        color: ColorResources.accentColor,
                      ),
                      title: Text(type == 0 ? 'Mileage': 'Purpose of the building'),
                      trailing: Text(

                          loanDetail[5].value
                              ?? '-'                    ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Divider(thickness: 1,)),
                    ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.moneyCheck,
                        color: ColorResources.accentColor,
                      ),
                      title: Text(type == 0 ? 'Year Of Manufacture' : 'Construction Status',),
                      trailing: Text(
                          loanDetail[6].value
                              ?? '-'                    ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Divider(thickness: 1,)),
                    ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.moneyBills,
                        color: ColorResources.accentColor,
                      ),
                      title: Text(type == 0 ? 'Country Of Manufacture' : 'Utility'),
                      trailing: Text(
                          loanDetail[7].value
                              ?? '-'                    ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Divider(thickness: 1,)),
                    ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.moneyBill1Wave,
                        color: ColorResources.accentColor,
                      ),
                      title: Text(type == 0 ?'Number Of Cylinders':'Collateral Coverage Ration'),
                      trailing: Text(
                          loanDetail[8].value
                              ?? '-'                    ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Divider(thickness: 1,)),
                    ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.timeline,
                        color: ColorResources.accentColor,
                      ),
                      title: Text(type == 0 ? 'Horsepower' : 'Building Score'),
                      trailing: Text(
                          loanDetail[9].value
                              ?? '-'                    ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Divider(thickness: 1,)),
                    ListTile(
                      leading: FaIcon(
                        FontAwesomeIcons.star,
                        color: ColorResources.accentColor,
                      ),
                      title: Text(type == 0 ? 'Car Score' : 'Blue Print ID'),
                      trailing: Text(
                          loanDetail[10].value ?? '-'
                      ),
                    ),

                  ],
                ),
              ),
            )
          ],
        )
    );
  }
}
