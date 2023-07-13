
import 'package:colours/colours.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hylltestcode/Globals/appTheme.dart';

import '../Globals/Globalvariables.dart';

Widget displayText(String text,String color,double fontSize,FontWeight fontWeight)
{
  return
    Text(text,style: TextStyle(color: Colours.swatch(color),fontSize: fontSize,fontWeight: fontWeight));
}
Widget circularBar(){
  return
    CircularProgressIndicator(
      color: Colours.swatch(clrText),);
}





Widget cardDueFees(BuildContext context,int index)
{
  return
    Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colours.swatch(clrTile),
        ),
        width: 160,

        child:Padding(
          padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
          child:   Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(

                          radius: 25,
                          child: Icon(Icons.ac_unit_outlined,size: 25,),),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            displayText(stuDueFeeDataList[index].studentName.toString(), clrText, 14, FontWeight.bold),
                            displayText("Roll # ${stuDueFeeDataList[index].rollNo.toString()}", clrText, 10, FontWeight.normal),
                          ],),
                      ],),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [

                            displayText("${stuDueFeeDataList[index].pending.toString()} PKR", clrText, 14, FontWeight.bold),

                            Container(
                                width: 70,
                                height: 15,

                                decoration: BoxDecoration(color: Colours.swatch(clrTextPurple),borderRadius: BorderRadius.circular(15)),
                                child: Center(child: displayText("Pending", clrWhite, 10, FontWeight.normal))),
                          ],)
                      ],
                    )

                  ],
                ),
              ),
              for(int count=0;count<stuDueFeeDataList[index].dueMonth!.length;count++)
                Column(children: [
                  Divider(color: Colours.swatch(clrDivider)),
                  SizedBox(
                    height: MediaQuery.of(context).size.height/25,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            displayText(stuDueFeeDataList[index].dueMonth![count].month.toString(), clrText, 14, FontWeight.bold),
                            displayText("Due Date: ${stuDueFeeDataList[index].dueMonth![count].feeStatus.toString()}", clrText, 10, FontWeight.normal),
                          ],),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(

                                height: 15,
                                width: 50,

                                decoration: BoxDecoration(color: Colours.swatch(clrDueFeeStatus),borderRadius: BorderRadius.circular(15)),
                                child: Center(child: displayText("Due", clrWhite, 10, FontWeight.normal))),
                            displayText("${stuDueFeeDataList[index].dueMonth![count].totalAmount.toString()} PKR", clrText, 10, FontWeight.normal),

                          ],)
                        /*  Container(
                  width: 70,
                  height: 15,

                  decoration: BoxDecoration(color: Colours.swatch(stuDueFeeDataList[index].dueMonth![count].feeStatus.toString()=="Due"?clrTextPurple:clrFeeStatusPaid),borderRadius: BorderRadius.circular(15)),
                  child: Center(child: displayText(stuDueFeeDataList[index].dueMonth![count].feeStatus.toString(), clrWhite, 10, fontSegue, FontWeight.normal))),
               */
                      ],),
                  )
                ],),




            ],),
        ));

}

