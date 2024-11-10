import 'package:flutter/material.dart';
import '../colors/colors.dart';

class PrimaryInput extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText; // Hanya untuk password
  final IconData icon;

  const PrimaryInput({
    super.key,
    required this.controller,
    required this.labelText,
    this.obscureText = false, // Default false untuk input lain
    required this.icon,
  });

  @override
  _PrimaryInputState createState() => _PrimaryInputState();
}

class _PrimaryInputState extends State<PrimaryInput> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.obscureText; // Menggunakan parameter dari widget
  }

  void _toggleVisibility() {
    setState(() {
      _isObscure = !_isObscure; // Toggle visibilitas
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      child: TextField(
        controller: widget.controller,
        obscureText: _isObscure, // Menggunakan status toggle
        decoration: InputDecoration(
          labelText: widget.labelText,
          prefixIcon: Icon(widget.icon, color: ColorUtil.primaryColor),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: ColorUtil.primaryColor,
              width: 2.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: ColorUtil.primaryColor,
              width: 2.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: ColorUtil.primaryColor,
              width: 2.0,
            ),
          ),
          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility : Icons.visibility_off,
                    color: ColorUtil.primaryColor,
                  ),
                  onPressed:
                      _toggleVisibility, // Toggle visibilitas saat ikon ditekan
                )
              : null, // Tidak menampilkan ikon jika bukan password
        ),
      ),
    );
  }
}
