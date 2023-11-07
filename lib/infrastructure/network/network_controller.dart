import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_application_1/common/platform/connectivity.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NetWorkController extends GetxController {
  // Got a new connectivity status!

  final box = GetStorage();

  var connectionstatus = 0.obs;
  var Mycount = 0.obs;
  int get count => Mycount.value;

  StreamController<double> controller = StreamController<double>();
  StreamSubscription<double> streamSubscription;

  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _subscription;
  StreamSubscription<GetStorage> _storage_subs;
  var storage_subs;

  @override
  void onInit() {
    super.onInit();

    _subscription =
        _connectivity.onConnectivityChanged.listen(onConnectivityChange);
  }

  void onConnectivityChange(ConnectivityResult result) {
    Get.snackbar("Changes on Ineternt", result.toString());
  }

  Future<void> connectivity() async {
    ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } catch (e) {
      Get.snackbar("error", e);
    }
    return _updateConnectionStatus(result);
  }

  _updateConnectionStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        connectionstatus.value = 1;
        break;

      case ConnectivityResult.mobile:
        connectionstatus.value = 2;
        break;

      case ConnectivityResult.none:
        Get.snackbar("Checking for Internet Connection", "");
        connectionstatus.value = 3;
        break;

      default:
        Get.snackbar("Checking for Internet Connection", "");
        break;
    }
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    _subscription.cancel();
    streamSubscription.cancel();
    //box.removeListen(listen);
  }
}
