import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {

  final String btnName ;
  final IconData icon ;
  final VoidCallback onTap;

  const PrimaryButton({super.key, required this.btnName, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
        decoration: BoxDecoration(
            color: Colors.lightBlueAccent[700],
            borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(width: 10,),
            Text(btnName,style: const TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Poppins"),)
          ],
        ),
      ),
    );
  }
}
