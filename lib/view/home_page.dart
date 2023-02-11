import 'package:app/models/news_model.dart';
import 'package:app/repository/new_repository.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Final Hive")),
      body: FutureBuilder(
        future: NewRepository().getNews(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.data is String) {
            return Center(child: Text(snapshot.data));
          } else {
            Box<NewsModel> data = snapshot.data as Box<NewsModel>;
            return ListView.builder(itemBuilder: (context, index) {
              return ListTile(
                title: Text(data.getAt(index)!.name.toString()),
              );
            },itemCount: data.length,
            );
          }
        },
      ),
    );
  }
}
