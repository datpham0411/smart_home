
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Positioned(
          //   left: 46,
          //   top: 381,
          //   child: Container(
          //     width: 339,
          //     height: 102,
          //     decoration: ShapeDecoration(
          //       color: Colors.black.withOpacity(0.800000011920929),
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(20),
          //       ),
          //     ),
          //   ),
          // ),
          Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 200),
                  Text("Welcome!", style: Theme.of(context).textTheme.headlineLarge,),
                  SizedBox(height: 200),
                  Text("Let's Sign In or Log In to start!",
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 100,),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                    onPressed: () {
                    },
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(),
                      foregroundColor: Colors.green,
                      side: BorderSide(color: Colors.green),
                    ),
                    child: Text("LOG IN")
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      shape: RoundedRectangleBorder(),
                      foregroundColor: Colors.black,
                      side: BorderSide(color: Colors.green),
                    ),
                    child: Text("SIGN UP")
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
