import 'package:flutter_test/flutter_test.dart';
import 'package:wasla/features/cart/presentation/view_models/cart_view_model.dart';
import 'package:wasla/features/products/domain/entities/product.dart';

void main() {
  test('The item must be added to the cart', () async {
    CartViewModel cartViewModel = CartViewModel();
    final mockProduct = Product(
      id: 'p1',
      name: {},
      price: '50.0 NIS',
      image: 'image.png',
      category: '',
      description: {},
      rating: 4.2,
      type: {},
      pharmacyAvailable: ['ph1', 'ph2'],
    );
    await cartViewModel.addToCart(mockProduct);

    expect(cartViewModel.items.length, 1);
  });
}
