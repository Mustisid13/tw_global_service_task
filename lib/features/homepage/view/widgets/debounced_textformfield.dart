import 'dart:async';
import 'package:flutter/material.dart';

class DebouncedTextFormField extends StatefulWidget {
  const DebouncedTextFormField({super.key, required this.hintText, required this.onChanged});
  final String hintText;
  final Function(String) onChanged;
  @override
  _DebouncedTextFormFieldState createState() => _DebouncedTextFormFieldState();
}

class _DebouncedTextFormFieldState extends State<DebouncedTextFormField> {
  final TextEditingController _controller = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _controller.dispose();
    _debounce?.cancel(); // Cancel the timer to prevent memory leaks
    super.dispose();
  }

  void _onTextChanged(String value) {
    // Cancel the previous timer if it's running
    if (_debounce != null && _debounce!.isActive) {
      _debounce!.cancel();
    }

    // Start a new timer
    _debounce = Timer(const Duration(milliseconds: 500), () {
      // Your code here that you want to execute after debounce duration
      widget.onChanged(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,

      onChanged: _onTextChanged,
      decoration: InputDecoration(
        labelText: widget.hintText,
          prefixIcon:Icon(Icons.search),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                  borderSide: const BorderSide(color: Colors.red, width: 0.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                  borderSide: const BorderSide(width: 0.5, color: Colors.green),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey, width: 0.5),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      BorderSide(color: Colors.grey.shade200, width: 0.5),
                ),
                fillColor: Colors.grey.shade200,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 12,
                ).copyWith(left: 10),
                filled: true,
                hintStyle: const TextStyle(
                  color: Color(0XFF616A7D),
                  fontSize: 14,
                ),
                isDense: true,
                errorStyle: const TextStyle(
                  height: 0.3,
                  fontSize: 10,
                ),
      ),
    );
  }
}
