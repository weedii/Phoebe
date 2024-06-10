import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final bool showPadding;
  final bool textOrDigits;
  final bool showKGIcon;
  final String? initialValue;
  final bool? autoFocus;

  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      required this.showPadding,
      required this.textOrDigits,
      required this.showKGIcon,
      this.initialValue,
      this.autoFocus});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool showPass = true;

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      widget.controller.text = widget.initialValue!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.showPadding
          ? const EdgeInsets.symmetric(horizontal: 25.0)
          : const EdgeInsets.all(0),
      child: TextField(
        autofocus: widget.autoFocus ?? false,
        controller: widget.controller,
        obscureText: widget.obscureText && showPass,
        keyboardType: widget.textOrDigits ? null : TextInputType.number,
        inputFormatters: widget.textOrDigits
            ? null
            : <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white70,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.yellow[700]!),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
          suffixIcon: widget.showKGIcon
              ? Container(
                  padding: const EdgeInsets.only(top: 15, left: 15),
                  child: const Text(
                    "Kg",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // fontSize: 20,
                    ),
                  ),
                )
              : widget.obscureText
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          showPass = !showPass;
                        });
                      },
                      child: Icon(
                        Icons.remove_red_eye,
                        size: 20,
                        color: !showPass ? Colors.yellow[700] : Colors.black,
                      ),
                    )
                  : null,
        ),
      ),
    );
  }
}
