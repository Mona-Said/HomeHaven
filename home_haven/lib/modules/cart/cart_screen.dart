import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:home_haven/payment_gateway_stripe/payment_manager.dart';
import 'package:home_haven/shared/components/components.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';
import '../../models/products_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeHavenCubit, HomeHavenStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var cubit = HomeHavenCubit.get(context);

        return Padding(
          padding: const EdgeInsetsGeometry.directional(
            start: 20.0,
            end: 20.0,
          ),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: ConditionalBuilder(
              condition: cubit.cartItems.isNotEmpty,
              builder: (context) => Column(
                children: [
                  ListView.separated(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) =>
                        buildItemList(cubit.cartItems[index], context),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10.0,
                    ),
                    itemCount: cubit.cartItems.length,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultButton(
                      text: 'Checkout',
                      onPressed: () {
                        PaymentManager.makePayment(
                            cubit.getTotalPrice(), 'USD');
                      }),
                  SizedBox(
                    height: 10.0,
                  ),
                  cancelButton(
                      text: 'Cancel',
                      onPressed: () {
                        cubit.removeCart();
                      }),
                ],
              ),
              fallback: (context) => Center(
                child: SizedBox(
                  height: 650,
                  child: Icon(
                    Icons.remove_shopping_cart,
                    size: 120.0,
                    color: HexColor('#156651'),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget buildItemList(ProductsModel model, context) => Card(
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
                image: NetworkImage('${model.images?.first}'),
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
                    '${model.title}',
                    style: TextStyle(
                      fontSize: 18.0,
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
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '\$${HomeHavenCubit.get(context).getTotalPrice().toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: HexColor('#404040'),
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
                                onTap: () {
                                  HomeHavenCubit.get(context).minus();
                                },
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
                              '${HomeHavenCubit.get(context).quantity}',
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
                                onTap: () {
                                  HomeHavenCubit.get(context).plus();
                                },
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
