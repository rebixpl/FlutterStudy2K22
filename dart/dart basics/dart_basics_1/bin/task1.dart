void main(List<String> args) {
  String sen = "fun&!! time";
  List<String> words = sen.split(" ");

  int longestWordIndex = 0;

  for (int i = 0; i < words.length; i++) {
    if (i == 0) {
      longestWordIndex = 0;
    } else {
      if (words[i].length > words[i - 1].length) {
        longestWordIndex = i;
      } else {
        longestWordIndex = i - 1;
      }
    }
  }
  print(longestWordIndex);
}
