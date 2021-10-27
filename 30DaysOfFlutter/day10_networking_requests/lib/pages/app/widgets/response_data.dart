// Packages
import 'package:flutter/material.dart';

class ResponseData extends StatelessWidget {
  final String response;
  const ResponseData(this.response, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Expanded(
        child: Text(
          response.toString(),
        ),
      ),
    );
  }
}
