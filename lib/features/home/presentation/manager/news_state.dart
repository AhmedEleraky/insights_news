import 'package:insights_news/features/home/model/new_model/new_model.dart';

class NewsState {}

class NewsByCategoryInitialState extends NewsState {}

class NewsByCategoryLoadingState extends NewsState {}

class NewsByCategorySuccessState extends NewsState {
  final NewModel model;
  NewsByCategorySuccessState(this.model);
}

class NewsByCategoryErrorState extends NewsState {
  final String error;
  NewsByCategoryErrorState(this.error);
}

class NewsBySearchLoadingState extends NewsState {}

class NewsBySearchSuccessState extends NewsState {
  final NewModel model;
  NewsBySearchSuccessState(this.model);
}

class NewsBySearchErrorState extends NewsState {
  final String error;
  NewsBySearchErrorState(this.error);
}

class NewsBySourceLoadingState extends NewsState {}

class NewsBySourceSuccessState extends NewsState {
  final NewModel model;

  NewsBySourceSuccessState(this.model);
}

class NewsBySourceErrorState extends NewsState {
  final String error;
  NewsBySourceErrorState(this.error);
}
