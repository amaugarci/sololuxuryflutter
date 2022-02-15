import 'package:flutter/material.dart';
import 'package:solo_luxury/app/utils/colors.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backGroundColor,
        elevation: 0,
        iconTheme: IconThemeData(color: appColor),
      ),
      backgroundColor: backGroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'About Us',
                style: TextStyle(
                  color: appColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                'SOLO IS A TOP ONLINE LUXURY FASHION DESTINATION WITH 5 MILLION VISITORS PER MONTH AND WORLDWIDE SHIPPING. The website features the best selection of the top established designers as well s young emerging talents. Solo was founded in Florence in the early 1930s, with the opening of the company’s eponymous concept store on Via Roma. Online since 1999, the company attributes 90% of total revenue to online sales. To this day t remains a 100% privately owned family business, with the founder’s grandson, Andrea Panconesi acting as CEO and his daughter, Annagreta Panconesi as Creative Director.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black54,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'The site offers a wide selection of clothing, shoes, bags, accessories, luxury home interiors and beauty, with products available for men, women and kids from the most prestigious designers such as Balenciaga, Vetements, Off-White, J.W. Anderson, Balmain, Dolce & Gabbana, Gucci, Saint Laurent, Valentino, Givenchy, Loewe, Jacquemus and more.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 13.5,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'The site offers a wide selection of clothing, shoes, bags, accessories, luxury home interiors and beauty, with products available for men, women and kids from the most prestigious designers such as Balenciaga, Vetements, Off-White, J.W. Anderson, Balmain, Dolce & Gabbana, Gucci, Saint Laurent, Valentino, Givenchy, Loewe, Jacquemus and more.',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 13.5,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
