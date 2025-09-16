import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:home_haven/models/products_model.dart';
import 'package:home_haven/modules/product_details/product_details.dart';
import 'package:home_haven/shared/components/components.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeHavenCubit, HomeHavenStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var cubit = HomeHavenCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.homeModel != null,
          builder: (context) => buildAllScreen(cubit.homeModel, context),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

Widget buildAllScreen(HomeModel? model, context) {
  var cubit = HomeHavenCubit.get(context);
  return SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5.0,
        ),
        CarouselSlider(
            items: cubit.images.map((image) {
              return Builder(builder: (BuildContext context) {
                return Container(
                  padding: EdgeInsetsDirectional.only(
                    start: 5.0,
                    end: 5.0,
                  ),
                  //margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Image.asset(
                    image,
                    //fit: BoxFit.cover,
                  ),
                );
              });
            }).toList(),
            options: CarouselOptions(
              height: 200.0,
              initialPage: 0,
              viewportFraction: 1.0,
              reverse: false,
              enableInfiniteScroll: true,
              autoPlay: true,
              enlargeCenterPage: false,
              autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(seconds: 1),
              scrollDirection: Axis.horizontal,
            )),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Special Offers',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  color: HexColor('#404040'),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              GridView.count(
                crossAxisCount: 2,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                childAspectRatio: 1 / 1.6,
                mainAxisSpacing: 12.0,
                crossAxisSpacing: 10.0,
                children: List.generate(model!.products.length,
                    (index) => buildItemGrid(model.products[index], context)),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildItemGrid(ProductsModel model, BuildContext context) => InkWell(
      onTap: () {
        navigateTo(context: context, widget: ProductDetails());
      },
      child: Card(
        color: Colors.white,
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: NetworkImage('${model.images?.first}'),
                height: 120.0,
                width: 120.0,
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                '${model.title}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.bold,
                  color: HexColor('#404040'),
                ),
              ),
              Text(
                '\$${model.price}',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: HexColor('#404040'),
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                  Text(
                    '4.9 (256)',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: HexColor('#404040'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
