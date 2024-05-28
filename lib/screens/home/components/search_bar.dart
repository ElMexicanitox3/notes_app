import 'package:flutter/material.dart';
import 'package:notes_app/themes/app_themes.dart';

class SearchBarCustom extends StatelessWidget {
  const SearchBarCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          color: AppThemes.secondary,
          child: Row(
            children: [

              const SizedBox(width: 10),
              
              IconButton(
                icon: const Icon(Icons.search),
                iconSize: 30,
                color: AppThemes.w,
                onPressed: () {
                },
              ),
    
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  ),
                ),
              ),
    
              IconButton(
                icon: const Icon(Icons.filter_list),
                color: AppThemes.w,
                iconSize: 30,
                onPressed: () {},
              ),

              const SizedBox(width: 10),

    
            ],
          ),
        ),
      ),
    );
  }
}

