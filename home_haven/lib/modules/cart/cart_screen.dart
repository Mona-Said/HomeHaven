import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:home_haven/shared/components/components.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.directional(
        start: 20.0,
        end: 20.0,
      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => buildItemList(),
              separatorBuilder: (context, index) => SizedBox(
                height: 10.0,
              ),
              itemCount: 3,
            ),
            SizedBox(
              height: 20.0,
            ),
            defaultButton(text: 'Checkout', onPressed: () {}),
            SizedBox(
              height: 13.0,
            ),
            cancelButton(text: 'Cancel', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

Widget buildItemList() => Card(
      elevation: 5.0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image(
                image: NetworkImage(
                    'https://hips.hearstapps.com/hmg-prod/images/spring-flowers-65de4a13478ee.jpg?crop=0.668xw:1.00xh;0.287xw,0&resize=640:*'),
                height: 100.0,
                width: 100.0,
              ),
            ),
            SizedBox(
              width: 15.0,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'chair',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: HexColor('#404040'),
                    ),
                  ),
                  SizedBox(
                    height: 1.5,
                  ),
                  Text(
                    '\$100',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: HexColor('#404040'),
                    ),
                  ),
                  SizedBox(
                    height: 1.5,
                  ),
                  Text(
                    'Grey',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: HexColor('#0A0A0A'),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 0.3, color: Colors.grey),
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.remove,
                                  size: 25.0,
                                  color: HexColor('#156651'),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Text(
                              '1',
                              style: TextStyle(
                                fontSize: 17.5,
                                fontWeight: FontWeight.bold,
                                color: HexColor('#404040'),
                              ),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.add,
                                  size: 25.0,
                                  color: HexColor('#156651'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
