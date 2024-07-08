import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {

  final String btnName ;
  final IconData icon ;

  const PrimaryButton({super.key, required this.btnName, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
      decoration: BoxDecoration(
          color: Colors.lightBlueAccent[700],
          borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon),
          SizedBox(width: 10,),
          Text(btnName,style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Poppins"),)
        ],
      ),
    );
  }
}
