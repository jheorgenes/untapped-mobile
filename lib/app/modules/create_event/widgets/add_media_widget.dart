import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:untapped/app/core/widgets_ui/elevated_button_ui.dart';

class AddMediaWidget extends StatefulWidget {
  final Function(File file) callback;

  const AddMediaWidget({
    super.key,
    required this.callback,
  });

  @override
  State<AddMediaWidget> createState() => _AddMediaWidgetState();
}

class _AddMediaWidgetState extends State<AddMediaWidget> {
  final ImagePicker _picker = ImagePicker();
  var image;

  _pickImage() async {
    var file = await _picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        image = Image.file(File(file.path));
        widget.callback(File(file.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButtonUi(
          borderRadius: 4,
          backgroundColor: Colors.transparent,
          callback: _pickImage,
          child: Container(
            height: 164,
            width: context.width,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: const Color(0XFF636882)),
              borderRadius: const BorderRadius.all(Radius.circular(4)),
            ),
            child: Center(
              child: image ??
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      FaIcon(
                        FontAwesomeIcons.photoFilm,
                        color: Color(0XFF636882),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Adicionar Foto de capa',
                        style: TextStyle(
                          color: Color(0XFF636882),
                        ),
                      )
                    ],
                  ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Selecione uma foto.',
          style: TextStyle(
            color: Color(0XFF636882),
          ),
        ),
      ],
    );
  }
}
