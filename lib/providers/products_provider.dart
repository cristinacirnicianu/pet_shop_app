import 'package:flutter/material.dart';
import 'package:petshopapp/models/http_exceptions.dart';
import 'product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Products extends ChangeNotifier {
  List<Product> _items = [
//    Product(
//      id: 'p1',
//      title: 'Red Shirt',
//      description: 'A red shirt - it is pretty red!',
//      price: 29.99,
//      imageUrl:
//          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
//    ),
//    Product(
//      id: 'p2',
//      title: 'Trousers',
//      description: 'A nice pair of trousers.',
//      price: 59.99,
//      imageUrl:
//          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
//    ),
//    Product(
//      id: 'p3',
//      title: 'Yellow Scarf',
//      description: 'Warm and cozy - exactly what you need for the winter.',
//      price: 19.99,
//      imageUrl:
//          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
//    ),
//    Product(
//      id: 'p4',
//      title: 'A Pan',
//      description: 'Prepare any meal you want.',
//      price: 49.99,
//      imageUrl:
//          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
//    ),
//
  ];

  var _showFavoritesOnly = false;
  final String authToken;
  final String userId;
  Products(this.authToken, this.userId, this._items);

  List<Product> get items {
    if (_showFavoritesOnly) {
      return _items.where((prodItem) => prodItem.isFavorite).toList();
    }
    return [..._items];
  }

  List<Product> get getFavoritesItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> fetchAndSetProducts() async {
    var url = 'https://flutter-demo-fire.firebaseio.com/products.json?auth=$authToken&orderBy="creatorId"&equalTo="$userId"';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Product>loadedProducts =[];
      if(extractedData==null){
        return;
      }
      url = 'https://flutter-demo-fire.firebaseio.com/userFAvorites/$userId.json?auth=$authToken';
      final favoriteResponse =await http.get(url);
      final favoriteData = json.decode(favoriteResponse.body);
      extractedData.forEach((prodId, prodData) {
        loadedProducts.add(Product(
          id: prodId,
          description: prodData['description'],
          imageUrl: prodData['imageUrl'],
          isFavorite:favoriteData ==null ? false :  favoriteData[prodId] ?? false,
          price: prodData['price'],
          title: prodData['title'],
        ));
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> addProduct(Product product) async {
    final url = 'https://flutter-demo-fire.firebaseio.com/products.json?auth=$authToken';
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'title': product.title,
          'description': product.description,
          'imageUrl': product.imageUrl,
          'price': product.price,
          'creatorId': userId,
        }),
      );
      final newProduct = Product(
          title: product.title,
          description: product.description,
          price: product.price,
          imageUrl: product.imageUrl,
          id: json.decode(response.body)['name']);
      _items.add(newProduct);
      // _items.insert(0, newProduct); //insert at the start of list
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> updateProduct(String id, Product newProduct) async {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      final url = 'https://flutter-demo-fire.firebaseio.com/products/$id.json?auth=$authToken';
      await http.patch(url,
          body: json.encode({
            'title': newProduct.title,
            'description': newProduct.description,
            'imageUrl': newProduct.imageUrl,
            'price': newProduct.price,
          }));
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('.... nothing here');
    }
  }

  Future<void> deleteProduct(String id) async {
    final url = 'https://flutter-demo-fire.firebaseio.com/products/$id.json?auth=$authToken';
    final existingProdIndex = _items.indexWhere((prod) => prod.id == id);
    var existingProduct = _items[existingProdIndex];
    _items.removeAt(existingProdIndex);
    notifyListeners();
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _items.insert(existingProdIndex, existingProduct);
      notifyListeners();
      throw HttpException('Could not delete product!');
    }
    existingProduct = null;

  }
//  void showFavoritesOnly() {
//  _showFavoritesOnly = true;
//  notifyListeners();
//}
//void showAllProducts() {
//    _showFavoritesOnly = false;
//    notifyListeners();
//}
}
