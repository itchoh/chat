import 'package:flutter/material.dart';

class Custom_TextField extends StatefulWidget {
  Custom_TextField({
    required this.hint,
    this.obsecure_bool = false,
    required this.bol2,
    this.onchanged,
    this.validator,
    this.bolcolor = false,
    this.controller, // Add controller here
  });

  final String? hint;
  bool obsecure_bool;
  final bool bol2;
  Function(String)? onchanged;
  FormFieldValidator? validator;
  final bool? bolcolor;
  final TextEditingController? controller; // Controller to manage the text

  @override
  State<Custom_TextField> createState() => _Custom_TextFieldState();
}

class _Custom_TextFieldState extends State<Custom_TextField> {

  void _toggleObscureText() {
    setState(() {
      widget.obsecure_bool = !widget.obsecure_bool;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller, // Set the controller
      validator: widget.validator,
      onChanged: widget.onchanged,
      obscureText: widget.obsecure_bool,
      style: TextStyle(
        color: !widget.obsecure_bool ? Colors.redAccent : Colors.black,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        suffixIcon: _buildSuffixIcon(),
        hintStyle: TextStyle(
          color: !widget.obsecure_bool ? Colors.redAccent : Colors.black,
        ),
        hintText: widget.hint,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.bolcolor == false ? Colors.black : Color(0xffB5251D),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.bolcolor == false ? Colors.black : Color(0xffB5251D),
          ),
        ),
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _buildSuffixIcon() {
    if (!widget.bol2) {
      return const SizedBox.shrink();
    }

    return IconButton(
      onPressed: _toggleObscureText,
      icon: widget.obsecure_bool
          ? const Icon(Icons.remove_red_eye_outlined, color: Colors.black)
          : const Icon(Icons.remove_red_eye,color: Colors.redAccent),
    );
  }
}
