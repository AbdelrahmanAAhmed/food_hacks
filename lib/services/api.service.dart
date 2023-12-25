import 'package:dio/dio.dart';
import 'package:food_hacks/models/foodmodel/categorymodel.dart';

class CategoryService {
  final Dio _dio;

  CategoryService(this._dio);

  getFoodCategories() async {
    Response response = await _dio.get(
        'https://www.themealdb.com/api/json/v1/1/categories.php?fbclid=IwAR1PsX_dnlwoGHc8mcf3dGPSGSMn7fbXsx6TadyFTHu6YVJ8r7-TFoEPrTg');

    Map<String, dynamic> jsonData = response.data;

    List<dynamic> categories = jsonData["categories"];

    List<CategoriesModel> categoriesList = [];
    for (var category in categories) {
      CategoriesModel categoriesModel = CategoriesModel(
        idCategory: category["idCategory"],
        categoryName: category["strCategory"],
        categoryThumb: category["strCategoryThumb"],
        categoryDescription: category["strCategoryDescription"],
      );
      categoriesList.add(categoriesModel);
    }
  }
}
