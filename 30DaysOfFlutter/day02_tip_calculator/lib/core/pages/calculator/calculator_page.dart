import 'package:day02_tip_calculator/core/pages/calculator/widgets/amountTextField.dart';
import 'package:day02_tip_calculator/core/pages/calculator/widgets/calculateTipButton.dart';
import 'package:day02_tip_calculator/core/pages/calculator/widgets/tipResult.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _controller = TextEditingController();

  final List<bool> _selection = [true, false, false];

  String tip = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TipResult(tip: tip),
            const Text(
              "Total Amount",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Colors.black87,
              ),
            ),
            AmountTextField(controller: _controller),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ToggleButtons(
                children: const [
                  Text("11%"),
                  Text("15%"),
                  Text("23%"),
                ],
                isSelected: _selection,
                onPressed: updateSelection,
              ),
            ),
            CalculateTipButton(calculateTip: calculateTip),
          ],
        ),
      ),
    );
  }

  void updateSelection(int selectedIndex) {
    setState(() {
      for (int i = 0; i < _selection.length; i++) {
        _selection[i] = selectedIndex == i;
      }
    });
  }

  void calculateTip() {
    if (_controller.text.isNotEmpty) {
      final double totalAmount = double.parse(_controller.text);
      final int selectedIndex = _selection.indexWhere((element) => element);
      final double tipPercentage = [0.11, 0.15, 0.23][selectedIndex];

      final String tipTotal = (totalAmount * tipPercentage).toStringAsFixed(2);

      setState(() {
        tip = "$tipTotal PLN";
      });
    } else {
      setState(() {
        tip = "";
      });
    }
  }
}
