import 'package:flutter/material.dart';
import 'package:portfolio/constants/constants.dart';

class SkillBar extends StatefulWidget {
  final String skill;
  final double percentage;
  final Color color;

  const SkillBar({
    required this.skill,
    required this.percentage,
    this.color = Colors.yellow,
    super.key,
  });

  @override
  State<SkillBar> createState() => _SkillBarState();
}

class _SkillBarState extends State<SkillBar> {
  double endValue = 0;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () { // wait for route animation
      setState(() => endValue = widget.percentage);
    });
  }
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: endValue),
      duration: const Duration(milliseconds: 900),
      builder: (context, value, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.skill, style: midText()),
                Text('${(value * 100).toInt()}%',style: midText(),),
              ],
            ),
            SizedBox(height: h * 0.01),
            LinearProgressIndicator(
              borderRadius: BorderRadius.circular(15),
              value: value,
              color: widget.color,
              backgroundColor: Colors.black,
              minHeight: h*0.007,
            ),
            SizedBox(height: h*0.01,)
          ],
        );

      },
    );
  }
}
