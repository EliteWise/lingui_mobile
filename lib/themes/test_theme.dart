import 'package:flutter/material.dart';

class Test extends ThemeExtension<Test> {

  const Test({
    required this.param,
  });

  final String? param;

  @override
  ThemeExtension<Test> copyWith({String? param}) {
    return Test(
      param: param ?? this.param
    );
  }

  @override
  ThemeExtension<Test> lerp(covariant ThemeExtension<Test>? other, double t) {
    // TODO: implement lerp
    throw UnimplementedError();
  }
  
}