import 'package:flutter/material.dart';
  List animationList = [
    'Text 1',
    'Text 12',
    'Text 13',
    'Text 14',
    'Text 15',
    'Text 16',
    'Text 17',
    'Text 1',
    'Text 1',
    'Text 1',
    'Text 1',
    'Text 1',
  ];

class ListViewAnimationOne extends StatefulWidget {
  const ListViewAnimationOne({super.key});

  @override
  State<ListViewAnimationOne> createState() => _ListViewAnimationOneState();
}

class _ListViewAnimationOneState extends State<ListViewAnimationOne> {
List animate = animationList;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: AnimatedList(
          itemBuilder: (_, i, animation) => SizeTransition(
            sizeFactor: animation,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: GestureDetector(
                onTap: () {
                  animate.removeAt(i);
                  setState(() {});
                },
                child: Container(
                  color: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  alignment: Alignment.center,
                  child: Text(
                    animationList[i],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          initialItemCount: animate.length,
        ),
      ),
    );
  }
}
