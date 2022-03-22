import 'package:flutter/material.dart';
import 'package:solo_luxury/data/model/Wishlist/wishlist_model.dart';
import '../../../../utils/app_constants.dart';
import '../../../utils/colors.dart';

class WishlistItem extends StatelessWidget {
  Item? item;

  WishlistItem({required this.item});

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
                  "${AppConstants.productImageUrl}${item!.product!.getProductImage()}",
                  // height: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("${item!.product!.name}", style: TextStyle(fontSize: 20)),
                    SizedBox(
                      height: 5,
                    ),
                    Text("${item!.product!.name}", style: TextStyle(fontSize: 14)),
                    SizedBox(
                      height: 10,
                    ),
                    Text('\$ ' + "${item!.product!.price}",
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
