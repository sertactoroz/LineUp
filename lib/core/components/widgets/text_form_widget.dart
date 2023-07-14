import 'package:flutter/material.dart';

class TextFormWidget extends StatefulWidget {
  bool? iconVisible;
  Function? iconButton;
  bool? isHided;
  TextEditingController controller;
  String hinText;
  String labelText;

  TextFormWidget({
    Key? key, // Add Key parameter
    this.isHided,
    this.iconVisible,
    this.iconButton,
    required this.controller,
    required this.hinText,
    required this.labelText,
  }) : super(key: key); // Add super constructor

  @override
  State<TextFormWidget> createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isHided ?? false,
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon: widget.isHided != null
            ? IconButton(
                onPressed: () {
                  widget.isHided = !(widget.isHided ?? false);
                  setState(() {});
                },
                icon: widget.isHided ?? false
                    ? const Icon(Icons.remove_red_eye)
                    : const Icon(Icons.remove_red_eye_outlined),
              )
            : null,
        hintText: widget.hinText,
        labelText: widget.labelText,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
      ),
    );
  }
}
