


import 'package:car_rental/core/theme/app_pallete.dart';
import 'package:car_rental/core/utils/calculate_reading_time.dart';
import 'package:car_rental/core/utils/format_date.dart';
import 'package:car_rental/features/blog/domain/entities/blog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlogViewerPage extends StatelessWidget{
  static route(Blog blog)=> MaterialPageRoute(
    builder: (context)=>  BlogViewerPage(
      blog:blog,
    ),
    );
    final Blog blog;
     const BlogViewerPage({super.key,required this.blog});

    @override 
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(),
        body:Scrollbar(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children:[
                  Text(
                    blog.title,
                    style:const TextStyle(
                      fontWeight: FontWeight.bold,
                    )
                  ),
                  const SizedBox(height:20),
                  Text(
                    'By ${blog.posterName}',
                    style:const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize:16,
                    )
                  ),
                  const SizedBox(height:5),
                  Text(
                    '${formatDateBydMMMYYYY(blog.updatedAt)} . ${calculateReadingTime(blog.content)}',
                    style: const TextStyle(
                      fontWeight:FontWeight.w500,
                      color:AppPallete.greyColor,
                      fontSize:16,
                    )
                  ),
                  const SizedBox(height:20),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(blog.imageUrl),
                  ),
                  const SizedBox(height:20),
                  Text(blog.content)
                ]
              )
              ,),
          ),
        )
      );
    }
}