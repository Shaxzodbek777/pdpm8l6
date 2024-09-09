import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdpm8l6/bloc/update_post_state.dart';

import '../model/post_model.dart';
import '../service/https_serivse.dart';

class UpdatePostCubit extends Cubit<UpdatePostState> {
  UpdatePostCubit() : super(UpdatePostInit());

  void apiPostUpdate(Post post) async {
    emit(UpdatePostLoading());
    final response = await Network.PUT(
        Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post));
    if (response != null) {
      emit(UpdatePostLoaded(isUpdated: true));
    } else {
      emit(UpdatePostError(error: "error"));
    }
  }
}