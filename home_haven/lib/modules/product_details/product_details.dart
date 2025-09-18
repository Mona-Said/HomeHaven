import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:home_haven/models/products_model.dart';
import 'package:home_haven/shared/components/components.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';

class ProductDetails extends StatelessWidget {
  final ProductsModel model;
  ProductDetails({required this.model});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeHavenCubit, HomeHavenStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(),
          body: buildItem(context, model),
        );
      },
    );
  }
}

Widget buildItem(context, ProductsModel model) => Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(17.0),
          child: Image(
            image: NetworkImage('${model.images?.first}'),
            width: 265.0,
            height: 265.0,
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image(
                image: NetworkImage('${model.images?[1]}'),
                width: 60.0,
                height: 60.0,
              ),
            ),
            SizedBox(
              width: 15.0,
            ),
            if (model.images != null && model.images!.length > 2)
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image(
                  image: NetworkImage('${model.images?[2]}'),
                  width: 60.0,
                  height: 60.0,
                ),
              ),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Flexible(
          child: Card(
            color: Colors.white,
            shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(color: Colors.white),
            ),
            elevation: 0.0,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${model.title}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 23.5,
                        fontWeight: FontWeight.bold,
                        color: HexColor('#404040'),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      '\$${model.price}',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: HexColor('#404040'),
                      ),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 18.0,
                        ),
                        Text(
                          '4.9 (256)',
                          style: TextStyle(
                            fontSize: 12.5,
                            color: HexColor('#404040'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      '${model.description}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15.0,
                        color: HexColor('#0A0A0A'),
                      ),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      width: double.infinity,
                      height: 0.5,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Colors',
                      style: TextStyle(
                        fontSize: 23.0,
                        fontWeight: FontWeight.bold,
                        color: HexColor('#404040'),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Container(
                            height: 55,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              border:
                                  Border.all(color: Colors.grey, width: 0.5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.0),
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    'Blue Grey',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: HexColor('#404040'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16.0,
                        ),
                        Flexible(
                          child: Container(
                            height: 55,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.0),
                              border:
                                  Border.all(color: Colors.grey, width: 0.5),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.0),
                                      color: Colors.grey,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    'Grey',
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: HexColor('#404040'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 28.0,
                    ),
                    defaultButton(text: 'Add to Cart', onPressed: () {}),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
