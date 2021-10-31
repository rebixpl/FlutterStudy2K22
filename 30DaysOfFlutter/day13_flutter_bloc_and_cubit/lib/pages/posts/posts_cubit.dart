// Packages
import 'package:flutter_bloc/flutter_bloc.dart';

// Services
import '../../services/data_service.dart';

// Models
import '../../models/post.dart';

class PostsCubit extends Cubit<List<Post>> {
  final _dataService = DataService();

  PostsCubit() : super([]); // We initialize Cubit in super

  void getPosts() async => emit(await _dataService.getPosts());
}
