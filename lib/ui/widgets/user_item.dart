import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rikai_app/core/models/user.dart';
import 'package:rikai_app/ui/shared/my_designation.dart';
import 'package:sizer/sizer.dart';

class UserItem extends StatelessWidget {
  const UserItem({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, "detail", arguments: user.login),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: SizedBox(
          height: 12.h,
          child: Card(
            elevation: 5.0,
            child: Row(
              children: [
                SizedBox(width: 2.w),
                Container(
                  height: 10.h,
                  width: 10.h,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.h),
                    child: CachedNetworkImage(
                      imageUrl: user.avatarUrl ?? "",
                      placeholder: (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ),
                SizedBox(width: 5.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(user.login ?? ""),
                    SizedBox(height: 1.h),
                    // MyDesignation(
                    //    designation: user.siteAdmin.toString(), mPadding: 5.0),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
