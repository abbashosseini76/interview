import 'package:interview/logic/extensions/string_extension.dart';

class Calculator {
  static double calculate(String expression) {
    if (expression.isNumber) {
      return expression.asNumber;
    } else if (expression.contains('(')) {
      return calculate(omitParentheses(expression));
    } else {
      Map<String, String> e = breakExpression(expression);
      return solve(
          calculate(e['left']!), calculate(e['right']!), e['operator']!);
    }
  }

  static String omitParentheses(String expression) {
    final startIndex = expression.indexOf('(');
    late int endIndex;
    int innerParenthesesCount = 0;
    for (int i = startIndex + 1; i < expression.length; i++) {
      if (expression[i] == '(') {
        innerParenthesesCount++;
      } else if (expression[i] == ')') {
        innerParenthesesCount--;
      }
      if (innerParenthesesCount < 0) {
        endIndex = i;
        break;
      }
    }
    final parenthes = expression.substring(startIndex, endIndex + 1);
    final resultOfParentheses =
        calculate(expression.substring(startIndex + 1, endIndex));
    return expression.replaceFirst(parenthes, '$resultOfParentheses');
  }

  static double solve(double left, double right, String operator) {
    switch (operator) {
      case '+':
        return left + right;
      case '-':
        return left - right;
      case '*':
        return left * right;
      case '/':
        return left / right;
      default:
        return 0;
    }
  }

  static Map<String, String> breakExpression(String expression) {
    late int operationIndex;
    late String left;
    late String right;
    late String operator;
    final array = expression.split('');
    if (array.contains('+') || array.contains('-')) {
      operationIndex = max(array.lastIndexOf('+'), array.lastIndexOf('-'));
    } else if (array.contains('*') || array.contains('/')) {
      operationIndex = max(array.lastIndexOf('*'), array.lastIndexOf('/'));
    }
    left = expression.substring(0, operationIndex);
    right = expression.substring(operationIndex + 1, expression.length);
    operator = expression[operationIndex];
    return {
      'left': left,
      'right': right,
      'operator': operator,
    };
  }

  static int max(int a, int b) {
    return a > b ? a : b;
  }
}
