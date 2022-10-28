import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../shared/my_designation.dart';

// ignore: must_be_immutable
class UserDetail extends StatelessWidget {
  UserDetail(
      {Key? key, required this.icon, required this.title, this.designation})
      : super(key: key);

  final IconData icon;
  final String title;
  String? designation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(icon, size: 5.h),
          SizedBox(width: 3.h),
          Column(
            children: [
              Text(title),
              (designation != null)
                  ? const MyDesignation(designation: "", mPadding: 3.0)
                  : Container(),
            ],
          )
        ],
      ),
    );
  }
}
