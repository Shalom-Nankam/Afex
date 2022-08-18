import 'package:flutter/material.dart';

class PageColumn extends StatelessWidget {
  const PageColumn({super.key, required this.label, required this.hint});
  final String label;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              color: Color(0xff111827),
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 4,
        ),
        TextField(
          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff38cb89))),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xffd1d5db)),
                borderRadius: BorderRadius.circular(6)),
            hintText: hint,
            hintStyle: const TextStyle(
                color: Color(0xff9ca3af),
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
