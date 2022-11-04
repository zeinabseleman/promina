import 'package:flutter/cupertino.dart';
import 'package:task/models/gallery_model.dart';
import 'package:task/repository/gallery_repo.dart';

import '../models/user_model.dart';
import '../repository/auth_repo.dart';


class GalleryProvider extends ChangeNotifier {
  GalleryRepo galleryRepo=GalleryRepo();
  GalleryModel? galleryModel;


  getGallery() async {
    await galleryRepo.getGallery().then((value) {
      galleryModel = value;
      notifyListeners();
    });
  }

}