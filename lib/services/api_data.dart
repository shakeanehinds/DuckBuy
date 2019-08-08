import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "https://api.bestbuy.com/v1/";

class API{

  static Future getLaptops(){
    var url = baseUrl + "products((categoryPath.id=abcat0502000))?apiKey=YOURAPIKEY&sort=regularPrice.dsc&show=image,inStoreAvailability,manufacturer,regularPrice,shortDescription,name&pageSize=100&format=json";
    return http.get(url);
    
  }

  static Future getLaptopssearch(String term){
    var url = baseUrl + "products((search="+term+ "))?apiKey=YOURAPIKEY&sort=regularPrice.dsc&show=image,name,regularPrice,sku,shortDescription,inStoreAvailability,manufacturer&pageSize=30&format=json";
    return http.get(url);
    
  }

}

