import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:customer_app/screen/product/cubit/product_cubit.dart';
import 'package:database_meth/database/super_main.dart';
import 'package:flutter/material.dart';
import 'package:get_all_pkg/data/model/app_model.dart';
import 'package:get_all_pkg/data/model/child_model.dart';
import 'package:get_all_pkg/data/model/meal_plan_item_model.dart';
import 'package:get_all_pkg/data/model/plan_model.dart';
import 'package:get_all_pkg/data/setup.dart';
import 'package:get_all_pkg/helper/check_intent.dart';
import 'package:meta/meta.dart';

part 'plan_state.dart';

class PlanCubit extends Cubit<PlanState> {
  PlanCubit() : super(PlanInitial());

  AppModel appModel = getIt.get<AppModel>();

  List<PlanModel> planListUi = [];

  List<MealPlanItemModel> mealPlanItemLisUi = [];

  TextEditingController planNameCOn = TextEditingController();

  ChildModel? childModelSelcted;

  late PlanModel planModelSelcted;

  clickInChild({required ChildModel childModel}) {
    mealPlanItemLisUi.clear();
    planListUi = childModel.planList;

    childModelSelcted = childModel;

    emit(ChildClickState());
  }

  clickPlanState({required PlanModel planModel}) {
    mealPlanItemLisUi.clear();
    log("${planModel.name}");
    log("${mealPlanItemLisUi.length}");

    planModelSelcted = planModel;
    mealPlanItemLisUi.addAll(planModel.mealPlanItemLis);

    log("after");
    log("${mealPlanItemLisUi.length}");

    emit(PlanClickState());
  }

  delPlanItem({required MealPlanItemModel mealPlanItemModel}) async {
    log("in del method");

    final inter = await CheckIntent().checkInternetConnection();

    if (inter) {
      log("there is inter");
      SuperMain().delMealItem(id: mealPlanItemModel.id);

      for (int i = 0; i < mealPlanItemLisUi.length; i++) {
        if (mealPlanItemLisUi[i].id == mealPlanItemModel.id) {
          mealPlanItemLisUi.removeAt(i);
          planModelSelcted.mealPlanItemLis.removeAt(i);
          emit(DelItemState());
          return;
        }
      }
    } else {
      log("there is no  inter");
      emit(NoInterState());
    }
  }

  addPlan() async {
    log("in add plan");

    // check if there is plan with same name

    if (planNameCOn.text.isEmpty) {
      emit(EorrPlanState(msg: "pls add text"));

      return;
    }

    for (var val in planListUi) {
      if (val.name! == planNameCOn.text) {
        emit(EorrPlanState(msg: "there is plan with same name"));
        return;
      }
    }

    try {
      emit(LodingState());
      final res = await SuperMain()
          .addPlan(childId: childModelSelcted!.id, name: planNameCOn.text);

      childModelSelcted!.planList.add(PlanModel.fromJson(res));

      emit(NoLodingState());
      emit(PlanChnageState());

      log("plan has been add");
    } catch (er) {
      emit(NoLodingState());
      emit(EorrPlanState(msg: "there was eorr"));
    }
  }

// check before add plan if there is child or not
  bool isThereChild() {
    if (childModelSelcted == null) {
      emit(EorrPlanState(msg: "chose child first"));
      return false;
    } else {
      return true;
    }
  }
}
