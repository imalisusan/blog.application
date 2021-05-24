import 'package:flutter/material.dart';

class CreateBlog extends StatefulWidget {
  @override
  _CreateBlogState createState() => _CreateBlogState();
}

class _CreateBlogState extends State<CreateBlog> {
  String authorName, title, description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "New ",
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
        actions: <Widget>[
          Container(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: Icon(Icons.file_upload))
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              width: MediaQuery.of(context).size.width,
              child: Icon(
                Icons.add_a_photo,
                color: Colors.black54,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(hintText: "Author Name"),
                    style: TextStyle(fontFamily: 'Montserrat'),
                    onChanged: (val) {
                      authorName = val;
                    },
                  ),

                  TextField(
                    decoration: InputDecoration(hintText: "Title"),
                    style: TextStyle(fontFamily: 'Montserrat'),
                    onChanged: (val) {
                      title = val;
                    },
                  ),

                  TextField(
                    decoration: InputDecoration(hintText: "Description"),
                    style: TextStyle(fontFamily: 'Montserrat'),
                    onChanged: (val) {
                      description = val;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
