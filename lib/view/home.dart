import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/data/data.dart';
import 'package:news/data/news.dart';
import 'package:news/models/ArticleModel.dart';
import 'package:news/models/catModel.dart';

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
    return Scaffold(
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
                        desc: artNews[index].description);
                  },
                ),
              ),
            ],
            //blogs
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
    return GestureDetector(
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
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imgURL, title, desc;

  const BlogTile(
      {Key? key, required this.imgURL, required this.title, required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(imgURL),
          Text(title),
          Text(desc),
        ],
      ),
    );
  }
}

//ceb06f3a666f47f89fbbaf4999207197
