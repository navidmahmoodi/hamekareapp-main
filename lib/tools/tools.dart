// ignore_for_file: unnecessary_this

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:hamekare_app/theme/theme2.dart';

import 'hex_color.dart';
import 'route.dart' as route;

export 'common.dart';
export 'hex_color.dart';
export 'package:hamekare_app/Theme/theme2.dart';

final abjad = [
  "الف",
  "ب",
  "ج",
  "د",
  "ه",
  "و",
  "ز",
  "ح",
  "ط",
  "ی",
  "ک",
  "ل",
  "م",
  "ن",
  "س",
  "ع",
  "ف",
  "ص",
  "ق"
];
toRPage(String name, {dynamic argument, bool preventDuplicates = true}) {
  route.navigateToPushReplacement(name, argument,
      preventDuplicates: preventDuplicates);
}

toCPage(String name, {dynamic argument}) {
  route.navigateToPushAndRemoveUntil(name, argument);
}

toGetPage(String page, {dynamic argument}) {
  Get.toNamed(page);
}

toPage(String name,
    {dynamic argument, Function? then, bool preventDuplicates = true}) {
  route.navigateToPush(name, argument, then,
      preventDuplicates: preventDuplicates);
}

pop([dynamic data]) {
  route.navigatePop(data);
}

// toMain() {
//   final MainController mainController = Get.find();
//   var p = "/main";
//   // if (!mainBloc.isUserLogin()) p = "/register";
//   // if (!mainBloc.showIntro())
//   //   p = "/intro";
//   // else if (!mainBloc.isUserLogin())
//   //   p = "/verifyPhone";
//   if (!mainController.isUserFilledProfile())
//     p = "/profile";
//   else if (!mainController.showIntro()) p = "/intro";
//   toCPage(p);
// }

bool isPhone(String tel) {
  if (tel.length == 11 && isNumeric(tel)) {
    return true;
  }
  return false;
}

bool isNumeric(String? s) {
  if (s == null) {
    return false;
  }
  return int.tryParse(s) != null;
}

class ShowMSG {
  ShowMSG();
  void error(String title, String msg) {
    Get.snackbar(
      title,
      msg,
      animationDuration: const Duration(milliseconds: 400),
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.red,
    );
  }

  void info(String title, String msg) {
    Get.snackbar(
      title,
      msg,
      animationDuration: const Duration(milliseconds: 400),
      duration: const Duration(seconds: 3),
    );
  }

  void errorWithButton(
      {String title = "",
      String msg = "",
      required Widget btn,
      Function? onClose}) {
    Get.showSnackbar(
      GetSnackBar(
        title: title,
        message: msg,
        isDismissible: false,
        animationDuration: const Duration(milliseconds: 400),
        mainButton: btn,
        snackPosition: SnackPosition.BOTTOM,
      ),
    ).future.then(
      (_) {
        onClose!.call();
      },
    );
    // return Get.snackbar(
    //   title,
    //   msg,
    //   animationDuration: Duration(milliseconds: 400),
    //   // backgroundColor: Colors.black54,
    //   mainButton: btn,
    //   isDismissible: false,
    //   snackPosition: SnackPosition.BOTTOM,
    // );
  }

  void showBar(GetSnackBar bar) {
    Get.showSnackbar(bar);
  }

  GetSnackBar snackBarWidget(
      {String title = "", String msg = "", required Widget btn}) {
    return GetSnackBar(
      title: title,
      message: msg,
      isDismissible: false,
      animationDuration: const Duration(milliseconds: 400),
      mainButton: btn,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  showSnackBar(String msg) {
    Get.showSnackbar(GetSnackBar(
      duration: const Duration(seconds: 2),
      message: msg,
    ));
  }
}

class ShowToast {
  ShowToast(BuildContext context);

  Widget toast(msg) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: "eeeeee".toColor(),
        ),
        child: Text(msg),
      );

  void show(String msg) {
    Fluttertoast.showToast(
      backgroundColor: "777777".toColor(),
      msg: msg,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      webBgColor: "#333333",
    );
  }
}

final DateFormat dateTimeFormatter = DateFormat('yyyy-MM-dd');

extension MDateTime on DateTime {
  DateTime addDays(days) =>
      Jalali.fromDateTime(this).addDays(days).toDateTime();

