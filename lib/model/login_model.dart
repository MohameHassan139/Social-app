class LoginInfo {
  late bool status;
  late String message;
  late UserData? data;

  LoginInfo.fromjson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
     data=json['data'] == null?null: UserData.fromjson(json['data']);
  }
}

class UserData {
  late int id;
  late String name;
  late String email;
  late String phone;
  late String image;
  late int points;
  late int credit;
  late String token;

  UserData.fromjson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }


}
