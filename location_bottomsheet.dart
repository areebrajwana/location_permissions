// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:deliver_client/utils/colors.dart';
import 'package:deliver_client/widgets/buttons.dart';
import 'package:deliver_client/screens/first_time_location_and_address/first_save_location_screen.dart';

Future<dynamic> locationSheet(BuildContext context) {
  var size = MediaQuery.of(context).size;
  return showModalBottomSheet(
    context: context,
    backgroundColor: whiteColor,
    barrierColor: sheetBarrierColor,
    isDismissible: false,
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () {
          return Future.value(false);
        },
        child: SizedBox(
          width: size.width,
          height: size.height * 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/allow-location-icon.svg'),
              SizedBox(height: size.height * 0.04),
              Text(
                'Allow your location',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: blackColor,
                  fontSize: 22,
                  fontFamily: 'Syne-Bold',
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                'You will need your location to give you\nbetter experience',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: blackColor,
                  fontSize: 16,
                  fontFamily: 'Syne-Regular',
                ),
              ),
              SizedBox(height: size.height * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FirstSaveLocationScreen(),
                        ),
                      );
                    },
                    child:
                        bottomSheetButtonTransparentSmall("NOT NOW", context),
                  ),
                  SizedBox(width: size.width * 0.03),
                  GestureDetector(
                    onTap: () async {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FirstSaveLocationScreen(),
                        ),
                      );
                    },
                    child: bottomSheetButtonGradientSmall("SURE", context),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
