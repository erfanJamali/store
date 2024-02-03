//import 'dart:ffi';

class Account {

  String userNameAccount;
  String passwordAccount;
  String gmailAccount;

  Account(this.userNameAccount, this.passwordAccount, this.gmailAccount);
}

List<Account> accountsList = [

  Account("Jerfan367", "erfan123", "jerfan367@gmail.com"),

];

bool isSigned = false;