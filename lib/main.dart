import 'package:NewsApp/screens/home_screen.dart';
import 'package:NewsApp/screens/signin_screen.dart';
import 'package:NewsApp/services/api_service.dart';
import 'package:flutter/material.dart';
import 'components/customListTile.dart';
import 'model/article_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // home: HomePage(),
        debugShowCheckedModeBanner: false,
        home: SignInScreen());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();
  bool typing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: typing ? TextBox1() : Text("Search in Feed"),
        leading: IconButton(
          icon: Icon(typing ? Icons.done : Icons.search),
          onPressed: () {
            setState(() {
              typing = !typing;
            });
          },
        ),
      ),
      //Now let's call the APi services with futurebuilder wiget
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          //let's check if we got a response or not
          if (snapshot.hasData) {
            //Now let's make a list of articles
            List<Article> articles = snapshot.data;
            return ListView.builder(
              //Now let's create our custom List tile
              itemCount: articles.length,
              itemBuilder: (context, index) =>
                  customListTile(articles[index], context),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class TextBox1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.white,
      child: TextField(
        decoration:
            InputDecoration(border: InputBorder.none, hintText: 'Search'),
      ),
    );
  }
}
