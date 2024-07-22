import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:car_rental/core/usecase/usecase.dart';
import 'package:car_rental/features/blog/domain/entities/blog.dart';
import 'package:car_rental/features/blog/domain/usecases/get_all_blogs.dart';
import 'package:car_rental/features/blog/domain/usecases/upload_blog.dart';
import 'package:meta/meta.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final UploadBlog _uploadBlog;
  final GetAllBlogs _getAllBlogs;
  BlogBloc({
    required UploadBlog uploadBlog,
    required GetAllBlogs getAllBlogs,
  }) : 
    _uploadBlog=uploadBlog,
    _getAllBlogs = getAllBlogs
  
    ,super(BlogInitial()) {
    on<BlogEvent>((event, emit) => emit(BlogLoading()));
    on<BlogUpload>(_onBlogUpload);
    on<BlogFetchAllBlogs> (_onFetchAllBlogs);
  }
  void _onBlogUpload(
    BlogUpload event,
    Emitter<BlogState> emit,
  )async {
   final res= await  _uploadBlog(UploadBlogParams(posterId: event.posterId, title: event.title, content: event.content, image: event.image, topics: event.topics));
   
   res.fold((l)=> emit(BlogFailure(l.message)),
   (r)=> emit(BlogUploadSuccess()),
   );
  }
   void _onFetchAllBlogs(
    BlogFetchAllBlogs event,
    Emitter<BlogState> emit,
   ) async {
    final res = await _getAllBlogs(NoParams());
    res.fold((l) => emit(BlogFailure(l.message)),
    (r)=> emit(BlogDisplaySuccess(r))
    );
   }
}
