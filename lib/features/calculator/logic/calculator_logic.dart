import 'package:math_expressions/math_expressions.dart'; 

class CalculatorLogic {
  static String calculateResult(String expression) {
    if (expression.isEmpty) return "0";

    try {
      String cleanedExpression = expression
          .replaceAll('✕', '*')
          .replaceAll('÷', '/');


      Parser p = Parser();
      Expression exp = p.parse(cleanedExpression);



ContextModel cm = ContextModel();
double result = exp.evaluate(EvaluationType.REAL, cm);

      if (result % 1 == 0) {
        return result.toInt().toString();


      } else {
        return result.toString();
      }
    } catch (e) {
      return '';
    }
  }
}
