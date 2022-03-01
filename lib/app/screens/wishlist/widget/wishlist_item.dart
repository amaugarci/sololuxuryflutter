import 'package:flutter/material.dart';
import '../../../../data/model/Product/product_model.dart';
import '../../../utils/colors.dart';

class WishlistItem extends StatelessWidget {
  ProductModel product;

  WishlistItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 150,
        color: backGroundColor,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: 350,
                child: Image.network(
                  'https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg',
                  // height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("MIU MIU", style: TextStyle(fontSize: 20)),
                    SizedBox(
                      height: 5,
                    ),
                    Text("PAINTED MARY JANE", style: TextStyle(fontSize: 14)),
                    SizedBox(
                      height: 10,
                    ),
                    Text("\$ 560.00",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold))
                  ]),
              const SizedBox(height: 10),
              Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Qty ", style: TextStyle(fontSize: 15)),
                  Container(
                      decoration: BoxDecoration(color: Colors.white),
                      width: 50,
                      height: 45,
                      child: Center(
                          child: Text("1",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)))),
                  Container(
                      decoration: BoxDecoration(
                          color: brownColor,
                          borderRadius: BorderRadius.circular(50)),
                      width: 150,
                      height: 50,
                      child: Center(
                          child: Text("ADD TO CART",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold)))),
                  Icon(Icons.edit),
                  Icon(Icons.delete),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
