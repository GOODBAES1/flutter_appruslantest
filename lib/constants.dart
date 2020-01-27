import 'package:flutter/material.dart';
const textImputDecorations = InputDecoration(

      filled: true,
      enabledBorder: OutlineInputBorder(

          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide(color: Colors.blue)
      ),
      focusedBorder: OutlineInputBorder(

          borderSide: BorderSide(color: Colors.deepOrangeAccent),
      )
);