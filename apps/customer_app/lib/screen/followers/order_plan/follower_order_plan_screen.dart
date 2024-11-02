import 'dart:developer';

import 'package:customer_app/screen/followers/order_plan/cubit/follower_order_plan_cubit.dart';


import 'package:customer_app/widget/history_widget/histoy_body_order_widget.dart';
import 'package:customer_app/widget/history_widget/histoy_body_plan_widgetd.dart';
import 'package:flutter/material.dart';
import 'package:get_all_pkg/data/model/child_model.dart';
import 'package:get_all_pkg/get_all_pkg.dart';

class FollowerOrderPlanScreen extends StatelessWidget {
  const FollowerOrderPlanScreen({super.key, required this.childModel});

  final ChildModel childModel;

  
  @override
  Widget build(BuildContext context) {
    //replace it with Bloc

    //replace it with Bloc order.length

    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (context) => FollowerOrderPlanCubit()..historyBring()..childModel = childModel,
        child: Builder(builder: (context) {
          final cubit = context.read<FollowerOrderPlanCubit>();

          return BlocListener<FollowerOrderPlanCubit, FollowerOrderPlanState>(
            listener: (context, state) {
              if (state is ErorrState) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    state.msg,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: Colors.red,
                ));
              }

              if (state is LodingState) {
                log("in lodaing");
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );
              }

              if (state is DoneState) {
                Navigator.pop(context);
                log("very good history");
              }
            },
            child: Scaffold(
                appBar: AppBar(
                  title: Text(
                    'سجل الطلبات',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
                  ),
                  centerTitle: true,
                  actions: [
                    Image.asset('assets/image/homeicon.png'),
                    SizedBox(
                      width: 2.h,
                    )
                  ],
                  flexibleSpace: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xffFEFEFD), Color(0xffE0D1BB)],
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40),
                        )),
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 3.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CustomRadioButton(
                              buttonTextStyle: const ButtonTextStyle(
                                  selectedColor: Colors.white,
                                  unSelectedColor: Colors.black,
                                  textStyle: TextStyle(fontSize: 16)),
                              enableShape: true,
                              elevation: 0,
                              customShape: ContinuousRectangleBorder(

                                  borderRadius: BorderRadius.circular(25)),
                              buttonLables: ["plan", "order"],
                              buttonValues: ["plan", "order"],
                              unSelectedColor: const Color(0xffe5dfcf),
                              selectedColor: Colors.blueAccent,
                              defaultSelected: "order",
                              radioButtonValue: (p0) {
                                log(p0);
                                cubit.tabClick(tabName: p0);
                              },
                            )
                          ],
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 2.w, vertical: 2.h),
                          child: BlocBuilder<FollowerOrderPlanCubit, FollowerOrderPlanState>(
                            builder: (context, state) {
                              return cubit.isOrder == true
                                  ? HistoyBodyOrderWidget(
                                    childModel: cubit.childModel,
                                      lisOrder: cubit.lisOrder)
                                  : HistoyBodyPlanWidgetd(
                                    childModel: cubit.childModel,
                                      planLis: cubit.planLis);
                            },
                          )),
                    ],
                  ),
                )
                // : Center(
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: [
                //         Image.asset('assets/image/history_img.png'),
                //         SizedBox(
                //           height: 2.h,
                //         ),
                //         const Text(
                //           "ليس لديك طلبات :(",
                //           style: TextStyle(
                //               fontSize: 18,
                //               fontWeight: FontWeight.bold,
                //               fontFamily: 'Rosarivo',
                //               color: Colors.black),
                //         ),
                //         CustomButton(onPressed: () {}, title: 'اطلب الأن'),
                //         SizedBox(
                //           height: 15.h,
                //         )
                //       ],
                //     ),
                //   ),
                ),
          );
        }),
      ),
    );
  }
}