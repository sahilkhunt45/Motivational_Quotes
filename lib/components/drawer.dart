import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left: 10, top: 30),
              width: double.infinity,
              color: Colors.green,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Life Quotes and Sayings",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 12,
            child: Column(
              children: const [
                ListTile(
                  leading: Icon(
                    Icons.topic,
                    color: Colors.orange,
                    size: 30,
                  ),
                  title: Text("By Topic"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.person_rounded,
                    color: Colors.blue,
                    size: 30,
                  ),
                  title: Text("By Author"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 30,
                  ),
                  title: Text("Favourite"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.lightbulb,
                    color: Colors.yellow,
                    size: 30,
                  ),
                  title: Text("Quotes of the Day"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.ondemand_video_sharp,
                    color: Colors.red,
                    size: 30,
                  ),
                  title: Text("Quotes of the Day"),
                ),
                Divider(),
                ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.grey,
                    size: 30,
                  ),
                  title: Text("Settings"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.share,
                    color: Colors.grey,
                    size: 30,
                  ),
                  title: Text("Share"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.rate_review_rounded,
                    color: Colors.grey,
                    size: 30,
                  ),
                  title: Text("Rate"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.feedback,
                    color: Colors.grey,
                    size: 30,
                  ),
                  title: Text("FeedBack"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.app_registration_sharp,
                    color: Colors.grey,
                    size: 30,
                  ),
                  title: Text("Our other apps"),
                ),
                ListTile(
                  leading: Icon(
                    Icons.error_outline,
                    color: Colors.grey,
                    size: 30,
                  ),
                  title: Text("About"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
