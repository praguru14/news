import "dart:convert";

import "package:http/http.dart" as http;
import "package:news/models/ArticleModel.dart";

// ignore: camel_case_types
class NewsZ {
  List<ArticleModel> newsN = [];
  Future<void> gNews() async {
    String url =
        "https://newsapi.org/v2/everything?q=cryptocurrency&apiKey=ceb06f3a666f47f89fbbaf4999207197";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (jsonData["status"] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null &&
            element["description"] != null &&
            element["author"] != null) {
          ArticleModel none = ArticleModel(
              author: element["author"],
              title: element["title"],
              description: element["description"],
              url: element["url"],
              content: element["content"],
              urlToImage: element["urlToImage"]);
          newsN.add(none);
        }
      });
    }
  }
}
