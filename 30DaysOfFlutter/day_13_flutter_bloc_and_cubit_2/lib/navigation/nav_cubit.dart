// Packages
import 'package:flutter_bloc/flutter_bloc.dart';

// Models
import '../models/post.dart';

class NavCubit extends Cubit<Post?> {
  NavCubit() : super(null);

  void showPostDetails(Post post) => emit(post);

  void popToPosts() => emit(null);
}
