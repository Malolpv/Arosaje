import 'dart:io';

import 'package:arosaje/viewmodels/add_plant_view_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPlant extends StatefulWidget {
  final AddPlantViewModel _viewModel;
  const AddPlant(this._viewModel, {super.key});

  @override
  State<StatefulWidget> createState() => _AddPlant();
}

class _AddPlant extends State<AddPlant> {
  void _pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    final imageFile = await imagePicker.pickImage(source: source);
    if (imageFile != null) {
      widget._viewModel.selectImage(imageFile);
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Ajouter une plante")),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: AnimatedBuilder(
                  animation: widget._viewModel,
                  builder: (context, child) {
                    final errorMessage = widget._viewModel.getErrorMessage;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                              labelText: 'Nom de la plante',
                              errorText:
                                  "Veuillez donner un nom à votre plante"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Veuillez donner un nom à votre plante';
                            }
                            return null;
                          },
                          onSaved: widget._viewModel.plantSaved,
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        (widget._viewModel.image != null &&
                                widget._viewModel.getErrorMessage == null)
                            ? Image.file(
                                File(widget._viewModel.image?.path ?? ""),
                                height: MediaQuery.of(context).size.height / 3,
                              )
                            : Text(widget._viewModel.getErrorMessage ?? ""),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                maximumSize: Size(
                                    MediaQuery.of(context).size.width / 2, 40)),
                            onPressed: () => _pickImage(ImageSource.camera),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text("Prendre une photo"),
                                Icon(Icons.camera)
                              ],
                            )),
                        const SizedBox(height: 5),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                maximumSize: Size(
                                    MediaQuery.of(context).size.width / 2, 40)),
                            onPressed: () => _pickImage(ImageSource.gallery),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text("Choisir une photo"),
                                Icon(Icons.photo)
                              ],
                            )),
                        if (!widget._viewModel.getIsLoading)
                          Column(
                            children: [
                              Align(
                                alignment: FractionalOffset.bottomCenter,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: Size(
                                          MediaQuery.of(context).size.width,
                                          40)),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      widget._viewModel.save();
                                    }
                                  },
                                  child: const Text('Sauvegarder',
                                      style: TextStyle(fontSize: 18)),
                                ),
                              )
                            ],
                          )
                        else
                          const Center(
                            child: CircularProgressIndicator(),
                          ),
                        if (errorMessage != null) Text(errorMessage),
                      ],
                    );
                  }),
            ),
          ),
        ));
  }
}
