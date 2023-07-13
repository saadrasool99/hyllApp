import 'package:colours/colours.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hylltestcode/Globals/appTheme.dart';
import 'package:hylltestcode/Utilities.dart';

import '../CustomWidgets/customWidgets.dart';
import '../Globals/Globalvariables.dart';

class HyllFeedScreen extends StatefulWidget {
  const HyllFeedScreen({Key? key}) : super(key: key);

  @override
  State<HyllFeedScreen> createState() => _HyllFeedScreenState();
}

class _HyllFeedScreenState extends State<HyllFeedScreen> {
  double? screenHeight;
  double? screenWidth;

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {

    screenWidth=MediaQuery.of(context).size.width;
    screenHeight=MediaQuery.of(context).size.height;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(centerTitle: true,title: displayText("HYLL APP", clrText, 14, FontWeight.bold),backgroundColor: Colours.swatch(clrApp)),
      body: SizedBox(height: screenHeight,width: screenWidth,
      child:  ValueListenableBuilder(valueListenable: loadDataVn, builder: (context, value, child) {
        return
          loadDataVn.value==1?

              ListView.builder(
                  shrinkWrap: true,
                  itemCount:stuDueFeeDataList.length ,


                  itemBuilder: (context, index) {
                    return ListTile(

                        title: cardDueFees(context,index)
                    );
                  }):
          loadDataVn.value==2?
          Center(

            child:
            displayText("no data found!", clrText, 16, FontWeight.w600),
          ):
          Center(

            child:
            circularBar(),
          );

      },),
      ),
    );


  }

  @override
  void initState() {

    loadDataVn.value=0;

    _asyncMethod();
    super.initState();
  }
_asyncMethod()
  async {
    Utilities utilities=Utilities();

    Map map={
      "TableName":"StudentFee",
      "ID":"15"
    };

    print ("Student Fee Map:$map");


    await utilities.loadStudentDueFeeData(map).then((data) {


      stuDueFeeDataList=[];

      stuDueFeeDataList=data.pendingFeeList!;

      print("Data:${ stuDueFeeDataList.length}");




      print("Run the Command");

    }).whenComplete(() {
      if(stuDueFeeDataList.isEmpty)
      {
        loadDataVn.value=2;
      }
      else{
        loadDataVn.value=1;
      }

    });
  }



}
