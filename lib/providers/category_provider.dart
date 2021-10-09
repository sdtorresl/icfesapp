import 'package:global_configuration/global_configuration.dart';
import 'package:icfesapp/models/category_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as json;

class CategoriesProvider {
  final String _url =
      GlobalConfiguration().getValue("api_url") + "/json-sesiones-categorias";

  Future<List<ScheduleCategoryModel>> getCategory() async {
    try {
      var response = await http.get(_url);

      if (response.statusCode == 200) {
        print(response.body);
        List<dynamic> jsonResponse = json.jsonDecode(response.body);
        List<ScheduleCategoryModel> categories = [];

        for (var item in jsonResponse) {
          ScheduleCategoryModel category = ScheduleCategoryModel.fromMap(item);
          categories.add(category);
        }

        return categories;
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (Exception) {}

    return [];
  }
}
