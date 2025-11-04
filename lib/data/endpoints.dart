class Endpoints {
  Endpoints._();

  static const String content = '/products';

  static String productById(int id) => '/products/$id';
}
