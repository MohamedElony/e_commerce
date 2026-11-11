import 'package:e_commerce/common/constants/theme/custme_theme/my_app_color.dart';
import 'package:flutter/material.dart';

class DropdownMenuExample extends StatelessWidget {
  final String selectedValue;
  final ValueChanged<String?> onSelected;
  final List<String> items;

  const DropdownMenuExample({super.key, 
    required this.selectedValue,
    required this.onSelected,
    required this.items,
  });

  @override
  
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      color: Colors.white,
      elevation: 3,
      onSelected: onSelected,
      itemBuilder: (BuildContext context) {
        return items.map((String item) {
          bool isSelected = item == selectedValue;
          
          return PopupMenuItem<String>(
            value: item,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: isSelected ? MyAppColor.primaryColor.withValues(alpha: .08) : Colors.transparent,
                border: isSelected
                    ? const Border(
                        left: BorderSide(color: MyAppColor.primaryColor, width: 4),
                      )
                    : null,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Text(
                item,
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? MyAppColor.primaryColor : Colors.black87,
                ),
              ),
            ),
          );
        }).toList();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(selectedValue, style: const TextStyle(fontSize: 16)),
            const SizedBox(width: 24),
            const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}