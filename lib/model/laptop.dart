class Laptop{
  bool inStoreAvailability;
  String image;
  String manufacturer;
  double regularPrice;
  String shortDescription;
  String name;

  Laptop(bool inStoreAvailability, String image, String manufacturer, double regularPrice, String shortDescription, String name){

      this.inStoreAvailability = inStoreAvailability;
      this.image = image;
      this.manufacturer = manufacturer;
      this.regularPrice = regularPrice;
      this.shortDescription = shortDescription;
      this.name = name;
  }

  Laptop.fromJson(Map json)
        : inStoreAvailability = json['inStoreAvailability'],
          image = json['image'],
          manufacturer = json['manufacturer'],
          regularPrice = json['regularPrice'],
          shortDescription = json['shortDescription'],
          name = json['name'];

  Map toJson(){
    return {'inStoreAvailability': inStoreAvailability, 'image': image, 'manufacturer': manufacturer, 'regularPrice': regularPrice, 'shortDescription':shortDescription, 'name': name};
  }
}