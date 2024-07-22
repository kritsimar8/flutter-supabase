


import 'package:intl/intl.dart';

String formatDateBydMMMYYYY(DateTime dateTime){
  return DateFormat("d MM, yyy").format(dateTime);
}