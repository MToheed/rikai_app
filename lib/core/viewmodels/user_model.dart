import 'package:rikai_app/core/flows/view_state.dart';
import 'package:rikai_app/core/viewmodels/base_model.dart';
import '../flows/locator.dart';
import '../models/user.dart';
import '../services/api.dart';

class UserModel extends BaseModel {
  final api = locator<Api>();
  List<User> users = [];
  bool isLoadingList = false;

  Future<void> callApi(int start, {required ViewState state}) async {
    try {
      setState(state);
      List<User> res = await api.allUserApi(start);
      users.addAll(res);
      isLoadingList = false;
      setState(ViewState.idle);
    } catch (e) {
      setState(ViewState.idle);
      return Future.error(e.toString());
    }
  }
}
