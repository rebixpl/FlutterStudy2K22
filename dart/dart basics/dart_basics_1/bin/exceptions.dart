class BankAccount {
  double balance;
  // BankAccount({required this.balance});

  BankAccount.newClient(double balance) : this.balance = balance {
    if (balance < 0) throw ZeroBalanceException(balance);
  }
}

void main(List<String> args) {
  var list = [1, 2, 3, 4, 5];

  try {
    var account = BankAccount.newClient(-100);
    print(account.balance);
  } on ZeroBalanceException catch (e) {
    print(e);
  }

  try {
    print(list[10]);
  } catch (e) {
    print(e);
  } finally {
    print("Done");
  }
}

// Creating our own exception
class ZeroBalanceException implements Exception {
  final double balance;
  const ZeroBalanceException(this.balance);

  @override
  String toString() {
    return "ZeroBalanceException: Balance: $balance Your balance cannot be less than 0";
  }
}
