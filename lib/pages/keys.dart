class Car {
  late String name;
  late String type;
  late String image;
  late String price;
  late String category;
  bool isLiked = false;

  Car(
      { required this.name,
        required this.type,
        required this.image,
        required this.price,
        required this.category});
}