import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_bazaar/models/product.dart';
import 'package:my_bazaar/ui/mybazaar_icons.dart';
import '../theme.dart';

class ProductCard extends StatelessWidget {
  final bool small;
  final Product product;

  const ProductCard({Key key, this.small = false, this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool solded = (product.sold != 0.0 && product.sold != null);
    return Container(
      height: 160,
      width: 136,
      margin: (!small)
          ? const EdgeInsets.symmetric(horizontal: 4.0)
          : const EdgeInsets.all(4.0),
      child: Stack(
        children: <Widget>[
          solded
              ? Positioned(
                  top: 0,
                  right: 0,
                  child: CustomPaint(
                      size: Size(16, 8), painter: DrawTriangleShape()),
                )
              : SizedBox(),
          Container(
            margin: EdgeInsets.only(top: 8, right: 8),
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(16)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20, bottom: 12, right: 8),
            alignment: Alignment.centerLeft,
            child: Image.asset(
              this.product.img,
              width: 128,
              height: 128,
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 8, top: 16, right: 16, bottom: 16),
            child: Text(
              this.product.name,
              style: (!this.small)
                  ? Theme.of(context).textTheme.headline3
                  : Theme.of(context).textTheme.headline3.copyWith(fontSize: 10),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
              margin: EdgeInsets.all(8),
              alignment: Alignment.bottomLeft,
              child: Icon(
                MyBazaarIcons.heart,
                size: (!this.small) ? 20 : 16,
                color: ThemeColors.textColor,
              )),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              alignment: Alignment.bottomRight,
              child: RichText(
                  textAlign: TextAlign.right,
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline4,
                    children: solded
                        ? [
                            TextSpan(
                                text: product.price.toString() + '\n',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3
                                    .copyWith(
                                      decoration: TextDecoration.lineThrough,
                                    )),
                            TextSpan(
                                text: (product.price -
                                        product.price * product.sold)
                                    .toInt()
                                    .toString()),
                            TextSpan(
                                text: ' DZD',
                                style: (!this.small)
                                    ? Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .copyWith(fontSize: 8)
                                    : Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .copyWith(fontSize: 6)),
                          ]
                        : [
                            TextSpan(text: product.price.toString()),
                            TextSpan(
                                text: ' DZD',
                                style: (!this.small)
                                    ? Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .copyWith(fontSize: 8)
                                    : Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .copyWith(fontSize: 6)),
                          ],
                  ))),
          solded
              ? Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      height: 16,
                      decoration: BoxDecoration(
                          color: ThemeColors.red,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(4),
                            topLeft: Radius.circular(4),
                            bottomLeft: Radius.circular(4),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Color(0x28000000),
                                blurRadius: 4,
                                offset: Offset(0, 2))
                          ]),
                      child: Text((product.sold * -100).toString() + '%',
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(fontSize: 12, color: Colors.white))),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

// draw ruban banner method
class DrawTriangleShape extends CustomPainter {
  Paint painter;

  DrawTriangleShape() {
    painter = Paint()
      ..color = Colors.red[800]
      ..style = PaintingStyle.fill;
  }

  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    path.moveTo(0, 16);
    path.lineTo(size.width, 16);
    path.lineTo(size.width / 2, size.height + 16);
    path.lineTo(0, size.height + 16);
    path.close();

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
