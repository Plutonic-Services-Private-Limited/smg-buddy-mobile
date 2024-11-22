import 'package:smg_buddy_app/constants/api_paths.dart';
import 'package:smg_buddy_app/utils/network_requester.dart';

class OrderRepository{

  Future<List> getOrders() async {
    var response = await NetworkRequester.shared
        .post(path: ApiPaths.getOrders,data: {"id":"60004"});
    return response != null
        ? response
        : [];
  }

}
