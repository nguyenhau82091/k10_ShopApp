import 'dart:convert';
import 'package:k10_shopapp/model/cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartService {
  static Future<List<Cart>> addCart(String product, String user, String image,
      int quantity, int price, String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Cart> existingCart = [];
    print("priceAddcart.................$price");
    try {
      // Retrieve existing cart data
      List<String>? cartStrings = prefs.getStringList("cart");
      if (cartStrings != null) {
        existingCart = cartStrings
            .map((cartItem) => Cart.fromJson(json.decode(cartItem)))
            .toList();
      }

      // Create a new cart item
      Cart newCartItem = Cart(
        idProduct: product,
        userId: user,
        image: image,
        quantity: quantity,
        price: price,
        name: name,
      );

      // Add the new item to the existing cart
      existingCart.add(newCartItem);

      // Convert the entire cart to JSON strings and save
      final createCarts = existingCart
          .map((cartItem) => jsonEncode(cartItem.toJson()))
          .toList();
      await prefs.setStringList("cart", createCarts);

      print("Add cart thành công");

      return existingCart;
    } catch (e) {
      print("Lỗi.............$e");
      return existingCart;
    }
  }

  static Future<List<Cart>> getCart(String userId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Cart> carts = List.empty(growable: true);
    List<String>? cart = prefs.getStringList("cart");
    try {
      if (cart != null) {
        carts = cart
            .map((cartItem) => Cart.fromJson(json.decode(cartItem)))
            .toList();
        return carts.where((item) => item.userId == userId).toList();
      }
      return [];
    } catch (e) {
      print("Lỗi get cart.........................$e");
      return [];
    }
  }

  static Future<bool> checkItemCart(String productId, String userId) async {
    List<Cart> cart = await getCart(userId);
    bool productExists = cart
        .any((item) => item.idProduct == productId && item.userId == userId);
    if (productExists) {
      print("Cart đã tồn tại");
      return true;
    }
    return false;
  }

  static Future<List<Cart>> updateCartQuantity(
    String productId,
    int quantity,
  ) async {
    print("quantityUpdate...............$quantity");
    print("product............$productId");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Cart> existingCart = [];

    try {
      // Retrieve existing cart data
      List<String>? cartStrings = prefs.getStringList("cart");
      if (cartStrings != null) {
        existingCart = cartStrings
            .map((cartItem) => Cart.fromJson(json.decode(cartItem)))
            .toList();
      }

      // Find the item with the specified productId in the existing cart
      int itemIndex = existingCart
          .indexWhere((cartItem) => cartItem.idProduct == productId);

      if (itemIndex != -1) {
        // Update the quantity of the item
        existingCart[itemIndex] =
            existingCart[itemIndex].copyWith(quantity: quantity);

        // Convert the entire cart to JSON strings and save
        final updatedCartStrings = existingCart
            .map((cartItem) => jsonEncode(cartItem.toJson()))
            .toList();
        await prefs.setStringList("cart", updatedCartStrings);
      }

      print("Update cart quantity thành công");

      return existingCart;
    } catch (e) {
      print("Lỗi.............$e");
      return existingCart;
    }
  }
}
