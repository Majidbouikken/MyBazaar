import 'package:flutter/material.dart';
import 'package:my_bazaar/models/product.dart';
import '../../main.dart';
import '../theme.dart';
import 'DashedDivider.dart';
import 'ProductCard.dart';

class Deals extends StatefulWidget {
  @override
  _DealsState createState() => _DealsState();
}

class _DealsState extends State<Deals> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      width: MediaQuery.of(context).size.width - 16,
      height: (MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top) - 180,
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  "Today's deals",
                  style: Theme.of(context).textTheme.headline2,
                ),
                Spacer(),
                Text(
                  "See all",
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: Color(0xFFAFB4BA)),
                )
              ],
            ),
          ),
          SizedBox(
            height: 192.0,
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(top: 8, bottom: 16),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: Product.products.length + 1,
                itemBuilder: (BuildContext context, int i) {
                  switch (i) {
                    case 0:
                      return SizedBox(
                        width: 28,
                      );
                    default:
                      return ProductCard(
                        product: Product.products[i - 1],
                      );
                  }
                }),
          ),
          DashedDivider(),
          Padding(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Row(
              children: [
                Text(
                  "All products",
                  style: Theme.of(context).textTheme.headline2,
                ),
                Spacer(),
                Text(
                  "See all",
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: Color(0xFFAFB4BA)),
                )
              ],
            ),
          ),
          Container(
            child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 12 / 17,
              padding:
              EdgeInsets.only(left: 12, top: 4, bottom: 16, right: 4),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(Product.products.length, (i) {
                return ProductCard(
                  product: Product.products[i],
                  small: true,
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
