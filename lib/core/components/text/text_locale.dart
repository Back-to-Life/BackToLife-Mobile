import 'package:flutter/material.dart';

import '../../extension/string_extension.dart';

class LocalText extends StatelessWidget {
  final String? value;
  const LocalText({Key? key, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(value!.locale);
  }
}
