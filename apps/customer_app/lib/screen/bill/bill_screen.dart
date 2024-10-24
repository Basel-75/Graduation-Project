import 'package:customer_app/widget/button/custom_button.dart';
import 'package:customer_app/widget/history_widget/bottom_info.dart';
import 'package:customer_app/widget/history_widget/content_history.dart';
import 'package:flutter/material.dart';
import 'package:get_all_pkg/get_all_pkg.dart';

class BillScreen extends StatelessWidget {
  const BillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //replace it with Bloc
    List<Map<String, dynamic>> products = [
      {
        'image': 'assets/image/egg.png',
        'history': '2024-2-10',
        'name': 'بكس السعادة',
        'numberOfCal': 2,
        'quantity': 5,
        'price': 213
      },
      {
        'image': 'assets/image/egg.png',
        'history': '2024-2-10',
        'name': 'بكس السعادة',
        'numberOfCal': 54,
        'quantity': 3,
        'price': 123
      },
      {
        'image': 'assets/image/egg.png',
        'history': '2024-2-10',
        'name': 'بكس السعادة',
        'numberOfCal': 22,
        'quantity': 1,
        'price': 123
      },
    ];
    //replace it with Bloc order.length
    const int billNum = 0;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'الفواتير',
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
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
        body: billNum != 0
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.h),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: billNum,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 3.h,
                        ),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            //change it

                            '2024-2-10',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Container(
                          width: 94.w,
                          decoration: BoxDecoration(
                              boxShadow: kElevationToShadow[2],
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xffffffff)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.7.h, vertical: 4.w),
                            child: Column(
                              children: [
                                ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: products.length,
                                  itemBuilder: (context, index) {
                                    var product = products[index];
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ContentHistory(
                                          isBill: true,
                                          image: product['image'],
                                          foodName: product['name'],
                                          numberOfCal: product['numberOfCal'],
                                          quantity: product['quantity'],
                                          price: product['price'],
                                        ),
                                        SizedBox(
                                            height: index < products.length - 1
                                                ? 2.h
                                                : 0),
                                      ],
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                const BottomHistoryInfo(
                                  totalPrice: 222,
                                  name: "احد محسن",
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ))
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/image/history_img.png'),
                    SizedBox(
                      height: 2.h,
                    ),
                    const Text(
                      "ليس لديك طلبات لعرض الفواتير :(",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Rosarivo',
                          color: Colors.black),
                    ),
                    CustomButton(onPressed: () {}, title: 'اطلب الأن'),
                    SizedBox(
                      height: 15.h,
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
