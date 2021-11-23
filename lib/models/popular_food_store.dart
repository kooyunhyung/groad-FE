class PopularFoodStore {
  final String storeName;
  final String foodCase;
  final int distance;
  final String imageUrl;

  PopularFoodStore(
      {required this.storeName,
      required this.foodCase,
      required this.distance,
      required this.imageUrl});
}

List<PopularFoodStore> foodList = [
  PopularFoodStore(
    storeName: "강릉집",
    foodCase: "한식",
    distance: 476,
    imageUrl: 'assets/gang.jpg',
  ),
  PopularFoodStore(
    storeName: "별채식당",
    foodCase: "한식",
    distance: 476,
    imageUrl: 'assets/byulchae.jpg',
  ),
  PopularFoodStore(
    storeName: "다미",
    foodCase: "한식",
    distance: 476,
    imageUrl: 'assets/dami.jpg',
  ),
];
