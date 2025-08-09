import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class Controller extends GetxController {
  RxDouble blurRadius = (5.0).obs;

  void openWebUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, webOnlyWindowName: '_blank');
    } else {
      GetSnackBar(message: "Cannot Visit $url\n Something went wrong!");
    }
  }

  List projects = [
    {
      "title": "Ecomerce App",
      "description": """
Built a modern e-commerce app with Flutter, Firebase, and Cloudinary. Focused on electronics,
it offers smart search, categorized browsing, cart, and favorites. Uses Provider for state 
management and features a clean UI/UX.
  """,
      "gitHuburl": "https://github.com/Zahid275/Ecomerce-App",
      "video_url":
          "https://drive.google.com/file/d/1-XmM3QbDgNnqVNKZwVd9gvxcpkHFjKUf/view?usp=drive_link",
      "isHovered": false.obs,
    },
    {
      "title": "Chatting App",
      "description": """
Built a real-time chat app with Flutter using Firebase Firestore, Auth, FCM, and Cloudinary. 
Features include a clean UI/UX, MVC architecture, and GetX for state management. 
  """,
      "gitHuburl": "https://github.com/Zahid275/Chatting-App",
      "video_url":
          "https://drive.google.com/file/d/1-2e_kGf0h57BglNK9LY4Dz95Pc1Me0mh/view?usp=drive_link",
      "isHovered": false.obs,
    },
    {
      "title": "Movie App",
      "description": """
Built a Flutter movie app using TMDB APIs, with search, "Watch Later" list, and user auth via 
Firebase. Uses Firestore for data storage, GetX for state management, and follows the MVC 
pattern.
  """,
      "gitHuburl": "https://github.com/Zahid275/Movie-App-",
      "video_url":
          "https://drive.google.com/file/d/1-4G_jmMOC2FDmBO0HsIMrZjFt4Nltgma/view?usp=drive_link",
      "isHovered": false.obs,
    },
    {
      "title": "AI CHAT BOT",
      "description": """
An AI-powered chat bot built with Flutter using Google Gemini Flash 2.0 API. It features a 
beautiful UI, user-friendly UX, and delivers fast response times. The app follows the MVC 
pattern and uses GetX for state management.
  """,
      "gitHuburl": "https://github.com/Zahid275/CHAT-BOT",
      "video_url":
          "https://drive.google.com/file/d/1Gm6S45YE14WiflZNZ3xSeecZXPf2Lldt/view?usp=drive_link",
      "isHovered": false.obs,
    },
    {
      "title": "Music Player App",
      "description": """
Melodia is a sleek Flutter-based music player with background playback,
notification controls, local favorites using Hive, and light/dark theme support.
  """,
      "gitHuburl": "https://github.com/Zahid275/Music-Player-App-",
      "isHovered": false.obs,
    },
    {
      "title": "Fast Food App",
      "description": """
A simple Flutter restaurant app showcasing menu items (name, price, rating). Users can search, manage favorites, and add items to the cart. Built to improve Flutter skills with Provider for state management. Features Menu,
Search, Cart, Favorites Clean UI Provider for stateTech Flutter, Provider
  """,
      "gitHuburl": "https://github.com/Zahid275/Fast_Food_App",
      "isHovered": false.obs,
    },
    {
      "title": "Weather App",
      "description": """
A modern and visually appealing Weather App that provides real-time weather updates for any location. Built with Flutter and GetX,
this app integrates with a weather API to deliver accurate and up-to-date information.
  """,
      "gitHuburl": "https://github.com/Zahid275/Weather-App",
      "isHovered": false.obs,
    },
    {
      "title": "Animals App",
      "description": """
This is a flutter project of an animal app in which you will get to know about facts and informations 
about different animals and also you can hear their actual sound.
  """,
      "gitHuburl": "https://github.com/Zahid275/Animals-App",
      "isHovered": false.obs,
    },
    {
      "title": "Todo App",
      "description": """
A simple and efficient To-Do app built with Flutter and Hive for local storage. This app allows users to add, update, delete, 
and persist tasks, ensuring a smooth and organized task management experience.
  """,
      "gitHuburl": "https://github.com/Zahid275/ToDO-App",
      "isHovered": false.obs,
    },
  ];
}
