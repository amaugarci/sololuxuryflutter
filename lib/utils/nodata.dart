import 'package:flutter/material.dart';
import 'package:solo_luxury/app/utils/colors.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class NoData extends StatelessWidget {
  String? noDataText;
  String? lottieJson;
  NoData({
    Key? key,
    this.noDataText,
    this.lottieJson,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/gif/no-data.gif',
          ),
          SizedBox(
            height: 50,
          ),
          noDataText != null
              ? Text(
                  noDataText.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: contentGrey,
                  ),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
