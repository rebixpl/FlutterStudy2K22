import 'package:flutter/material.dart';

class TweenAnimationBuilderPage extends StatelessWidget {
  const TweenAnimationBuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TweenAnimationBuilder"),
      ),
      body: Center(
        child: HSVColorSelector(),
      ),
    );
  }
}

class HSVColorSelector extends StatefulWidget {
  const HSVColorSelector({Key? key}) : super(key: key);

  @override
  _HSVColorSelectorState createState() => _HSVColorSelectorState();
}

class _HSVColorSelectorState extends State<HSVColorSelector> {
  double _hue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 1500),
          width: 200.0,
          height: 200.0,
          color: HSVColor.fromAHSV(1.0, _hue, 1.0, 1.0).toColor(),
        ),
        SizedBox(height: 10.0),
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0.0, end: _hue),
          duration: Duration(milliseconds: 1500),
          builder: (context, hue, child) {
            return Container(
              width: 200.0,
              height: 200.0,
              color: HSVColor.fromAHSV(1.0, hue, 1.0, 1.0).toColor(),
            );
          },
        ),
        SizedBox(height: 48.0),
        Container(
          height: 30.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                for (double i = 0.0; i <= 360.0; i++)
                  HSVColor.fromAHSV(1.0, i, 1.0, 1.0).toColor(),
              ],
              stops: [for (double i = 0.0; i <= 360.0; i++) i / 360.0],
            ),
          ),
        ),
        Slider.adaptive(
          value: _hue,
          min: 0.0,
          max: 360.0,
          onChanged: (value) => setState(() => _hue = value),
        ),
      ],
    );
  }
}
