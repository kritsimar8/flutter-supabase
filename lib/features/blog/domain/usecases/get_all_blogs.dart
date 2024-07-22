


import 'package:car_rental/core/error/failures.dart';
import 'package:car_rental/core/usecase/usecase.dart';
import 'package:car_rental/features/blog/domain/entities/blog.dart';
import 'package:car_rental/features/blog/domain/repositories/blog_repository.dart';
import 'package:fpdart/src/either.dart';

class GetAllBlogs implements UseCase<List<Blog>, NoParams>{
  final BlogRepository blogRepository;
  GetAllBlogs(this.blogRepository);

  @override
  Future<Either<Failure, List<Blog>>> call(NoParams params) async{
   return await blogRepository.getAllBlogs();
  }
}