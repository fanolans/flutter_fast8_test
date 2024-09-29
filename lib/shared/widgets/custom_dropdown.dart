import 'package:flutter/material.dart';

import '../../core/styles/app_colors.dart';

class CustomDropdown extends StatelessWidget {
  final String? value;
  final List<String> options;
  final ValueChanged<String?>? onChanged;
  final bool enabled;

  const CustomDropdown({
    super.key,
    required this.value,
    required this.options,
    this.onChanged,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.primary,
            width: 2.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 1.0,
          ),
        ),
      ),
      dropdownColor: AppColors.background,
      items: options
          .map((option) => DropdownMenuItem(
                value: option,
                child: Text(
                  option,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ))
          .toList(),
      onChanged: enabled ? onChanged : null,
      isExpanded: true,
      disabledHint: value != null ? Text(value!) : null,
    );
  }
}
