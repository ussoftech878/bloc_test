import 'package:bloc_test/bloc/posts_bloc/posts_bloc.dart';
import 'package:bloc_test/bloc/posts_bloc/posts_event.dart';
import 'package:bloc_test/bloc/posts_bloc/posts_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child:  BlocBuilder<PostsBloc, PostsState>(
          builder: (context,state) {
            if (state is PostsLoadingState) {
              return CircularProgressIndicator();
            }
            if (state is PostLoaded) {
             
            return  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                
                Text(state.post.title.toString()),
                SizedBox(height: 10,),
                Text(state.post.body.toString()),
               
              ],
            ); 
          }
          return ElevatedButton(onPressed: (){
                  context.read<PostsBloc>().add(FetchPostsEvent());
                }, child: Text("fetch data"));
          }
        ),
      ),
    );
  }
}