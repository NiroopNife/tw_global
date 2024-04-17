import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:tw_global/domain/model/pixabay_model.dart';
import 'package:tw_global/domain/services/api_service.dart';

class PixabayViewModel extends GetxController {
  final ApiService _service = GetIt.instance<ApiService>();
  RxList<PixabayModel> photos = <PixabayModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPhotos();
  }

  Future<void> fetchPhotos() async {
    try {
      final List<PixabayModel> fetchedPhotos = await _service.fetchImages();
      photos.assignAll(fetchedPhotos);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }
}