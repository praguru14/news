import 'package:flutter/material.dart';
import 'package:news/data/data.dart';
import 'package:news/models/catModel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<catModel> category = [];

  @override
  void initState() {
    super.initState();
    category = getCat();
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
      body: Column(
        children: [
          Container(
            height: 70.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: category.length,
              itemBuilder: (context, index) {
                return catCard(
                  imgUrl: category[index].imgUrl,
                  catName: category[index].catName,
                );
              },
            ),
          )
        ],
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
              child: Image.network(
                imgUrl,
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
