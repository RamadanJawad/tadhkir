import 'package:get/get.dart';
import 'package:tadhkir/core/data/db.dart';
import 'package:tadhkir/core/model/card.dart';

class AllCardController extends GetxController {
  List<CardDate> card = [];
  MyDb myDb = MyDb();
  readCard() async {
    card = await myDb.readCard();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    readCard();
  }
}
