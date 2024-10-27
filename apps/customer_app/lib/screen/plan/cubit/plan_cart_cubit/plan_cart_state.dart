part of 'plan_cart_cubit.dart';

@immutable
sealed class PlanCartState {}

final class PlanCartInitial extends PlanCartState {}

final class QueChnageState extends PlanCartState {}

final class DateChnageState extends PlanCartState {}

final class ErorrState extends PlanCartState {
  final String msg;

  ErorrState({required this.msg});
}