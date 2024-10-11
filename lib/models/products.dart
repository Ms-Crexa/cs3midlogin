class Products {
  String id;
  String title;
  String image;
  String price;
  String category;
  String description;
  String rate;
  String count;

  Products(
      {this.id = "",
      this.image = "",
      this.title = "",
      this.price = "",
      this.category = "",
      this.rate = "",
      this.count = "",
      this.description = ""});

  @override
  String toString() {
    // TODO: implement toString
    return "$id: $title";
  }
}
