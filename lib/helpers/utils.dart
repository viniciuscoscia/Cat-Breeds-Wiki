import 'package:url_launcher/url_launcher.dart';

void launchURL(String url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

extension NullableStringExtensions on String? {
  String orEmpty() {
    return this ?? "";
  }
}

extension NullableNumberExtensions on int? {
  int orZero() {
    return this ?? 0;
  }

  bool toBoolean() {
    return this == null ? false : this == 1;
  }
}

extension BooleanExtensions on bool {
  String toYesOrNoText() {
    return this == false ? "No" : "Yes";
  }
}