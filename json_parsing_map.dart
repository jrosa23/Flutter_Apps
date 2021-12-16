import 'dart:convert';
import 'package:first_flutter_app/model/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class JsonParsingMap extends StatefulWidget{
  const JsonParsingMap({Key? key}) : super(key: key);

  @override
  _JsonParsingMapState createState() => _JsonParsingMapState();
}

class _JsonParsingMapState extends State<JsonParsingMap>{
  late Future<PostList> data;

  @override
  void initState(){
    super.initState();
    Network network = Network("https://jsonplaceholder.typicode.com/posts");
    data = network.loadPosts();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Plan Old Dart Object"),
      ),
        body: Center(
          child: Container(
            child: FutureBuilder(
                future: data,
                builder: (context, AsyncSnapshot<PostList> snapshot){
              List<Post> allPosts;
              if(snapshot.hasData){
                allPosts = snapshot.data!.posts;
                return createListview(allPosts, context);
              }else{
                return const CircularProgressIndicator();
              }
            }
          )
        )
      )
    );
  }

  Widget createListview(List<Post> data, BuildContext context){
    return Container(
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, int index){
            return Column(
              children: <Widget>[
                const Divider(height: 9.0),
                ListTile(
                  title: Text(data[index].title),
                  subtitle: Text(data[index].body),
                  leading: Column(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.amber,
                        radius: 24,
                        child: Text(data[index].id.toString())
                      )
                    ]
                  )
                )
              ]
            );
          }
      )
    );
  }
}

class Network {
  final String url;
  Network(this.url);

  Future<PostList> loadPosts() async {
    final response = await get(Uri.parse(url));
    if(response.statusCode == 200){
      return PostList.fromJson(json.decode(response.body));
    }else{
      throw Exception("Failed to get posts");
    }
  }
}