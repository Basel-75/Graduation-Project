part of 'plan_cubit.dart';

@immutable
sealed class PlanState {}

final class PlanInitial extends PlanState {}

final class ChildClickState extends PlanState {}

final class PlanClickState extends PlanState {}

final class DelItemState extends PlanState {}

final class NoInterState extends PlanState {}

final class EorrPlanState extends PlanState {
  final String msg;

  EorrPlanState({required this.msg});
}