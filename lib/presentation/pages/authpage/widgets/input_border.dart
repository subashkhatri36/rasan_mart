import 'package:flutter/material.dart';
import 'package:rasan_mart/core/constant/defaultvalue.dart';

OutlineInputBorder buildOutlineInputBorder(BuildContext context) {
  return new OutlineInputBorder(
    borderRadius: new BorderRadius.circular(
      Defaultvalue.defaultPadding / 2,
    ),
    borderSide: BorderSide(
      color: Theme.of(context).primaryColor,
      width: 2.0,
    ),
  );
}
