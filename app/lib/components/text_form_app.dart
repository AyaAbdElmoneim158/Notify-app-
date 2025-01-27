import 'package:app/styles/dimensions.dart';
import 'package:flutter/material.dart';

class TextFormApp extends StatelessWidget {
  final String label, hint, valid;
  final TextEditingController controller;
  final IconData icon;
  final bool haveIcon;
  final TextInputType type;
  final VoidCallback onPressed;

  const TextFormApp({
    super.key,
    required this.label,
    required this.hint,
    required this.onPressed,
    required this.type,
    required this.icon,
    required this.haveIcon,
    required this.controller,
    required this.valid,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: context.height10),
        SizedBox(
          width: double.maxFinite,
          child: TextFormField(
            controller: controller,
            keyboardType: type,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return valid;
              }
              return null;
            },
            decoration: InputDecoration(
              suffixIcon: haveIcon
                  ? IconButton(onPressed: onPressed, icon: Icon(icon))
                  : null,
              filled: true,
              fillColor: Colors.grey.withOpacity(.1),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(context.height10),
                borderSide: BorderSide.none,
              ),
              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.normal,
                fontSize: context.height15,
              ),
            ),
          ),
        )
      ],
    );
  }
}
