import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hexcolor/hexcolor.dart';
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
                      childAspectRatio: 1 / 1.5,
                      mainAxisSpacing: 12.0,
                      crossAxisSpacing: 10.0,
                      children:
                          List.generate(10, (index) => buildItemGrid(context)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget buildItemGrid(context) => InkWell(
      onTap: () {
        navigateTo(context: context, widget: ProductDetails());
      },
      child: Card(
        color: Colors.white,
        elevation: 3.0,
        child: Container(
          height: 230.0,
          width: 150.0,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: NetworkImage(
                      'https://hips.hearstapps.com/hmg-prod/images/spring-flowers-65de4a13478ee.jpg?crop=0.668xw:1.00xh;0.287xw,0&resize=640:*'),
                  height: 120.0,
                  width: 120.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'chair',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: HexColor('#404040'),
                  ),
                ),
                Text(
                  '\$120',
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
      ),
    );
