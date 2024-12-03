import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:statedemo/gen/assets.gen.dart';
import 'package:statedemo/presentation/routes/app_router.dart';
import 'package:statedemo/presentation/theme/theme_extension.dart';

@RoutePage()
class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  children: [
                    Assets.svgs.foodPlate.svg(),
                    const Gap(20),
                    Text(
                      'Meal Tracker',
                      style: Theme.of(context)
                          .textTheme
                          .h6Medium
                          .apply(color: Colors.black),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  'Nutrition Consumption Tracker',
                  style: Theme.of(context).textTheme.regularMedium,
                ),
              ),
              const Gap(30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFFAFAFA),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 20,
                        spreadRadius: 0,
                        color: Color.fromRGBO(4, 4, 4, 0.1),
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              top: 10,
                              bottom: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Add your meal',
                                  style: Theme.of(context)
                                      .textTheme
                                      .largeTextMedium,
                                ),
                                Text(
                                  'details',
                                  style: Theme.of(context)
                                      .textTheme
                                      .largeTextMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Gap(20),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFF1EFFD7),
                                  Color(0xFF008080),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                context.router.push(const CameraRoute());
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                              ),
                              child: Text(
                                'Add Now ►',
                                style: Theme.of(context)
                                    .textTheme
                                    .regularSmallBold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Gap(30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFFAFAFA),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 20,
                        spreadRadius: 0,
                        color: Color.fromRGBO(4, 4, 4, 0.1),
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              top: 10,
                              bottom: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Track Your',
                                  style: Theme.of(context)
                                      .textTheme
                                      .largeTextMedium,
                                ),
                                Text(
                                  'Progress',
                                  style: Theme.of(context)
                                      .textTheme
                                      .largeTextMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Gap(20),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFF1EFFD7),
                                  Color(0xFF008080),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                context.router.push(const ShowFoodRoute());
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                              ),
                              child: Text(
                                'View Now ►',
                                style: Theme.of(context)
                                    .textTheme
                                    .regularSmallBold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Gap(30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFFAFAFA),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 20,
                        spreadRadius: 0,
                        color: Color.fromRGBO(4, 4, 4, 0.1),
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              top: 10,
                              bottom: 10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'View Your',
                                  style: Theme.of(context)
                                      .textTheme
                                      .largeTextMedium,
                                ),
                                Text(
                                  'Food Nutrition',
                                  style: Theme.of(context)
                                      .textTheme
                                      .largeTextMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Gap(20),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xFF1EFFD7),
                                  Color(0xFF008080),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                context.router.push(const NutritionRoute());
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                              ),
                              child: Text(
                                'View Now ►',
                                style: Theme.of(context)
                                    .textTheme
                                    .regularSmallBold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Container(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20),
              //       color: const Color(0xFFFAFAFA),
              //       boxShadow: const [
              //         BoxShadow(
              //           blurRadius: 20,
              //           spreadRadius: 0,
              //           color: Color.fromRGBO(4, 4, 4, 0.1),
              //           offset: Offset(0, 2),
              //         ),
              //       ],
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsets.all(10),
              //       child: Row(
              //         children: [
              //           Expanded(
              //             child: Padding(
              //               padding: const EdgeInsets.only(
              //                 left: 20,
              //                 top: 10,
              //                 bottom: 10,
              //               ),
              //               child: Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     'Manage Your',
              //                     style: Theme.of(context)
              //                         .textTheme
              //                         .largeTextMedium,
              //                   ),
              //                   Text(
              //                     'Medication',
              //                     style: Theme.of(context)
              //                         .textTheme
              //                         .largeTextMedium,
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ),
              //           const Gap(20),
              //           Expanded(
              //             child: Container(
              //               decoration: BoxDecoration(
              //                 gradient: const LinearGradient(
              //                   begin: Alignment.topCenter,
              //                   end: Alignment.bottomCenter,
              //                   colors: [
              //                     Color(0xFF1EFFD7),
              //                     Color(0xFF008080),
              //                   ],
              //                 ),
              //                 borderRadius: BorderRadius.circular(10),
              //               ),
              //               child: ElevatedButton(
              //                 onPressed: () {},
              //                 style: ElevatedButton.styleFrom(
              //                   backgroundColor: Colors.transparent,
              //                   shadowColor: Colors.transparent,
              //                 ),
              //                 child: Text(
              //                   'Manage Now ►',
              //                   style: Theme.of(context)
              //                       .textTheme
              //                       .regularSmallBold,
              //                 ),
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
