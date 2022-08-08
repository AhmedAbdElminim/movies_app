import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/tvs/presentation/controller/toprated_tv/toprated_tv_state.dart';

import '../../../../core/usecase/base_usecase.dart';
import '../../../domain/entities/tvs.dart';
import '../../../domain/usecases/get_toprated_tv_usecase.dart';

class TopRatedTvCubit extends Cubit<TopRatedTvStates> {
  TopRatedTvCubit(this.getTopRatedTvUseCase) : super(TopRatedTvInitialState());
  static TopRatedTvCubit get(context) => BlocProvider.of(context);
  final GetTopRatedTvUseCase getTopRatedTvUseCase;
  List<Tv> topRatedTvList = [];
  void getTopRatedTvs() async {
    emit(TopRatedTvLoadingState());
    final result = await getTopRatedTvUseCase(const NoParameter());

    result.fold((l) => emit(TopRatedTvErrorState(l.errorMessage)), (r) {
      r.forEach((element) {
        if (element.backdropPath != '') {
          topRatedTvList.add(element);
        }
      });
    });
    emit(TopRatedTvSuccessState());
  }
}
