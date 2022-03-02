import 'package:flutter/material.dart';
import 'package:solo_luxury/app/utils/colors.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: backGroundColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'My Orders',
                style: TextStyle(
                  color: appColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 20),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => myOrderWidget(),
                separatorBuilder: (context, index) => Divider(
                  color: appColor,
                  thickness: 1.5,
                ),
                itemCount: 4,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget myOrderWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Order Number:',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              Text(
                '149052',
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Date:',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              Text(
                '8/29.21',
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Ship To:',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              Text(
                'ship test aska p',
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Order Total:',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              Text(
                '@280.00',
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Status:',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              ),
              Text(
                'pending',
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'VIEW',
                  style:
                      TextStyle(fontWeight: FontWeight.w600, color: appColor),
                ),
              ),
              Container(
                height: 12.5,
                width: 1.8,
                color: appColor,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'RETURN',
                  style:
                      TextStyle(fontWeight: FontWeight.w600, color: appColor),
                ),
              ),
              Container(
                height: 12.5,
                width: 1.8,
                color: appColor,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'CANCEL',
                  style:
                      TextStyle(fontWeight: FontWeight.w600, color: appColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
