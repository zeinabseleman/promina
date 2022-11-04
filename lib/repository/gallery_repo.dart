import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task/models/gallery_model.dart';


class GalleryRepo{

  GalleryModel galleryModel=GalleryModel();
  getGallery() async {
    print('zeinab');
    http.Response response = await http.get(
        Uri.parse('https://technichal.prominaagency.com/api/my-gallery'),
        headers:<String,String>{
          'Content-Type':'application/x-www-form-urlencoded',
        },
    );
    try{
      if(response.statusCode==200){
        var body = jsonDecode(response.body);
        galleryModel = GalleryModel.fromJson(body);
        return galleryModel;
      }else{
        print('status code == ${response.statusCode}');
      }

    }catch(e){
      print(e.toString());
    }
  }



}