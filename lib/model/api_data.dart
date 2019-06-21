import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "https://api.bestbuy.com/v1/products((categoryPath.id=abcat0502000))?apiKey=wgd9fp6cujtdn27wm9k8rtdg&sort=image.asc&show=image,inStoreAvailability,manufacturer,regularPrice,shortDescription,name&pageSize=10&format=json";

class API{

  static Future getLaptops(){
    var url = baseUrl;
    return http.get(url);
    
  }
}

