import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food_hacks/Widgets/custom_category.dart';
import 'package:food_hacks/models/foodmodel/categorymodel.dart';
import 'package:food_hacks/services/api.service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'Home Page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoriesModel> categories = [];
  @override
  void initState() {
    super.initState();
    categoryList();
  }

  void categoryList() async {
    categories = await CategoryService(Dio()).getFoodCategories();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CustomCategoryListItem(
            categoriesModel: categories[index],
          );
        },
      )),
    );
  }
}
