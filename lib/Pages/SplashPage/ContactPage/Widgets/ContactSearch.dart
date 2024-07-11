import 'package:flutter/material.dart';

class ContactSearch extends StatelessWidget {
  const ContactSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              textInputAction: TextInputAction.done,
              onSubmitted: ((value)=>{
                print(value),
              }),

              decoration: InputDecoration(
                  hintText: 'Search contacts',
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.only(top: 13)
              ),

            ),
          ),
        ],
      ),
    );
  }
}
