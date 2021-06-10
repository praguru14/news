import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/data/data.dart';
import 'package:news/data/news.dart';
import 'package:news/models/ArticleModel.dart';
import 'package:news/models/catModel.dart';
import 'package:news/view/homeNext.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<catModel> category = [];
  List<ArticleModel> artNews = [];
  // bool _loading = true;
  getNews() async {
    NewsZ n1 = NewsZ();
    await n1.gNews();
    artNews = n1.newsN;
    setState(() {
      // _loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    category = getCat();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true, //wont center
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Crypto",
                style: TextStyle(color: Colors.blue),
              ),
              Text("World"),
            ],
          ),
          elevation: 1.0,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                // Coloumn for Categories showing them horizontally
                Container(
                  height: 65,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: category.length,
                    itemBuilder: (context, index) {
                      return catCard(
                        imgUrl: category[index].imgUrl,
                        catName: category[index].catName,
                      );
                    }, //itemBuilder
                  ),
                ),

                //BLOG
                Container(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 16),
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: artNews.length,
                    itemBuilder: (context, index) {
                      return BlogTile(
                          imgURL: artNews[index].urlToImage,
                          title: artNews[index].title,
                          desc: artNews[index].description,
                          url: artNews[index].url);
                    },
                  ),
                ),
              ],
              //blogs
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class catCard extends StatelessWidget {
  final imgUrl, catName;

  const catCard({Key? key, this.imgUrl, this.catName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 6.0),
          margin: EdgeInsets.only(right: 6.0),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: imgUrl,
                  width: 120,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 120,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black26,
                ),
                child: Text(
                  catName,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imgURL, title, desc, url;

  const BlogTile(
      {Key? key,
      required this.imgURL,
      required this.title,
      required this.desc,
      required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => homeNext(
                        blogURL: url,
                      )));
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 18),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
            child: Column(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(imgURL)),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  desc,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//ceb06f3a666f47f89fbbaf4999207197
