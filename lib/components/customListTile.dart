import 'package:NewsApp/model/article_model.dart';
import 'package:NewsApp/pages/articles_details_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
Widget customListTile(Article article, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticlePage(
                    article: article,
                  )));
    },
    child: InkWell(
      onTap: () async {
        String u = article.url.toString();
        ;
        if (await canLaunchUrlString(u)) {
          await launchUrlString(u);
        } else {
          throw "could not lauch url";
        }
      },
      child: Card(
        
        

        margin: EdgeInsets.all(12.0),
        
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    article.publishedAt + "  " + article.source.name,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    article.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: Color.fromARGB(255, 118, 192, 252),
                    ),
                  ),
                  Text(
                    article.description.toString().substring(0,80)+'...',
                    style: TextStyle(
                     color: Color.fromARGB(255, 118, 192, 252),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.20,
              decoration: BoxDecoration(
                //let's add the height

                image: DecorationImage(
                    image: NetworkImage(article.urlToImage.toString()),
                    fit: BoxFit.fitWidth),
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
