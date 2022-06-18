import 'package:flutter/material.dart';
import 'package:flutter_api/models/post.dart';
import 'package:flutter_api/services/remote_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;
  bool isLoaded = false;

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    posts = await RemoteService().getPosts();

    if(posts != null){
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter with API"),),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemBuilder: (context, index){
            return Container(
              child: Text("hi"),
            );
          },
          itemCount: posts?.length,
        ),
        replacement: const Center(child: CircularProgressIndicator(),),
      ),
    );
  }
}