  String toDate() => dateTimeFormatter.format(this);
  Jalali toJalali() => Jalali.fromDateTime(this);

  String formatter(String format) => DateFormat(format).format(this);
  int getTimeDuration() {
    return Duration(hours: this.hour, minutes: this.minute).inMinutes;
  }

  String cDate([int type = 1]) {
    var c = Jalali.fromDateTime(this);
    final f = c.formatter;

    switch (type) {
      case 1:
        return '${f.wN} ${f.d} ${f.mN} ${f.yy}';
      case 2:
        return '${f.d} ${f.mN}';
      case 3:
        return '${f.mN} ${f.yy}';
      case 4:
        return '${f.wN} ${f.d} ${f.mN} ${f.yyyy}';
      case 5:
        return '${f.wN} ${f.d} ${f.mN} ${f.yyyy} ساعت ${this.hour}:${this.minute}';
      case 6:
        return '${f.wN} ${f.d} ${f.mN} ${f.yyyy} - ${this.hour}:${this.minute}';
      case 7:
        return '${f.yyyy}/${f.mm}/${f.dd}';
      default:
        return '${f.wN} ${f.d} ${f.mN} ${f.yy}';
    }
  }
}

extension MyStringExtension on String {
  int toNumber(String seprator) => int.parse(this.replaceAll(seprator, ""));
}

Jalali jalaliParse(String txt) {
  var s = txt.split("/").map((e) => int.parse(e)).toList();
  return Jalali(s[0], s[1], s[2]);
}

wrapWB(void Function(Duration) f) {
  WidgetsBinding.instance.addPostFrameCallback(f);
}

String t1tl(String t, int l) {
  return t.length < l ? t1tl('0$t', l) : t;
}

Widget simpleLoading() {
  return Center(
    child: CircularProgressIndicator(
      color: MyThemes.primaryColor,
    ),
  );
}

Widget simpleEmptyBox({
  VoidCallback? onPressed = pop,
  String title = "مقداری یافت نشد",
  String buttonText = "مقداری یافت نشد",
  String subtitle = "",
  String image = "",
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      if (image != "") Expanded(child: Image.asset(image)),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: MyThemes.headline1,
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          subtitle,
          textAlign: TextAlign.center,
        ),
      ),
      const SizedBox(height: 10),
      if (onPressed != null)
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ElevatedButton(onPressed: onPressed, child: Text(buttonText)),
        ),
      const SizedBox(height: 30),
    ],
  );
}

Widget simpleButtonLoading() {
  return const ElevatedButton(
    onPressed: null,
    child: SizedBox(
      height: 26,
      child: Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.transparent,
        ),
      ),
    ),
  );
}

String getFontUri(ByteData data, String mime) {
  final buffer = data.buffer;
  return Uri.dataFromBytes(
          buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
          mimeType: mime)
      .toString();
}

Future<String> addFontToHtml(
    String htmlContent, String fontAssetPath, String fontMime) async {
  final fontData = await rootBundle.load(fontAssetPath);
  final fontUri = getFontUri(fontData, fontMime).toString();
  final fontCss =
      '@font-face { font-family: customFont; src: url($fontUri); } * {direction:rtl;text-align:right;font-family: customFont!important; }';
  return '<style>$fontCss</style>$htmlContent';
}

Future<Uri> getUriFromString(String html) async {
  String completeHtml =
      await addFontToHtml(html, "assets/fonts/IRANSansWeb.woff", "font/woff");

  return Uri.dataFromString(completeHtml,
      mimeType: 'text/html', encoding: Encoding.getByName('utf-8'));
}

lostFocus(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}

launchURL(String url) async {
  Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}

List<int> minutesToHM(int minutes) {
  final int hour = minutes ~/ 60;
  final int m = minutes % 60;
  return [hour, m];
}

int stringTimeToMinutes(String time) {
  try {
    List<String> parts = time.split(':');
    return ((int.parse(parts[0]) * 60) + int.parse(parts[1]));
  } catch (e) {
    return 0;
  }
}

// void shareApp() {
//   var body = "برنامه تپش";
//   Share.share('$body\n${ServerConfig.urlMain}');
// }

String dTS(int minutes) {
  var d = Duration(minutes: minutes);
  List<String> parts = d.toString().split(':');
  return '${parts[0]}:${parts[1]}';
}

