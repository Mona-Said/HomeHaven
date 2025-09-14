import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hexcolor/hexcolor.dart';
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
        return Column(
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
                children: [
                  Text(
                    'Special Offers',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: HexColor('#404040'),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
