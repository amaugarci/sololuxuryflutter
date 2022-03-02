import 'package:flutter/material.dart';
import 'package:solo_luxury/app/utils/colors.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColorAccent,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60),
              const Text(
                'About Us',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  decorationColor: appColor,
                  decorationThickness: 1.5,
                  color: appColor,
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
              const SizedBox(height: 40),
              Text(
                'SOLO IS A TOP ONLINE LUXURYFASHION DESTINATION WITH 5 MILLION VISITORS PER MONTHAND WORLDWIDE SHIPPING.',
                textAlign: TextAlign.left,
                style: textStyleUtils(),
              ),
              const SizedBox(height: 20),
              Text(
                'The website features the best selection of thetop established designers as wellas young emerging talents. Solo was founded in Florence in the early 1930s, with the opening of the company’s eponymous concept store on Via Roma.Online since 1999, the company attributes 90% of total revenue to online sales. To this day it remains a 100% privately owned family business, with the founder’s grandson, Andrea Panconesi acting as CEO and his daughter, Annagreta Panconesi as Creative Director.',
                textAlign: TextAlign.left,
                style: textStyleUtils(),
              ),
              const SizedBox(height: 20),
              Text(
                'The site offers a wide selection of clothing, shoes, bags, accessories, luxuryhome interiors and beauty, with products available for men, women and kids from the most prestigious designers such as Balenciaga, Vetements, Off-White,J.W. Anderson, Balmain, Dolce & Gabbana, Gucci, Saint Laurent, Valentino, Givenchy, Loewe, Jacquemus and more.',
                textAlign: TextAlign.left,
                style: textStyleUtils(),
              ),
              const SizedBox(height: 20),
              Text(
                'There are currently 200 people from 15 different countries that work to produce and maintain Solo. The site is available in 9 languages: English, Italian, German, Chinese, Russian, Spanish, French,Korean and Japanese. The site is created entirely in-house, with the Florence office housing graphic design, IT,customer service, marketing and buying departments. The stylists and press teams operate from the Solo office in the fashion capital of the world – Milan.',
                textAlign: TextAlign.left,
                style: textStyleUtils(),
              ),
              const SizedBox(height: 20),
              Text(
                'All orders are shipped worldwide from the Solo headquarters in boxes that are prepared with maximum care and use the finest materials, from the signature shoe bags to the personalized ribbon.',
                textAlign: TextAlign.left,
                style: textStyleUtils(),
              ),
              const SizedBox(height: 20),
              Text(
                'Solo had 1.5 million unique visitors access the site in 2008 and has grown to 53 million unique visitors in 2017. More than 15% of online sales are generated from the United States, followed by Germany, UK, Italy, China and France.',
                textAlign: TextAlign.left,
                style: textStyleUtils(),
              ),
              const SizedBox(height: 20),
              Text(
                'Solo pushes the boundaries of the luxury retail landscape both on and offline with an array of exclusive services and trademark initiatives including Buy It First, Luxury Club, Sneakers Club, LVR Privilege and LVR Editions.',
                textAlign: TextAlign.left,
                style: textStyleUtils(),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  textStyleUtils() {
    return const TextStyle(
      color: grey636363,
      fontFamily: "Open Sans",
      fontWeight: FontWeight.w400,
      height: 1.4,
    );
  }
}
