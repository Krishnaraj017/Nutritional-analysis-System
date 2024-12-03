import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';
import 'package:isar/isar.dart';
import 'package:statedemo/presentation/screens/food/model/food_items.dart';

@RoutePage()
class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late List<CameraDescription> _cameras;
  late CameraController _controller;
  final Isar _isar = Isar.getInstance()!;
  String? serverMessage;
  String? message;
  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    _cameras = await availableCameras();
    _controller = CameraController(_cameras[0], ResolutionPreset.max);
    await _controller.initialize();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _sendPicture() async {
    try {
      XFile pictureFile = await _controller.takePicture();
      List<int> imageBytes = await pictureFile.readAsBytes();
      final Uri apiUrl = Uri.parse('http://192.168.178.25:8000/upload');
      var request = http.MultipartRequest('POST', apiUrl);
      print(request);
      request.files.add(
        http.MultipartFile.fromBytes(
          'image',
          imageBytes,
          filename: 'image.jpg',
        ),
      );

      var response = await request.send();

      var responseData = await response.stream.bytesToString();

      Map<String, dynamic> responseJson = json.decode(responseData);

      if (responseJson.containsKey('message')) {
        String message = responseJson['message'];
        setState(() {
          serverMessage = message;
        });
        print('Message from server: $message');
      }

      if (responseJson.containsKey('fooditems')) {
        List<dynamic> foodItemsJson = responseJson['fooditems'];
        for (var foodItemJson in foodItemsJson) {
          FoodItems foodItemIsar = FoodItems(
            id: foodItemJson['_id'],
            foodName: foodItemJson['name'],
            proteins: foodItemJson['proteins'].toDouble(),
            carbs: foodItemJson['carbohydrates'].toDouble(),
            fats: foodItemJson['fats'].toDouble(),
            calories: foodItemJson['calories'].toDouble(),
            quantity: foodItemJson['quantity'],
            foodId: foodItemJson['foodId'],
            category: foodItemJson['category'],
            v: foodItemJson['__v'],
            createdAt: DateTime.parse(foodItemJson['createdAt']),
            updatedAt: DateTime.parse(foodItemJson['updatedAt']),
          );

          print(foodItemIsar);
          await _isar.writeTxn(() => _isar.foodItems.put(foodItemIsar));
          setState(() {
            message = "(Imgae uploaded Successfully)";
          });
        }

        // Display success message only when foodItem data is present
      } else {
        print('foodItem is null or not available in the response');
      }

      if (response.statusCode == 200) {
        print('Image uploaded successfully');
      } else {
        print('Failed to upload image. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // File is picked from the gallery. You can handle the file as needed.
      print('Image picked from gallery: ${pickedFile.path}');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CameraPreview(_controller),
          ),
          if (serverMessage != null)
            Text(
              serverMessage!,
              style: TextStyle(
                color: Colors.red, // Green color for success message
              ),
            ),
          if (message != null)
            Text(
              message!,
              style: TextStyle(color: Colors.green),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  _sendPicture();
                },
                child: const Text('Take Picture'),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: _pickImage,
            child: const Text('Pick Image'),
          ),
        ],
      ),
    );
  }
}
