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
    if (imageFile != null) {
      widget._viewModel.selectImage(imageFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajouter une photo"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                widget._viewModel.saveImage();
              },
              icon: const Icon(Icons.check))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: widget._viewModel,
                builder: (context, child) {
                  return (widget._viewModel.image != null &&
                          widget._viewModel.getErrorMessage == null)
                      ? Image.file(File(widget._viewModel.image?.path ?? ""))
                      : Text(widget._viewModel.getErrorMessage ?? "");
                }),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    maximumSize:
                        Size(MediaQuery.of(context).size.width / 2, 40)),
                onPressed: () => _pickImage(ImageSource.camera),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Prendre une photo"),
                    Icon(Icons.camera)
                  ],
                )),
            const SizedBox(height: 15),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    maximumSize:
                        Size(MediaQuery.of(context).size.width / 2, 40)),
                onPressed: () => _pickImage(ImageSource.gallery),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
