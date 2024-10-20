import 'package:customer_app/component/drop_down_item.dart';
import 'package:customer_app/screen/home/home_screen.dart';
import 'package:customer_app/widget/container/profile_small_container.dart';
import 'package:customer_app/widget/dropDownMenu/custom_select.dart';
import 'package:customer_app/widget/row/info_container_row.dart';
import 'package:customer_app/widget/row/user_info_row.dart';
import 'package:flutter/material.dart';
import 'package:get_all_pkg/get_all_pkg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
          children: [
            const ScreenHeader(
                parentName: '', title: 'صفحتي', inHomeScreen: false),
            SizedBox(
              height: 12.h,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 100.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: kElevationToShadow[8],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 55.h,
                  left: 65.w,
                  child: Container(
                    width: 30.w,
                    height: 30.w,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 218, 220, 218),
                        shape: BoxShape.circle,
                        border: Border.all(width: 0.2, color: Colors.grey)),
                    child: const CircleAvatar(
                        backgroundImage: AssetImage(
                      'assets/image/userprofile.png',
                    )),
                  ),
                ),
                //=========Info and edit button==========

                UserInfoRow(
                  name: 'سعد العوفي',
                  schoolName: '',
                  isParent: true,
                  onEdit: () {},
                  onDelete: () {},
                ),

                //=============Row of info plan,orders,funds===============
                Positioned(
                  top: 10.h,
                  left: 3.w,
                  child: const InfoContainerRow(
                    titleOne: 'التابعين',
                    numOne: '6',
                    titleTow: 'الخطط',
                    numTow: '2',
                    titleThree: 'المحفظة',
                    numThree: '200',
                  ),
                ),
                Positioned(
                  top: 25.h,
                  left: 0.2.w,
                  right: 0.2.w,
                  child: Container(
                    width: 100.w,
                    height: 30.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.w),
                    margin: EdgeInsets.symmetric(horizontal: 3.w),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 223, 214, 214),
                        borderRadius: BorderRadius.circular(11),
                        boxShadow: kElevationToShadow[4],
                        border: Border.all(width: 0.2, color: Colors.grey)),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ListTile(
                            title: const Text(
                              'الفواتير',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing:
                                const Icon(Icons.arrow_forward_ios_rounded),
                            onTap: () {},
                          ),
                          const Divider(
                            thickness: 2,
                          ),
                          ListTile(
                            title: const Text(
                              'الشكاوى والأقتراحات',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing:
                                const Icon(Icons.arrow_forward_ios_rounded),
                            onTap: () {},
                          ),
                          const Divider(
                            thickness: 2,
                          ),
                          ListTile(
                            title: const Text(
                              'عن فسحتي',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing:
                                const Icon(Icons.arrow_forward_ios_rounded),
                            onTap: () {},
                          ),
                          const Divider(
                            thickness: 2,
                          ),
                          ListTile(
                            title: const Text(
                              'الأعدادات',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing:
                                const Icon(Icons.arrow_forward_ios_rounded),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
