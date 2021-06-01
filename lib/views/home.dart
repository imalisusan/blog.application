import 'package:blog_application/services/crud.dart';
import 'package:blog_application/views/create_blog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CrudMethods crudMethods = new CrudMethods();

  QuerySnapshot blogsSnapshot;

  Widget blogsList() {
    return Container(
      child: Column(
        children: [
          blogsSnapshot != null ? ListView.builder(
            itemCount: blogsSnapshot.documents.length,
            itemBuilder: (context, index) {
              return BlogsTile(
                authorName: blogsSnapshot.documents[index].data['authorName'],
                title: blogsSnapshot.documents[index].data['title'],
                description: blogsSnapshot.documents[index].data['description'],
              );
            },
          ): Container(
            child: CircularProgressIndicator(),
            alignment: Alignment.center,)
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    crudMethods.getData().then((result) {
      blogsSnapshot = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Flutter ",
              style: TextStyle(
                fontSize: 22,
                fontFamily: 'Montserrat',
              ),
            ),
            Text(
              "Blog ",
              style: TextStyle(
                fontSize: 22,
                color: Colors.blue,
                fontFamily: 'Montserrat',
              ),
            )
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(),
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateBlog()));
              },
            )
          ],
        ),
      ),
    );
  }
}

class BlogsTile extends StatelessWidget {
  String title, description, authorName;

  BlogsTile(
      {@required this.title,
      @required this.description,
      @required this.authorName});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              color: Colors.black45.withOpacity(0.3),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          Container(
            child: Column(
              children: [
                Text(title),
                Text(description),
                Text(authorName),
              ],
            ),
          )
        ],
      ),
    );
  }
}
