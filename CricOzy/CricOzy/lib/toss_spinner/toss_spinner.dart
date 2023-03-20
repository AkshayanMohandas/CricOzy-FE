// import 'dart:math';

// import 'package:flutter/material.dart';

// class CoinToss extends StatefulWidget {
//   // const CoinToss({super.key});

//   @override
//   State<CoinToss> createState() => _CoinTossState();
// }

// class _CoinTossState extends State<CoinToss>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _animation;
//   bool _isHeads = true;
//   bool _isAnimating = false;

//   @override
//   void initState() {
//     super.initState();

//     _animationController = AnimationController(
//       duration: const Duration(milliseconds: 1000),
//       vsync: this,
//     );

//     _animation = Tween(begin: 0.0, end: pi).animate(_animationController)
//       ..addListener(() {
//         setState(() {});
//       })
//       ..addStatusListener((status) {
//         if (status == AnimationStatus.completed) {
//           setState(() {
//             _isAnimating = false;
//             _isHeads = Random().nextBool();
//           });
//           _animationController.reset();
//         }
//       });
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   void _startAnimation() {
//     if (!_isAnimating) {
//       setState(() {
//         _isAnimating = true;
//       });
//       _animationController.forward();
//     }
//   }

//   Widget _buildCoin() {
//     return Transform(
//       transform: Matrix4.rotationY(_animation.value),
//       alignment: Alignment.center,
//       child: Image.asset(
//         _isHeads
//             ? 'assets/hotel/coin_heads.png'
//             : 'assets/hotel/coin_tails.png',
//         width: 250,
//         height: 250,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 248, 236, 228),
//       // appBar: AppBar(
//       //   title: Text('Coin Toss'),
//       // ),
//       body: GestureDetector(
//         onTap: _startAnimation,
//         child: Container(
//           color: Color.fromARGB(255, 248, 236, 228),
//           child: Center(
//             child: _isAnimating
//                 ? _buildCoin()
//                 : Text(
//                     _isHeads ? 'Heads' : 'Tails',
//                     style: TextStyle(
//                       fontSize: 50,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// Widget makeInput({label, obscureText = false}) {
//   return Column(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: <Widget>[
//       Text(
//         label,
//         style: TextStyle(
//             fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
//       ),
//       SizedBox(
//         height: 5,
//       ),
//       TextField(
//         obscureText: obscureText,
//         decoration: InputDecoration(
//           contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
//           // enabledBorder: OutlineInputBorder(
//           //     borderSide: BorderSide(color: Colors.grey[400])),
//           // border: OutlineInputBorder(
//           //     borderSide: BorderSide(color: Colors.grey[400])),
//         ),
//       ),
//       SizedBox(
//         height: 30,
//       ),
//     ],
//   );
// }

import 'dart:math';
import 'package:flutter/material.dart';

class CoinToss extends StatefulWidget {
  @override
  State<CoinToss> createState() => _CoinTossState();
}

class _CoinTossState extends State<CoinToss>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isHeads = true;
  bool _isAnimating = false;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _animation = Tween(begin: 0.0, end: pi).animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _isAnimating = false;
            _isHeads = Random().nextBool();
          });
          _animationController.reset();
        }
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _startAnimation() {
    if (!_isAnimating) {
      setState(() {
        _isAnimating = true;
      });
      _animationController.forward();
    }
  }

  Widget _buildCoin() {
    return Transform(
      transform: Matrix4.rotationY(_animation.value),
      alignment: Alignment.center,
      child: Image.asset(
        _isHeads
            ? 'assets/hotel/coin_heads.png'
            : 'assets/hotel/coin_tails.png',
        width: 250,
        height: 250,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/coinback1.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Center(
            child: GestureDetector(
              onTap: _startAnimation,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(125),
                ),
                child: Center(
                  child: _isAnimating
                      ? _buildCoin()
                      : Text(
                          _isHeads ? 'Heads' : 'Tails',
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget makeInput({label, obscureText = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        TextField(
          obscureText: obscureText,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(0.3),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white.withOpacity(0.5),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
