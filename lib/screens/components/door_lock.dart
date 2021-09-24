import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constanins.dart';

class DoorLock extends StatelessWidget {
  const DoorLock({
    Key? key,
    required this.press,
    required this.isLock,
  }) : super(key: key);

  final VoidCallback press;
  final bool isLock;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: AnimatedSwitcher(
        duration: defaultDuration,
        switchInCurve: Curves.easeInOutBack,
        transitionBuilder: (child, animation) => ScaleTransition(
          scale: animation,
          child: child,
        ),
        child: isLock
            ? SvgPicture.asset(
                "assets/icons/door_lock.svg",
                key: ValueKey("lock"),
              )
            : SvgPicture.asset(
                "assets/icons/door_unlock.svg",
                key: ValueKey("unlock"),
              ),
      ),
    );
  }
}
