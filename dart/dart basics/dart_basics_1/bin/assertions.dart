class BankAccount2 {
  double balance;
  BankAccount2({required this.balance})
      : assert(balance >= 0, "The balance can't be a negative value!");
}

void user(String name, String password) {
  assert(name.isNotEmpty, "The user name should not be empty!");
  assert(password.isNotEmpty, "The password should not be empty!");
}

void main(List<String> args) {
  var account = BankAccount2(balance: -100);
  print(account.balance);

  user("John", '');
}
