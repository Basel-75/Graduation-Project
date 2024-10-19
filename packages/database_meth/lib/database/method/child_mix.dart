import 'dart:developer';

import 'package:database_meth/database/super_main.dart';

mixin ChildMix {
  addChild(
    {
      required String name,
      required String userId,
      required List<String> allergy,
      required String clas ,
      required  String imgPath,
      required String schoolId,
      required double funds


    }
  ) async {
    try {
      SuperMain().supabase.from("followers").insert({

        "name" : name,
        "user_id": userId ,
        "funds": funds,
        "allergy" : allergy,
        "class"  : clas,
        "img_path" : imgPath,
        "school_id" :schoolId,

      });
    } catch (er) {
      log("$er");
    }
  }
}