import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class PickPhoto {
  List<String> listImage = List.empty(growable: true);

  addImage(String imageEncode) {
    listImage.add(imageEncode);
  }

  Future<File> processImageCamera(XFile pickedFile) async {
    File img = File(pickedFile.path);
    Directory directory = await getApplicationDocumentsDirectory();
    String localPath = directory.path;
    String uniqueID = UniqueKey().toString();

    return await img.copy('$localPath/image_$uniqueID.png');
  }

  Future<String> imageCompressEncodeBase64(File image) async {
    Uint8List imageBytes = image.readAsBytesSync();

    Uint8List compress =
        await FlutterImageCompress.compressWithList(imageBytes, quality: 50);

    return base64Encode(compress);
  }
}
