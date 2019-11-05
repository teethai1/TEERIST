class UserModel {
  // field ตัวแปร
  String id,resultCode,name,surName;

  // contructor  Method ทำเป็นตัว getter and setter
  UserModel(this.id,this.resultCode,this.name,this.surName);
  UserModel.fromJson(Map<String,dynamic> map ){
    id = map['id'];
    resultCode = map['ResultCode'];
    name = map['Name'];
    surName = map['Surname'];
  }
}