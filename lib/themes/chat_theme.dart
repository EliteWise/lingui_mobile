import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

class LinguiChatTheme extends DefaultChatTheme {
  const LinguiChatTheme({
    super.backgroundColor = const Color(0xFFFFF8E1), // Ambre clair
    super.dateDividerTextStyle = const TextStyle(
      color: Color(0xFF795548), // Ambre foncé
      fontSize: 12,
      fontWeight: FontWeight.w800,
      height: 1.333,
    ),
    super.emptyChatPlaceholderTextStyle = const TextStyle(
      color: Color(0xFF795548), // Ambre moyen
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),
    super.errorColor = const Color(0xFFFF5252), // Rouge clair pour les erreurs
    super.inputBackgroundColor = const Color(0xFFFFECB3), // Ambre plus doux
    super.primaryColor = const Color(0xFFFFECB3), // Ambre foncé
    super.receivedMessageBodyTextStyle = const TextStyle(
      color: Color(0xFF795548), // Marron
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),
    super.sentMessageBodyTextStyle = const TextStyle(
      color: Color(0xFF795548), // Marron
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),
    super.secondaryColor = const Color(0xFFFFD54F), // Ambre plus clair pour les messages reçus
    super.systemMessageTheme = const SystemMessageTheme(
      margin: EdgeInsets.only(
        bottom: 24,
        top: 8,
        left: 8,
        right: 8,
      ),
      textStyle: TextStyle(
        color: Color(0xFFFFA000), // Ambre moyen
        fontSize: 12,
        fontWeight: FontWeight.w800,
        height: 1.333,
      ),
    ),
    super.typingIndicatorTheme = const TypingIndicatorTheme(
      animatedCirclesColor: Color(0xFFFFC107), // Ambre foncé
      animatedCircleSize: 5.0,
      bubbleBorder: BorderRadius.all(Radius.circular(27.0)),
      bubbleColor: Color(0xFFFFE082), // Ambre clair
      countAvatarColor: Color(0xFFFFC107), // Ambre foncé
      countTextColor: Color(0xFFFFD54F), // Ambre plus clair
      multipleUserTextStyle: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Color(0xFFFFA000), // Ambre moyen
      ),
    ),
    super.unreadHeaderTheme = const UnreadHeaderTheme(
      color: Color(0xFFFFD54F), // Ambre plus clair
      textStyle: TextStyle(
        color: Color(0xFF795548), // Marron
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.333,
      ),
    ),
    super.inputTextColor = const Color(0xFF795548),
    super.sendButtonIcon = const Icon(Icons.near_me, color: Color(0xFF795548), size: 25),
  });
}
