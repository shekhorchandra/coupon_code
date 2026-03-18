import 'dart:io';

class DealImageModel {
  final File? file; // For local images
  final String? url; // For network images
  bool isThumbnail;

  DealImageModel({this.file, this.url, this.isThumbnail = false});

  bool get isNetwork => url != null;
}
