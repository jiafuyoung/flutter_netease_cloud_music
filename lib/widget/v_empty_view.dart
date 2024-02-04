import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VEmptyView extends StatelessWidget {
  final double height;

  const VEmptyView(this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().setWidth(height),
    );
  }
}
