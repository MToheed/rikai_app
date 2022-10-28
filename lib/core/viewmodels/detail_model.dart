import 'package:rikai_app/core/models/detail.dart';
import 'package:rikai_app/core/viewmodels/base_model.dart';
import '../flows/locator.dart';
import '../flows/view_state.dart';
import '../services/api.dart';

class DetailModel extends BaseModel {
  final api = locator<Api>();
  var detail = Detail();

  Future<void> callApi(String username) async {
    try {
      setState(ViewState.busy);
      detail = await api.detailApi(username);
      setState(ViewState.idle);
    } catch (e) {
      setState(ViewState.idle);
      return Future.error(e.toString());
    }
  }
}
