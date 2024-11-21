import 'package:get/get.dart';
import 'package:nova_demo/dashboard/settings/transactions/transactions_controller.dart';

class TransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionsController>(() => TransactionsController());
  }
}