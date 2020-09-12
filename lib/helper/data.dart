import 'package:news_feed/models/categorymodel.dart';

List<Categorymodel> getCategories() {
  List<Categorymodel> category = new List<Categorymodel>();
  Categorymodel categorymodel = new Categorymodel();

  categorymodel.categoryname = 'Business';
  categorymodel.imageurl =
      'https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60';
  category.add(categorymodel);
  categorymodel = new Categorymodel();

  categorymodel.categoryname = 'Entertainment';
  categorymodel.imageurl =
      'https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80';
  category.add(categorymodel);
  categorymodel = new Categorymodel();

  categorymodel.categoryname = 'General';
  categorymodel.imageurl =
      'https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60';
  category.add(categorymodel);
  categorymodel = new Categorymodel();

  categorymodel.categoryname = 'Health';
  categorymodel.imageurl =
      'https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80';
  category.add(categorymodel);
  categorymodel = new Categorymodel();

  categorymodel.categoryname = 'Science';
  categorymodel.imageurl =
      'https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80';
  category.add(categorymodel);
  categorymodel = new Categorymodel();

  categorymodel.categoryname = 'Sports';
  categorymodel.imageurl =
      'https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80';
  category.add(categorymodel);
  categorymodel = new Categorymodel();

  categorymodel.categoryname = 'Technology';
  categorymodel.imageurl =
      'https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80';
  category.add(categorymodel);
  categorymodel = new Categorymodel();

  return category;
}
