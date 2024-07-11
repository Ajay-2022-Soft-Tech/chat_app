import 'package:flutter/material.dart';

class NewContactTile extends StatelessWidget {

  final String btnName;
  final IconData icon;
  final VoidCallback ontap;
  const NewContactTile({super.key, required this.btnName, required this.icon, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      borderRadius: BorderRadius.circular(20),
      splashColor: Colors.lightBlueAccent,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(
          children: [
            Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent[700],
                shape: BoxShape.circle
              ),
              child: Icon(icon),
            ),
            SizedBox(width: 15,),
            Text(btnName,style: TextStyle(color: Colors.white,fontSize: 18),)
          ],
        ),
      ),
    );
  }
}
