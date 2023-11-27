Map<int, String> monthNames = {
  1: 'янв',
  2: 'фев',
  3: 'марта',
  4: 'апр',
  5: 'мая',
  6: 'июня',
  7: 'июля',
  8: 'авг',
  9: 'сен',
  10: 'окт',
  11: 'нояб',
  12: 'дек'
};

String convertDate(String inputDate) {
  List<String> dateParts = inputDate.split('-');
  int day = int.parse(dateParts[2]);
  int month = int.parse(dateParts[1]);
  int year = int.parse(dateParts[0]);
  String monthName = monthNames[month] ?? '';
  String result = '$day $monthName.';
  return result;
}
