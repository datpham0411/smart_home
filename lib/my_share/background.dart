
import 'package:flutter/material.dart';

class Background extends StatelessWidget{
  final Widget? child;

  const Background({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/background.jpg'),
                  fit: BoxFit.cover
              )
          ),
          child: this.child,
        ),
        Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.43)
            )
        ),

      ],
    );
  }
}