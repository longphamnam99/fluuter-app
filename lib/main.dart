import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my/constants.dart';
import 'package:my/models/post_model.dart';
import 'package:my/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: nameApp,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // home: const HomeScreen(title: "Home Losa"),
      home: SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFFEDF0F6),
          body: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      nameApp,
                      style: TextStyle(
                        fontFamily: "Billabong",
                        fontSize: 32.0,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        const IconButton(
                          onPressed: null,
                          icon: Icon(Icons.live_tv),
                          iconSize: 30.0,
                        ),
                        const SizedBox(
                          width: 16.0,
                        ),
                        Container(
                          width: 35.0,
                          child: const IconButton(
                            onPressed: null,
                            icon: Icon(Icons.send),
                            iconSize: 30.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              _TimeLine(stories),
              _PostNew(posts),
            ],
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 30.0,
                    color: Colors.black,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    size: 30.0,
                    color: Colors.grey,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_border,
                    size: 30.0,
                    color: Colors.grey,
                  ),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_outline,
                    size: 30.0,
                    color: Colors.grey,
                  ),
                  label: "",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TimeLine extends StatelessWidget {
  final List<String> posteds;

  const _TimeLine(
    // ignore: type_init_formals
    List<String> this.posteds, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: posteds.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return const SizedBox(width: 10.0);
            }
            return Container(
              margin: const EdgeInsets.all(10.0),
              width: 60.0,
              height: 60.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(0, 2),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: CircleAvatar(
                child: ClipOval(
                  child: Image(
                    width: 60.0,
                    height: 60.0,
                    image: AssetImage(posteds[index - 1]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _PostNew extends StatelessWidget {
  final List<PostModel> posteds;

  const _PostNew(
    // ignore: type_init_formals
    List<PostModel> this.posteds, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: posteds.length + 1,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return const SizedBox(width: 10.0);
        }
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 5.0,
          ),
          child: Container(
            width: double.infinity,
            height: 560.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Container(
                          width: 50.0,
                          height: 50.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black45,
                                offset: Offset(0, 2),
                                blurRadius: 6.0,
                              ),
                            ],
                          ),
                          child: CircleAvatar(
                            child: ClipOval(
                              child: Image(
                                width: 50.0,
                                height: 50.0,
                                image: AssetImage(
                                    posteds[index - 1].authorImageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          posteds[index - 1].authorName,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(posteds[index - 1].timeAgo),
                        trailing: const IconButton(
                          icon: Icon(Icons.more_horiz),
                          color: Colors.black,
                          onPressed: null,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        width: double.infinity,
                        height: 400.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black45,
                              offset: Offset(0, 5),
                              blurRadius: 8.0,
                            ),
                          ],
                          image: DecorationImage(
                            image: AssetImage(posteds[index - 1].imageUrl),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    const IconButton(
                                      onPressed: null,
                                      icon: Icon(Icons.favorite_border),
                                      iconSize: 30.0,
                                    ),
                                    Text(
                                      _formatNumber(Random().nextInt(100000)),
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 20.0,
                                ),
                                Row(
                                  children: <Widget>[
                                    IconButton(
                                      onPressed: () {
                                        //  Navigator.push(context, MaterialPageRoute(builder: () => PostScreen(),),)
                                      },
                                      icon:
                                          const Icon(Icons.chat_bubble_outline),
                                      iconSize: 30.0,
                                    ),
                                    Text(
                                      _formatNumber(Random().nextInt(60000)),
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const IconButton(
                              onPressed: null,
                              icon: Icon(Icons.bookmark),
                              iconSize: 30.0,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

String _formatNumber(int intValue) {
  String formattedValue = intValue.toString();

  if (intValue >= 10000) {
    int integerPart = intValue ~/ 1000;
    int decimalPart = intValue % 1000;

    String decimalPartString = decimalPart.toString().padLeft(3, '0');
    formattedValue = '$integerPart,$decimalPartString';
  }

  return formattedValue;
}
