import 'package:flutter/material.dart';

const Color green=Color.fromRGBO(54, 180, 75, 1);
const Color yellow=Color.fromRGBO(244, 216, 37, 1);
const Color black=Color.fromRGBO(0, 0, 0, 1);
const Color white=Color.fromRGBO(255, 255, 255, 1);

const Color kPrimaryColor = Colors.white;
const Color kDimWhiteColor = Color(0xfff6f6f6);
const Color cameraBottomColor=Color.fromARGB(255, 216, 216, 216);
const Color kLoginBorderColor =
Color.fromARGB(255, 242, 242, 242);
const Color kQuoteBgColor =
Color.fromARGB(255, 248, 248, 248);
const Color kCardWhiteColor = Color(0xffffffff);
const Color kBackGroundWhiteColor =
Color.fromARGB(255, 246, 246, 246);
const Color kSecondaryColor = Colors.black;
const Color kLanguageSelectBoxColor =
Color.fromARGB(255, 246, 246, 246);
const Color kBtnColor = Color.fromARGB(255, 94, 224, 170);
const Color kIconColor = Color.fromARGB(255, 226, 226, 226);
const Color k10Color = Color.fromARGB(255, 226, 226, 226);
const Color kChatInputFieldColor =
Color.fromARGB(255, 245, 245, 245);
const Color kExitGroupTextColor=Color.fromARGB(255, 255, 48, 48);
const Color kBadgeColor = Color.fromRGBO(255, 66, 57, 1);
const Color kSearchIconColor = Color.fromRGBO( 172, 172, 172,1);
const Color kChatTextNameColor =
Color.fromRGBO(102, 102, 102, 1);
const Color kLoginBgColor =
Color.fromARGB(255, 236, 236, 236);
const Color kSearchBgColor =
Color.fromARGB(255, 237, 237, 237);
const Color kSearchNoResultBtnColor =
Color.fromARGB(255, 255, 136, 0);
const Color kTextGreyColor =
Color.fromARGB(255, 150, 150, 150);
const Color kTransferTextGreyColor =
Color.fromARGB(255, 153, 153, 153);
const Color kCancelGreyColor =
Color.fromARGB(255, 204, 204, 204);
const Color kTextColor = Colors.black;
const Color kHomeCurrencyTextColor =
Color.fromARGB(255, 136, 136, 136);
const Color kHintTextColor =
Color.fromARGB(255, 190, 190, 190);
const Color kGestureLockDialogColor = Color(0xff666666);
const Color kGestureSetDialogColor = Color(0xff313131);
const Color kGestureLockDialogHintColor = Color(0xffbebebe);

const int kBoldBlack = 0xff000000;
const int kGestureLockConfirmButtonColor = 0xff999999;
const int kGestureLockContentTextColor = 0xff666666;
const int kCardWhiteColorNumber = 0xffffffff;
const int kMinePageCurrencyNameColor = 0xff888888;
const int kAssetDetailColor = 0xff3d3d3d;
const Color kToolTipColor=Color.fromARGB(255, 76, 76, 76);

///Primary Gradient
LinearGradient kPrimaryLn = const LinearGradient(
    begin: Alignment(1, 0.49999999999999994),
    end: Alignment(0, 0.5000000000000001),
    colors: [Color(0xffC8F086), Color(0xffa1f99e)]);
LinearGradient kSearchNoResultLn = const LinearGradient(
    begin: Alignment(1, 0.49999999999999994),
    end: Alignment(0, 0.5000000000000001),
    colors: [
      Color.fromARGB(255, 255, 136, 0),
      Color.fromARGB(255, 255, 136, 0)
    ]);

///Secondary Gradient
LinearGradient kSecondaryLn = LinearGradient(
  begin: const Alignment(1, 0.49999999999999994),
  end: const Alignment(0, 0.5000000000000001),
  colors: [
    const Color(0xffC8F086).withOpacity(0.5),
    const Color(0xffa1f99e).withOpacity(0.5)
  ],
);
LinearGradient kChatSecondLn = const LinearGradient(
    begin: Alignment(1, 0.49999999999999994),
    end: Alignment(0, 0.5000000000000001),
    colors: [Color(0xffffffff), Color(0xffffffff)]);

LinearGradient switchLn = const LinearGradient(
    begin: Alignment(1, 0.49999999999999994),
    end: Alignment(0, 0.5000000000000001),
    colors: [ Color(0xffa1f99e),Color(0xffC8F086),]);

///Back Button color
const Color kBackBtnColor =
Color.fromARGB(255, 239, 239, 239);

/// Setting Page Color Constants
const Color kCancelButtonColor = Color(0xfff5f5f5);
const Color kNameBottomModalColor = Color(0xfff8f8f8);
const Color kTextFieldLengthCounterColor =
Color(0xffaaaaaa);
const Color kDividerColor = Color(0xffe5e5e5);

///Gesture Lock Setting Screen
const Color kToggleTrackColor = Color(0xffcccccc);

///Set New Withdrawal Password Screen
const Color kHintTextColorCode = Color(0xffaeaeae);

///Transfer Friend Screen
const Color kPrefixIconColor = Color(0xffacacac);

///Payment management screen
const Color kPaymentBottomModalColor = Color(0xfff9fcf9);

///  Notification Badge Color
const Color kNotificationBadgeColor = Color(0xfffb8f8f);
BoxShadow dimGreyBoxShadow = BoxShadow(
  color: Colors.grey.withOpacity(0.5),
  spreadRadius: 3,
  blurRadius: 5,
  offset: const Offset(0, 3), // changes position of shadow
);