String getWDbyIndex(
  int index,
) {
  String r = "خالی";
  switch (index) {
    case 1:
      r = "شنبه";
      break;
    case 2:
      r = "یکشنبه";
      break;
    case 3:
      r = "دوشنبه";
      break;
    case 4:
      r = "سه‌شنبه";
      break;
    case 5:
      r = "چهار‌شنبه";
      break;
    case 6:
      r = "پنج‌شنبه";
      break;
    case 7:
      r = "جمعه";
      break;
    default:
      r = "خالی";
  }

  return r;
}

String selectedtime(
  int index,
) {
  String r = "خالی";
  switch (index) {
    case 0:
      r = "ساعت 6 الی 8";
      break;
    case 1:
      r = "ساعت 8 الی 10";
      break;
    case 2:
      r = "ساعت 10 الی 12";
      break;
    case 3:
      r = "ساعت 12 الی 14";
      break;
    case 4:
      r = "ساعت 14 الی 16";
      break;
    case 5:
      r = "ساعت 16 الی 18";
      break;
    case 6:
      r = "ساعت 18 الی 20";
      break;
    case 7:
      r = "ساعت 20 الی 22";
      break;
    case 8:
      r = "ساعت 22 الی 00";
      break;

    default:
      r = "خالی";
  }

  return r;
}

String getMonthbyIndex(
  int index,
) {
  String r = "خالی";
  switch (index) {
    case 1:
      r = "فروردین";
      break;
    case 2:
      r = "اردیبهشت";
      break;
    case 3:
      r = "خرداد";
      break;
    case 4:
      r = "تیر";
      break;
    case 5:
      r = "مرداد";
      break;
    case 6:
      r = "شهریور";
      break;
    case 7:
      r = "مهر";
      break;
    case 8:
      r = "آبان";
      break;
    case 9:
      r = "آذر";
      break;
    case 10:
      r = "دی";
      break;
    case 11:
      r = "بهمن";
      break;
    case 12:
      r = "اسفند";
      break;
    default:
      r = "خالی";
  }

  return r;
}

int timeStringToMin(String t) {
  List<String> parts = t.split(':');
  return ((int.parse(parts[0]) * 60) + int.parse(parts[1]));
}

extension Jalali2 on Jalali {
  String toStr() {
    var f = this.formatter;
    return "${f.yyyy}/${f.mm}/${f.dd}";
  }

  Jalali fromString(String txt) {
    var s = txt.split("/").map((e) => int.parse(e)).toList();
    return Jalali(s[0], s[1], s[2]);
  }

  String cDate([int type = 1]) {
    return this.toDateTime().cDate(type);
  }
}

String toENGNumber(String txt) {
  return txt
      .replaceAll("۱", "1")
      .replaceAll("۲", "2")
      .replaceAll("۳", "3")
      .replaceAll("۴", "4")
      .replaceAll("۵", "5")
      .replaceAll("۶", "6")
      .replaceAll("۷", "7")
      .replaceAll("۸", "8")
      .replaceAll("۹", "9")
      .replaceAll("۰", "0");
}

String toFaNumber(String txt) {
  return txt
      .replaceAll("1", "۱")
      .replaceAll("2", "۲")
      .replaceAll("3", "۳")
      .replaceAll("4", "۴")
      .replaceAll("5", "۵")
      .replaceAll("6", "۶")
      .replaceAll("7", "۷")
      .replaceAll("8", "۸")
      .replaceAll("9", "۹")
      .replaceAll("0", "۰");
}

DateTime dateZeroTime(DateTime date) {
  return DateTime(date.year, date.month, date.day);
}

String toCurrency(number) {
  var cf = NumberFormat('###,###', 'en_US');
  return cf.format(number);
}

int selectionIndexFromTheRight(int nvLength, int nvOffset, int nsLength) =>
    nsLength - (nvLength - nvOffset);

TextSelection getTextSelection(int p) => TextSelection.collapsed(offset: p);

class ColumnBuilder extends StatelessWidget {
  final IndexedWidgetBuilder itemBuilder;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;
  final TextDirection? textDirection;
  final VerticalDirection verticalDirection;
  final int itemCount;

  const ColumnBuilder({
    Key? key,
    required this.itemBuilder,
    required this.itemCount,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: new List.generate(
          this.itemCount, (index) => this.itemBuilder(context, index)).toList(),
    );
  }
}
