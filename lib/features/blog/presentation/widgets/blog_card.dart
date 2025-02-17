import 'package:car_rental/core/utils/calculate_reading_time.dart';
import 'package:car_rental/features/blog/domain/entities/blog.dart';
import 'package:car_rental/features/blog/presentation/pages/blog_viewer_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget{
  final Blog blog;
  final Color color;
  const BlogCard({
    super.key,
    required this.blog,
    required this.color
  });
  @override 
  Widget build(BuildContext context){
    print('object');
    return GestureDetector(
      onTap:(){
        Navigator.push(context,BlogViewerPage.route(blog));
      },
      child: Container(
        height: 200,
        margin: const EdgeInsets.all(16),
        padding:const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color:color,
          borderRadius:BorderRadius.circular(10),
        ),
        
        child:Column(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SingleChildScrollView(
                              scrollDirection:Axis.horizontal,
                              child:Row(
                                children:[
                                 'Technology',
                                 'Business',
                                 'Programming',
                                 'Entertainment', 
                                ].map((e)=> Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Chip(label: Text(e),                          
                                  ),
                                )).toList(),
                              ),
                            ),
                            Text(blog.title,
            style: const TextStyle(
              fontSize:22,
              fontWeight:FontWeight.bold,
            )
            ), 
               ],
             ), 
             Text('${calculateReadingTime(blog.content)} min'),
          ],
        ),
      ),
    );
  }
}