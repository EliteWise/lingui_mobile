import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lingui_mobile/widgets/message_cloud_painter.dart';

class MessageCloud extends StatelessWidget {
  final String message;

  const MessageCloud({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 100,
      child: CustomPaint(
        painter: MessageCloudPainter(color: Colors.lightBlue,
            gradient: const LinearGradient(
          colors: [Colors.pink, Colors.purple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
      ),
    );
  }
}