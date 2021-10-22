import 'package:flutter/material.dart';
import './widgets/toggles_buttons.dart';
import './widgets/input_field.dart';
import './widgets/tip_amount.dart';
import './widgets/calculate_tip_button.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _textFieldController = TextEditingController();

  double _tip = 0;
  final List<bool> _togglesSelection =
      TogglesButtons.togglesValues.map((e) => false).toList()
        ..removeLast()
        ..add(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TipAmount(tip: _tip),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                "Total Amount",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            InputField(textFieldController: _textFieldController),
            TogglesButtons(
              togglesSelection: _togglesSelection,
              togglePressed: togglePressed,
            ),
            CalculateTipButton(onPressed: calculateTip),
          ],
        ),
      ),
    );
  }

  void togglePressed(int index) {
    if (!_togglesSelection[index]) {
      setState(() {
        for (int i = 0; i < _togglesSelection.length; i++) {
          _togglesSelection[i] = i == index;
        }
      });
    }
  }

  void calculateTip() {
    final double? totalAmount = double.tryParse(_textFieldController.text);
    if (totalAmount != null) {
      final int selectedIndex =
          _togglesSelection.indexWhere((element) => element);
      final double tipPercentage =
          double.parse("0.${TogglesButtons.togglesValues[selectedIndex]}");

      setState(() {
        _tip = totalAmount * tipPercentage;
      });
    }
  }
}
