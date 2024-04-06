import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insights_news/core/services/api_services.dart';
import 'package:insights_news/features/home/presentation/manager/news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsByCategoryInitialState());

  getNewByCategory(String category) {
    emit(NewsByCategoryLoadingState());
    try {
      ApiServices.getNewByCategory(category).then((value) {
        emit(NewsByCategorySuccessState(value!));
      });
    } catch (e) {
      emit(NewsByCategoryErrorState(e.toString()));
    }
  }

  getNewBySearch(String query) {
    emit(NewsBySearchLoadingState());
    try {
      ApiServices.getNewBySearch(query).then((value) {
        emit(NewsBySearchSuccessState(value!));
      });
    } catch (e) {
      emit(NewsBySearchErrorState(e.toString()));
    }
  }

  getNewBySource(String source) {
    emit(NewsBySourceLoadingState());
    try {
      ApiServices.getNewBySource(source).then((value) {
        emit(NewsBySourceSuccessState(value!));
      });
    } catch (e) {
      emit(NewsBySourceErrorState(e.toString()));
    }
  }

  getSources() {
    emit(NewsBySourceLoadingState());
    try {
      ApiServices.getSources().then((value) {
        emit(NewsBySourceSuccessState(value!));
      });
    } catch (e) {
      emit(NewsBySourceErrorState(e.toString()));
    }
  }
}
