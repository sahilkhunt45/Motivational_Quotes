import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';
import '../../helper/helper.dart';

class HappyQuotes extends StatefulWidget {
  const HappyQuotes({Key? key}) : super(key: key);

  @override
  State<HappyQuotes> createState() => _HappyQuotesState();
}

class _HappyQuotesState extends State<HappyQuotes> {
  bool star = false;
  int r = Random().nextInt(30) + 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () async {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('star');
            },
            icon: const Icon(
              Icons.bookmark,
              color: Colors.black,
            ),
          ),
        ],
        title: const Text(
          "Happiness",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: FutureBuilder(
        future: QuotesDBHelper.quotesDBHelper.fetchAllQuotesData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<Map<String, dynamic>> data = snapshot.data;

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, i) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      height: 420,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/${i + r}.jpg"),
                          fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "“${data[i]['id']}”",
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 70,
                      width: double.infinity,
                      margin: const EdgeInsets.only(left: 10, right: 10),
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 7.0,
                          ),
                        ],
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed('zoom', arguments: data[i]);
                            },
                            icon: const Icon(
                              Icons.image_search,
                              color: Colors.orange,
                              size: 35,
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              await Clipboard.setData(
                                ClipboardData(
                                  text: "Quote:- ${data[i]['id']}",
                                ),
                              );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  backgroundColor: Colors.blueAccent,
                                  content: Text("Quote Copy Successfully.."),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.collections_bookmark_sharp,
                              color: Colors.blue,
                              size: 35,
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              await Share.share("${data[i]['id']}");
                            },
                            icon: const Icon(
                              Icons.share,
                              color: Colors.red,
                              size: 35,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                star = !star;
                              });
                              (star == true)
                                  ? ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.yellow,
                                        content: Text(
                                          "Add in your favorites..",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    )
                                  : ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: Colors.yellow,
                                        content: Text(
                                          "Remove to in your favorites..",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    );
                            },
                            icon: (star == true)
                                ? const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 35,
                                  )
                                : const Icon(
                                    Icons.star_border,
                                    color: Colors.yellow,
                                    size: 35,
                                  ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.black,
            ),
          );
        },
      ),
    );
  }
}

class ZoomPage extends StatefulWidget {
  const ZoomPage({Key? key}) : super(key: key);

  @override
  State<ZoomPage> createState() => _ZoomPageState();
}

class _ZoomPageState extends State<ZoomPage> {
  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 13),
            alignment: Alignment.center,
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1524293568345-75d62c3664f7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGhhcHB5JTIwcXVvdGVzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                  Colors.pinkAccent,
                  BlendMode.softLight,
                ),
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                "“${res['id']}”",
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 7.0,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xff252525),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(
                  Icons.image_search,
                  color: Colors.orange,
                  size: 35,
                ),
                IconButton(
                  onPressed: () async {
                    await Clipboard.setData(
                      ClipboardData(
                        text: "Quote:- ${res['id']}",
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.green,
                        content: Text(
                          "Quote Copy Successfully..",
                        ),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.collections_bookmark_sharp,
                    color: Colors.blue,
                    size: 35,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await Share.share("${res['id']}");
                  },
                  icon: const Icon(
                    Icons.share,
                    color: Colors.red,
                    size: 35,
                  ),
                ),
                const Icon(
                  Icons.star_border,
                  color: Colors.yellow,
                  size: 35,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Star extends StatefulWidget {
  const Star({Key? key}) : super(key: key);

  @override
  State<Star> createState() => _StarState();
}

class _StarState extends State<Star> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () async {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
        title: const Text(
          "Happiness",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 10, right: 10),
            height: 520,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://images.unsplash.com/photo-1524293568345-75d62c3664f7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGhhcHB5JTIwcXVvdGVzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                  Colors.pinkAccent,
                  BlendMode.softLight,
                ),
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: const Center(
              child: Text(
                "“Most folks are as happy as they make up their minds to be.”",
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            height: 70,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 7.0,
                ),
              ],
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(
                  Icons.image_search,
                  color: Colors.orange,
                  size: 35,
                ),
                Icon(
                  Icons.collections_bookmark_sharp,
                  color: Colors.blue,
                  size: 35,
                ),
                Icon(
                  Icons.share,
                  color: Colors.red,
                  size: 35,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 35,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
