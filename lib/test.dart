import 'package:store/static_datas/notifications_List.dart';


void main(){
  print("hi");


  notificationsList.add(Notification("message", false));

  print( notificationsList[0].removable);
}