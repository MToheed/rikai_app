import 'package:flutter/material.dart';
import 'package:rikai_app/core/flows/view_state.dart';
import 'package:rikai_app/core/viewmodels/detail_model.dart';
import 'package:rikai_app/ui/views/base_view.dart';
import 'package:rikai_app/ui/widgets/user_detail.dart';
import 'package:sizer/sizer.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key, required this.username}) : super(key: key);

  final String username;

  @override
  Widget build(BuildContext context) {
    return BaseView<DetailModel>(
      onModelReady: (model) => model.callApi(username),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(title: const Text("Detail View")),
          body: (model.getState == ViewState.idle)
              ? Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 17.h,
                              width: 17.h,
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                shape: BoxShape.circle,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.h),
                                child: CachedNetworkImage(
                                  imageUrl: model.detail.avatarUrl ?? "",
                                  placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            ),
                            Text(
                              model.detail.name ?? "",
                              style: const TextStyle(fontSize: 18),
                            ),
                            const Divider(),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          UserDetail(
                            icon: Icons.person,
                            title: model.detail.login ?? "",
                          ),
                          UserDetail(
                            icon: Icons.location_on,
                            title: model.detail.location ?? "",
                          ),
                          UserDetail(
                            icon: Icons.link_rounded,
                            title: model.detail.blog ?? "",
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
