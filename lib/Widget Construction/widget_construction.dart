import 'package:flutter/material.dart';

class Construction extends StatelessWidget {
  const Construction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(),
    );
  }
}

class settingWidget extends StatelessWidget {
  const settingWidget({
    super.key,
    required this.name,
    required this.image,
  });

  final image;
  final name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 148,
      height: 148,
      decoration: BoxDecoration(
        color: Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
            child: Column(
          children: [
            Expanded(
              child: Image.asset(image, width: 70, height: 70),
            ),
            SizedBox(height: 5),
            Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
            )
          ],
        )),
      ),
    );
  }
}
