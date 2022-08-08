import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/tvs/domain/usecases/get_popular_tv_usecase.dart';
import 'package:movies_app/tvs/presentation/controller/popular_tv/popular_tv_state.dart';

import '../../../../core/usecase/base_usecase.dart';
import '../../../domain/entities/tvs.dart';

class PopularTvCubit extends Cubit<PopularTvStates>{
  PopularTvCubit(this.getPopularTvUseCase):super(PopularTvInitialState());
  static PopularTvCubit get(context)=>BlocProvider.of(context);
  final GetPopularTvUseCase getPopularTvUseCase;
  List<Tv>popularTvList=[];
  void getPopularTvs() async {
    emit(PopularTvLoadingState());
    final result = await getPopularTvUseCase(const NoParameter());

    result.fold((l) => emit(PopularTvErrorState(l.errorMessage)),
            (r) {
          r.forEach((element) {
            if(element.backdropPath!=''){
              popularTvList.add(element);
            }
          });
          //popularTvsList = r;
        });
    emit(PopularTvSuccessState());
  }
}