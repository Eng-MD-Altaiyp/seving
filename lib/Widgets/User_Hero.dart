import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phlox_animations/phlox_animations.dart';
import '../Models/Models_And_Classes/Colors.dart';




class User_Hero extends StatefulWidget {
  const User_Hero({super.key});

  @override
  State<User_Hero> createState() => _User_HeroState();
}

class _User_HeroState extends State<User_Hero> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 1,
            child: PhloxAnimations(
              duration: const Duration(milliseconds:  150),
              fromOpacity: 0.1,
              fromScale: 0.5,
              child: Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/me_2.JPG'),
                      fit: BoxFit.fill,
                    )),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.center,
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: PhloxAnimations(
                  duration: const Duration(milliseconds: 300),
                  fromOpacity: 0.1,
                  fromY: 150,
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: SvgPicture.asset(
                      'assets/icons/close-circle.svg',
                      color: primary300,
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
}