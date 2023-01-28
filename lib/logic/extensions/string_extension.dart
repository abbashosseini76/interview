import 'package:interview/logic/calculator.dart';

extension StringExtension on String {
  bool get isNumber => double.tryParse(this) != null;
  double get asNumber => double.tryParse(this)!;
  double get calculate => Calculator.calculate(this);
}
