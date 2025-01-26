import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends ChangeNotifier {
  num _value = 0;
  List<CalculatorVariable> _actions = [CalculatorNumber('0')];

  num get value => _value;
  CalculatorVariable get currentVariable => _actions.isNotEmpty ? _actions.last : CalculatorNumber('0');

  void add() => _takeAction(CalculatorAdd(), when: _actions.last is! CalculatorAdd);
  void subtract() => _takeAction(CalculatorSubtract(), when: _actions.last is! CalculatorSubtract);
  void multiply() => _takeAction(CalculatorMultiply(), when: _actions.last is! CalculatorMultiply);
  void divide() => _takeAction(CalculatorDivide(), when: _actions.last is! CalculatorDivide);

  void _takeAction(CalculatorVariable action, {required bool when}) {
    if (when) {
      if (_actions.isNotEmpty && _actions.last is MathOperator) {
        _actions.removeLast();
      } else {
        _value = _parseCalculatorActions(_actions);
      }
      _actions.add(action);
      notifyListeners();
    }
  }

  void reset() {
    _actions = [CalculatorNumber('0')];
    _value = 0;
    notifyListeners();
  }

  void showResult() {
    _value = _parseCalculatorActions(_actions);
    notifyListeners();
  }

  void setValue(num number) {
    if (_actions.last is! CalculatorNumber) {
      _value = 0;
    }
    final newValue = _value == 0 ? number.toString() : '$_value$number';
    _value = num.parse(newValue);

    if (_actions.last is CalculatorNumber) _actions.removeLast();
    _actions.add(CalculatorNumber(_value.toString()));
    notifyListeners();
  }

  num _parseCalculatorActions(List<CalculatorVariable> actions) {
    if (actions.isEmpty) return 0;

    final equation = actions.map((action) => action.value).join(' ');
    try {
      final expression = Parser().parse(equation);
      final result = expression.evaluate(EvaluationType.REAL, ContextModel());
      return isInteger(result) ? result.round() : result;
    } catch (e) {
      debugPrint('Error parsing equation: $equation. Exception: $e');
      throw Exception('Error parsing equation: $equation'); // Improved error handling
    }
  }
}

abstract class CalculatorVariable {
  final String value;
  CalculatorVariable(this.value);
}

abstract class MathOperator {}

class CalculatorAdd extends CalculatorVariable {
  CalculatorAdd() : super('+');
}

class CalculatorSubtract extends CalculatorVariable {
  CalculatorSubtract() : super('-');
}

class CalculatorMultiply extends CalculatorVariable {
  CalculatorMultiply() : super('*');
}

class CalculatorDivide extends CalculatorVariable {
  CalculatorDivide() : super('/');
}

class CalculatorNumber extends CalculatorVariable {
  CalculatorNumber(String value) : super(value);
}

bool isInteger(num value) => value is int || value == value.roundToDouble();
