import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/constats/colors.dart' as AppColors;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  List<dynamic> popularvideos = [
    {"rating": "4.9", "name": "Java lec 1", "image": "assets/images/java.png"},
    {
      "rating": "4.9",
      "name": "dsjfsfdsf",
      "image": "assets/images/database.jpg"
    },
    {"rating": "4.9", "name": "C++ lec 1", "image": "assets/images/cpp.png"},
  ];

  List<dynamic> popularbox = [
    {"rating": "4.9", "name": "Java lec 1", "image": "assets/images/java.png"},
    {
      "rating": "4.9",
      "name": "Database Lec 1",
      "image": "assets/images/database.jpg"
    },
    {"rating": "4.9", "name": "C++ lec 1", "image": "assets/images/cpp.png"},
    {"rating": "4.9", "name": "Java lec 2", "image": "assets/images/java.png"},
    {
      "rating": "4.9",
      "name": "Database lec 2",
      "image": "assets/images/database.jpg"
    },
    {"rating": "4.9", "name": "C++ lec2", "image": "assets/images/cpp.png"},
    {"rating": "4.9", "name": "Java lec3", "image": "assets/images/java.png"},
    {
      "rating": "4.9",
      "name": "Data base lec3 ",
      "image": "assets/images/database.jpg"
    },
    {"rating": "4.9", "name": "C++ lec 3", "image": "assets/images/cpp.png"}, {"rating": "4.9", "name": "dsjfsfdsf", "image": "assets/images/java.png"},
    {
      "rating": "4.9",
      "name": "dsjfsfdsf",
      "image": "assets/images/database.jpg"
    },
    {"rating": "4.9", "name": "dsjfsfdsf", "image": "assets/images/cpp.png"},
  ];
  late ScrollController _scrollController;
  late TabController _tabController;

  ReadData() async {
    try {
      await DefaultAssetBundle.of(context)
          .loadString("assets/json/popularvideos.json")
          .then((s) {
        setState(() {
          popularvideos = json.decode(s);
        });
      });
    } catch (e) {
      print("Error loading JSON: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollController = ScrollController();
    ReadData();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.menu),
            actions: [
              Icon(Icons.search_rounded),
              Icon(CupertinoIcons.bell_solid)
            ],
          ),
          body: Column(
            children: [
              Center(
                child: Container(
                  child: Text(
                    "Popular Books",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
              Container(
                height: 180,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 180,
                        child: PageView.builder(
                          controller: PageController(viewportFraction: 0.8),
                          itemCount: popularvideos.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              height: 180,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage(popularvideos[index]["image"]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _tabController.animateTo(0);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                      ),
                      child: Text('New', style: TextStyle(color: Colors.white)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _tabController.animateTo(1);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: Text('Popular', style: TextStyle(color: Colors.white)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _tabController.animateTo(2);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Text('Trending', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ListView.builder(
                      controller: _scrollController,
                      itemCount: popularbox.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.tabVarViewcolor,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2,
                                  offset: Offset(0, 0),
                                  color: Colors.grey.withOpacity(0.2),
                                )
                              ],
                            ),
                            child: Container(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Container(
                                    height: 120,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(popularbox[index]["image"]),
                                          fit: BoxFit.cover
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(CupertinoIcons.star_fill, color: Colors.amberAccent),
                                          Text(popularbox[index]["rating"]),
                                        ],
                                      ),
                                      Text(popularbox[index]["name"]),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),3
                    ListView.builder(
                      controller: _scrollController,
                      itemCount: popularbox.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.tabVarViewcolor,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2,
                                  offset: 2Offset(0, 0),
                                  color: Colors.grey.withOpacity(0.2),
                                )
                              ],
                            ),
                            child: Container(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Container(
                                    height: 120,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: AssetImage(popularbox[index]["image"]),
                                        fit: BoxFit.cover
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(CupertinoIcons.star_fill, color: Colors.amberAccent),
                                          Text(popularbox[index]["rating"]),
                                        ],
                                      ),
                                      Text(popularbox[index]["name"]),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    ListView.builder(
                      controller: _scrollController,
                      itemCount: popularbox.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.tabVarViewcolor,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 2,
                                  offset: Offset(0, 0),
                                  color: Colors.grey.withOpacity(0.2),
                                )
                              ],
                            ),
                            child: Container(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Container(
                                    height: 120,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: AssetImage(popularbox[index]["image"]),
                                        fit: BoxFit.cover
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(CupertinoIcons.star_fill, color: Colors.amberAccent),
                                          Text(popularbox[index]["rating"]),
                                        ],
                                      ),
                                      Text(popularbox[index]["name"]),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}