import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final Function(String) onSearch;

  SearchBarWidget({required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      shadowColor: Colors.white,
      child: Row(
        children: [
          SizedBox(width: 12),
          Icon(Icons.search, color: Colors.black38),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search your city',
                hintStyle: TextStyle(color: Colors.black26),
              ),
              maxLines: 1,
              onChanged: (newText) {
                onSearch.call(newText);
              },
            ),
          ),
        ],
      ),
    );
  }
}
