// lib/widgets/custom_dropdown.dart
import 'package:flutter/material.dart';
import 'package:simulation_credit/core/utils/colors/colors.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final String value;
  final List<String> items;
  final Function(String?) onChanged;
  final double? width;
  final String defaultOption;
  final String? errorText;
  final bool isRequired;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? labelStyle;
  final TextStyle? dropdownStyle;

  const CustomDropdown({
    Key? key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    this.width,
    this.defaultOption = 'Silakan pilih',
    this.errorText,
    this.isRequired = false,
    this.contentPadding,
    this.labelStyle,
    this.dropdownStyle, required bool enabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label with optional required indicator
          Row(
            children: [
              Text(
                label,
                style: labelStyle ??
                    const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              //if (isRequired)
                // Text(
                //   ' *',
                //   style: TextStyle(
                //     color: Colors.red,
                //     fontSize: 16.0,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
            ],
          ),
          const SizedBox(height: 8.0),
          
          // Dropdown field
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: errorText != null ? Colors.red : ColorUtil.primaryColor,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: DropdownButtonFormField<String>(
              value: value,
              decoration: InputDecoration(
                contentPadding: contentPadding ??
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                border: InputBorder.none,
                errorText: errorText,
                errorStyle: const TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                ),
              ),
              items: [defaultOption, ...items].map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: dropdownStyle ??
                        const TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                  ),
                );
              }).toList(),
              onChanged: onChanged,
              style: dropdownStyle ??
                  const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
              isExpanded: true,
              icon: Icon(
                Icons.arrow_drop_down,
                color: ColorUtil.primaryColor,
              ),
              dropdownColor: Colors.white,
            ),
          ),
          
          // // Error text
          // if (errorText != null)
          //   Padding(
          //     padding: const EdgeInsets.only(top: 4.0, left: 12.0),
          //     child: Text(
          //       errorText!,
          //       style: const TextStyle(
          //         color: Colors.red,
          //         fontSize: 12,
          //       ),
          //     ),
          //   ),
        ],
      ),
    );
  }
}