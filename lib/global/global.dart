import 'package:flutter/material.dart';

class Global {
  static List<Map<String, dynamic>> randomImage = [
    {'image': 'assets/images/1.jpg'},
    {'image': 'assets/images/2.jpg'},
    {'image': 'assets/images/3.jpg'},
    {'image': 'assets/images/4.jpg'},
    {'image': 'assets/images/5.jpg'},
    {'image': 'assets/images/6.jpg'},
    {'image': 'assets/images/7.jpg'},
    {'image': 'assets/images/8.jpg'},
    {'image': 'assets/images/9.jpg'},
    {'image': 'assets/images/10.jpg'},
    {'image': 'assets/images/11.jpg'},
    {'image': 'assets/images/12.jpg'},
    {'image': 'assets/images/13.jpg'},
  ]..shuffle();
  static List<Map<String, dynamic>> all = [];
  static List<Map<String, dynamic>> lifeQuotes = [];
  static List<Map<String, dynamic>> loveQuotes = [];
  static List<Map<String, dynamic>> successQuotes = [];
//-------------------------------------------------------
  static List<Map<String, dynamic>> authorQuotes1 = [];
  static List<Map<String, dynamic>> authorQuotes2 = [];
  static List<Map<String, dynamic>> authorQuotes3 = [];
  static List<Map<String, dynamic>> authorQuotes4 = [];
//-------------------------------------------------------
  static List<Map> neqQuotes = [
    {
      "quotes": "Life itself is the most \n wonderful fairy tale.",
      "images":
          "https://images.unsplash.com/photo-1494959764136-6be9eb3c261e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    },
    {
      "quotes": "Life is a long lesson in humility.",
      "images":
          "https://images.unsplash.com/photo-1508558936510-0af1e3cccbab?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    },
    {
      "quotes": "Only a life lived for others \n is a life worthwhile",
      "images":
          "https://images.unsplash.com/photo-1470071459604-3b5ec3a7fe05?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bmF0dXJlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    },
    {
      "quotes": "May you live all the days \n of your life.",
      "images":
          "https://images.unsplash.com/photo-1441974231531-c6227db76b6e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8bmF0dXJlfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60",
    },
    {
      "quotes": "The purpose of our lives \n is to be happy.",
      "images":
          "https://images.unsplash.com/photo-1475924156734-496f6cac6ec1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fG5hdHVyZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60",
    },
  ];

  static List<Map> buttons = [
    {
      "Icon": Icons.apps_sharp,
      "Text": "Categories",
      "Color": const Color(0xffa85486),
    },
    {
      "Icon": Icons.image_outlined,
      "Text": "Pic Quotes",
      "Color": const Color(0xff7487cc),
    },
    {
      "Icon": Icons.settings_suggest_outlined,
      "Text": "Latest Quotes",
      "Color": const Color(0xffb89041),
    },
    {
      "Icon": Icons.menu_book_sharp,
      "Text": "Articles",
      "Color": const Color(0xff6b9d77),
    },
  ];

  static List<Color> colors = [
    Colors.amber,
    Colors.orange,
    Colors.blueAccent,
    const Color(0xffb89041),
    const Color(0xff6b9d77),
    const Color(0xffa85486),
    Colors.green,
    Colors.teal,
    const Color(0xff7487cc),
  ]..shuffle();

  static List<String> splashscreenQuote = [
    "You can get everything in life you want if you will just help enough other people get what they want",
    "Inspiration does exist, but it must find you working",
    "Don't settle for average",
    "Show up, show up, show up, and after a while the muse shows up, too",
    "If there is no struggle, there is no progress",
    "Develop success from failures. Discouragement and failure are two of the surest stepping stones to success",
    "More is lost by indecision than wrong decision",
    "Keep a little fire burning; however small, however hidden",
    "Never let success get to your head and never let failure get to your heart",
  ]..shuffle();
}
