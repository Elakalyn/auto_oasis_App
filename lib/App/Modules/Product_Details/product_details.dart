import 'package:flutter/material.dart';

class CarDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Car Details'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          const Image(
            image: AssetImage('assets/car.png'),
            height: 200,
            width: double.infinity,
          ),
          const SizedBox(height: 20),
          const Text(
            'Audi Q5 2020',
            style: TextStyle(
                color: Colors.blue, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              //... 23 more widgets
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: RichText(
                text: TextSpan(
                    text: '\$100',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                  // more widgets
                ])),
          ),
        ],
      ),
    );
  }
}
