import 'package:flutter/material.dart';
import 'package:rikai_app/core/flows/view_state.dart';
import 'package:rikai_app/core/viewmodels/user_model.dart';
import 'package:rikai_app/ui/views/base_view.dart';
import 'package:rikai_app/ui/widgets/user_item.dart';

class AllUserView extends StatefulWidget {
  const AllUserView({Key? key}) : super(key: key);

  @override
  State<AllUserView> createState() => _AllUserViewState();
}

class _AllUserViewState extends State<AllUserView> {
  final _scrollController = ScrollController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BaseView<UserModel>(
      onModelReady: (model) => model.callApi(0, state: ViewState.busy),
      builder: (context, model, child) {
        return Scaffold(
            appBar: AppBar(title: const Text("All Users View")),
            body: showLayout(model));
      },
    );
  }

  Widget showLayout(UserModel model) {
    if (model.getState == ViewState.idle ||
        model.getState == ViewState.loadMore) {
      _scrollController.addListener(() {
        if (_scrollController.position.maxScrollExtent ==
            _scrollController.position.pixels) {
          if (!model.isLoadingList) {
            model.isLoadingList = !model.isLoadingList;
            currentIndex = currentIndex + 20;
            if (currentIndex <= 100) {
              model.callApi(currentIndex, state: ViewState.loadMore);
            }
          }
        }
      });
      return Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: model.users.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (_, index) {
                return UserItem(user: model.users[index]);
              },
            ),
          ),
          if (model.isLoadingList)
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: CircularProgressIndicator(),
            ),
        ],
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
