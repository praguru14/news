import 'package:news/models/catModel.dart';

List<catModel> getCat() {
  List<catModel> category = [];
  catModel catmodel;
  catmodel = new catModel();

  //1
  catmodel.catName = "Business";
  catmodel.imgUrl =
      "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1502&q=80";
  category.add(catmodel);

  //2
  catmodel = new catModel();
  catmodel.catName = "Entertainment";
  catmodel.imgUrl =
      "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  category.add(catmodel);

  //3
  catmodel = new catModel();
  catmodel.catName = "General";
  catmodel.imgUrl =
      "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  category.add(catmodel);

  //4
  catmodel = new catModel();
  catmodel.catName = "Health";
  catmodel.imgUrl =
      "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  category.add(catmodel);

  //5
  catmodel = new catModel();
  catmodel.catName = "Science";
  catmodel.imgUrl =
      "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  category.add(catmodel);

  //5
  catmodel = new catModel();
  catmodel.catName = "Sports";
  catmodel.imgUrl =
      "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  category.add(catmodel);

  //5
  catmodel = new catModel();
  catmodel.catName = "Technology";
  catmodel.imgUrl =
      "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  category.add(catmodel);

  return category;
}
