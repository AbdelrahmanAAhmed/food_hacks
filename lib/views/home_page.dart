import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food_hacks/Widgets/custom_category.dart';
import 'package:food_hacks/models/foodmodel/categorymodel.dart';
import 'package:food_hacks/services/api.service.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
          bottomNavigationBar: const GNav(
            backgroundColor: Colors.amber,
            color: Colors.white,
            activeColor: Colors.white,
            gap: 7,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.favorite,
                text: 'Likes',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
          ),
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
