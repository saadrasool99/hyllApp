class DueFeesModel {

  // "response"{} < {}
  List<PendingFee>? pendingFeeList;    // "messages"[] < {}

  DueFeesModel({
    this.pendingFeeList
  });

  factory DueFeesModel.fromJson(Map <String,dynamic> json){


    List<dynamic> pendingFee=json['Pending Fee'];
    List<PendingFee> pendingFeeListData = pendingFee.map((i) =>  PendingFee.fromJson(i)).toList();

    return DueFeesModel(

        pendingFeeList: pendingFeeListData
    );
  }
}


class PendingFee {
  String? studentID;
  String? pending;
  String? profilePicture;
  String? studentName;
  String? rollNo;
  String? totalFee;
  List<DueMonth>? dueMonth;

  PendingFee({this.studentID, this.pending, this.dueMonth,this.rollNo,this.studentName,this.profilePicture,this.totalFee});
  factory PendingFee.fromJson(Map<String,dynamic> json){
    List<dynamic> dueMonthList =json['Month History'];
    List<DueMonth> dueMonthListData = dueMonthList.map((i) =>  DueMonth.fromJson(i)).toList();

    return PendingFee(

        studentID : json['StudentID'],
        pending : json['TotalFee'],
        rollNo: json['RollNo'],
        studentName: json['Name'],
        profilePicture: json['ProfilePicture'],

        dueMonth: dueMonthListData
    );
  }

}




class DueMonth {
  String? studentID;
  String? month;
  String? feeStatus;
  String? totalAmount;

  DueMonth({this.studentID, this.month, this.feeStatus,this.totalAmount});
  factory DueMonth.fromJson(Map<String,dynamic>json){
    return DueMonth(
        studentID : json['StudentID'],
        month : json['MonthYear'],
        feeStatus : json['FeeStatus'],
        totalAmount: json['TotalFee']
    );
  }



}