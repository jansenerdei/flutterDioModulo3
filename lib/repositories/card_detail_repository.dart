import 'package:trilhaapp/model/card.detail.dart';

class CardDetailRepository {
  Future<CardDetail> get() async {
    await Future.delayed(const Duration(seconds: 5));
    return CardDetail(
        1,
        "Meu Card",
        "https://avatars.githubusercontent.com/u/115055477?v=4",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam in ligula tincidunt, blandit dolor nec, ullamcorper eros. Nunc pharetra pulvinar elementum. Pellentesque lobortis ut augue eu ullamcorper. Suspendisse potenti. Suspendisse commodo elit nibh, a consectetur justo feugiat in. Nulla eget quam varius, viverra nisl vitae, ullamcorper velit. Quisque placerat porta ex, et efficitur magna ornare nec. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc eget magna semper ipsum sollicitudin venenatis eu vel lorem. Etiam ornare rutrum porta. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Vivamus tristique venenatis eros, eu vulputate velit luctus ac. Nulla non dolor nibh.");
  }
}
