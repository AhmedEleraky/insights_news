import 'package:flutter/material.dart';

navigateTo(context, Widget nextScreen) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => nextScreen));
}

navigateWithReplacement(context, Widget nextScreen) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (context) => nextScreen));
}
