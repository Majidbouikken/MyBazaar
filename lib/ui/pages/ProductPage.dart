import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_bazaar/models/product.dart';
import 'package:my_bazaar/ui/components/DashedDivider.dart';
import 'package:my_bazaar/ui/components/ProductCard.dart';
import 'package:my_bazaar/ui/mybazaar_icons.dart';

import '../theme.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // return button
          Container(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                child: Icon(MyBazaarIcons.arrow_ios_left),
              )),
          Container(
            height: MediaQuery.of(context).size.height - 156,
            child: ListView(physics: BouncingScrollPhysics(), children: [
              // product details
              Container(
                  height: 320,
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Image.asset(
                        "assets/img/product4.png",
                        height: 280,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Orange",
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              // todo: add shop image
                              Text(
                                "Eden shop",
                                style: Theme.of(context).textTheme.headline3,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 128),
                            child: Text(
                              '''The orange is a fruit of various citrus species in the family of Rosascea (see list of plants known as orange.)''',
                              style: Theme.of(context).textTheme.headline4,
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          // Rating
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.star_rate_rounded,
                                size: 20,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                size: 20,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                size: 20,
                              ),
                              Icon(
                                Icons.star_rate_rounded,
                                size: 20,
                              ),
                              Icon(
                                Icons.star_outline_rounded,
                                size: 20,
                              ),
                              Text("4.3",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3
                                      .copyWith(color: Colors.grey))
                            ],
                          ),
                          Spacer(),
                          Text("Kilos",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline3
                                  .copyWith(color: Colors.grey)),
                          Row(
                            children: [
                              Icon(
                                Icons.add_circle_outline_rounded,
                                size: 32,
                              ),
                              Text("1.0",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline3
                                      .copyWith(
                                          color: ThemeColors.primaryColor,
                                          fontWeight: FontWeight.w800)),
                              Icon(
                                Icons.remove_circle_outline_rounded,
                                size: 32,
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                RichText(
                                    textAlign: TextAlign.left,
                                    text: TextSpan(
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                        children: [
                                          TextSpan(
                                              text: 60.toString() + '\n',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2
                                                  .copyWith(
                                                      color: ThemeColors.red,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      fontSize: 20)),
                                          TextSpan(
                                              text: (60 - 60 * 0.33)
                                                  .toInt()
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2
                                                  .copyWith(fontSize: 32)),
                                          TextSpan(
                                              text: ' DZD',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline2
                                                  .copyWith(fontSize: 16)),
                                        ])),
                                Spacer(),
                                Text("728 liked this product",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3
                                        .copyWith(color: Colors.grey)),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(MyBazaarIcons.heart)
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  )),
              DashedDivider(),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Similar products",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    Text(
                      "See all",
                      style: Theme.of(context)
                          .textTheme
                          .headline3
                          .copyWith(color: Colors.grey),
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
            ]),
          ),
        ],
      ),
    );
  }
}
