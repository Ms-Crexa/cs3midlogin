class Products {
  String id;
  String title;
  String image;
  String price;

  Products({this.id = "", this.image = "", this.title = "", this.price = ""});

  @override
  String toString() {
    // TODO: implement toString
    return "$id: $title";
  }
}
