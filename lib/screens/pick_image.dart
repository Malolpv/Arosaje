import 'dart:io';

import 'package:arosaje/viewmodels/pick_image_view_model.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

class PickImage extends StatefulWidget {
  final PickImageViewModel _viewModel;

  const PickImage(this._viewModel, {super.key});

  @override
  State<StatefulWidget> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  void _pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    final imageFile = await imagePicker.pickImage(source: source);
    widget._viewModel.selectImage(imageFile);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Picture"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                //TODO IMPLEMENTER LA VALIDATION
              },
              icon: const Icon(Icons.check))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            // if (widget._viewModel.image != null &&
            //     widget._viewModel.getErrorMessage != null)
            //   Image.file(File(widget._viewModel.getPath()))
            // else
            //   Text(widget._viewModel.getErrorMessage ?? ""),
            ElevatedButton(
                onPressed: () => _pickImage(ImageSource.camera),
                child: Row(
                  children: const [
                    Text("Prendre une photo"),
                    Icon(Icons.camera)
                  ],
                )),
            ElevatedButton(
                onPressed: () => _pickImage(ImageSource.gallery),
                child: Row(
                  children: const [
                    Text("Choisir une photo"),
                    Icon(Icons.photo)
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
