import 'package:flutter/material.dart';

class HomeGridTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function() onTap;
  const HomeGridTile({Key? key, required this.icon, required this.title, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(tag: "$title Icon",child: Icon(icon, size: 50,)),
            SizedBox(height: 5,),
            Text(title, style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }


}
