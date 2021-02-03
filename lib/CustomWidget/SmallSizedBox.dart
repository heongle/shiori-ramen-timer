import 'package:flutter/material.dart';

class SmallSizedBox extends SizedBox {
  static final double ht = 40.0;
  SmallSizedBox({@required Widget child}) : super(width: 24.0, height: ht, child: child);
  SmallSizedBox.spacing() : super(width: 15.0, height: ht);
}