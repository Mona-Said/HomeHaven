import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
          children: [
            // CarouselSlider(
            //     items: ,
            //     options: CarouselOptions(
            //       height: 200.0,
            //       initialPage: 0,
            //       viewportFraction: 1.0,
            //       reverse: false,
            //       enableInfiniteScroll: true,
            //       autoPlay: true,
            //       enlargeCenterPage: false,
            //       autoPlayCurve: Curves.fastEaseInToSlowEaseOut,
            //       autoPlayInterval: const Duration(seconds: 3),
            //       autoPlayAnimationDuration: const Duration(seconds: 1),
            //       scrollDirection: Axis.horizontal,
            //     )),
          ],
        );
      },
    );
  }
}
