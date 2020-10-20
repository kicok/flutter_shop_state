import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  void _setFavValue(bool newValue) {
    isFavorite = newValue;
    notifyListeners();
  }

  Future<void> toggleFavoriteStatus(String token, String userId) async {
    final oldStatus = isFavorite;
    isFavorite = !isFavorite;
    notifyListeners();

    final url =
        'https://flutter-update-95a71.firebaseio.com/userFavorites/$userId/$id.json?auth=$token';

    try {
      //PUT 은 PATCH와 비교해서 전체 데이터를 교체하는 차이점이 있음. 예를들어 PUT은 _id를 찾아 age만 업데이트하더라도 항상 모든 필드값을 가져와서 모든 필드를 항상 새로운 값으로 교체합니다.
      //PATCH는 PUT과 비교해서 부분 데이터를 업데이트하는 차이점이 있습니다. 예를들어 PATCH는 _id를 찾아 age만 업데이트할때 _id와 age만 받아와서해당 부분을 업데이트 합니다.
      final response = await http.put(url,
          body: json.encode(
            isFavorite,
          ));
      if (response.statusCode >= 400) {
        _setFavValue(oldStatus);
      }
    } catch (e) {
      //throw HttpException('Could not change Favorite!');
      _setFavValue(oldStatus);
    }
  }
}
