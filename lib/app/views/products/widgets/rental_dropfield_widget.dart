import 'package:flutter/material.dart'; 

class SortDropdownButton extends StatelessWidget {
  final Function(String) onSelected;

  const SortDropdownButton({
    super.key,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.sort_by_alpha_rounded, size: 28, color: Colors.indigo),
      onPressed: () async {
        final screenSize = MediaQuery.of(context).size;

        final selected = await showMenu<String>(
          context: context,
          position: RelativeRect.fromLTRB(
            screenSize.width * 0.25, // Responsive left
            140.0, // Top position
            screenSize.width * 0.6, // Responsive right
            0,
          ),
          items: [
            PopupMenuItem(value: 'name_asc', child: Text('Sort by Name (A → Z)')),
            PopupMenuItem(value: 'name_desc', child: Text('Sort by Name (Z → A)')),
            PopupMenuItem(value: 'date_desc', child: Text('Sort by Date (Newest First)')),
            PopupMenuItem(value: 'date_asc', child: Text('Sort by Date (Oldest First)')),
          ],
        );

        if (selected != null) {
          onSelected(selected);
        }
      },
    );
  }
}
