import 'package:flutter/material.dart';
import 'package:tabar/view/cloudy.dart';
import 'package:tabar/view/mydata.dart';
import 'package:tabar/view/rainy.dart';
import 'package:tabar/view/sunny.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      routes: {
        MyData.routeName:(context) => const MyData(),
      },

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with  TickerProviderStateMixin  {
  
  
    late TabController _tabController;

    @override
    void initState() {
      super.initState();
      _tabController = TabController(length: 3, vsync: this);
    }
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        bottom: TabBar(
          controller: _tabController,
          onTap: (value) {
            setState(() {
              _tabController.index = value;
            });
          },
          tabs: [
          Tab(icon: Icon(Icons.cloud_outlined),),
          Tab(icon: Icon(Icons.beach_access_sharp),),
          Tab(icon: Icon(Icons.brightness_5_sharp),),
        ]),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Cloudy(),
          Rainy(),
          Sunny(),
        ],
      ),
    );
  }
}
