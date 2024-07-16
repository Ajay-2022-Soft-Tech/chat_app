import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NewContactTile extends StatelessWidget {
  final String btnName;
  final IconData icon;
  final VoidCallback ontap;
  const NewContactTile(
      {super.key,
        required this.btnName,
        required this.icon,
        required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              child: Icon(
                icon,
                size: 30,
                color: Colors.lightBlue,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(width: 20),
            Text(
              btnName,
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ),
    );
  }
}