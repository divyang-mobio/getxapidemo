import 'package:get/get.dart';
import '../utils/api_call.dart';
import '../models/api_model.dart';

class DataFetching extends GetxController {
  RxBool checker = false.obs;
  List<DataModel> data = <DataModel>[];

  // @override
  // void onInit() {
  //   super.onInit();
  //   apiCalling();
  // }

  apiCalling() async {
    HttpServices httpServices = HttpServices();
    try {
      data = await httpServices
          .getCall("https://jsonplaceholder.typicode.com/posts");
      checker.value = true;
    } catch (e) {
      checker.value = true;
      print(e);
    }
  }
}
