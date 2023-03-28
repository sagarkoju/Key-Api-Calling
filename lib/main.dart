import 'dart:convert';

import 'package:apicalling/model/service_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marquee/marquee.dart';
import 'package:text_scroll/text_scroll.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ReturnOrderModel> datas = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Calling'),
      ),
      body: SizedBox(
        height: double.infinity,
        child: Row(
          children: [
            Expanded(
              child: FutureBuilder<ReturnOrderModel>(
                  future: getData(),
                  builder: ((context, snapshot) {
                    if (snapshot.hasData) {
                      final dataList = snapshot.data;
                      final textList =
                          dataList!.data!.entries.map((e) => e.key).toList();

                      return ListView.builder(
                        itemCount: textList.length,
                        itemBuilder: (context, index) {
                          var data = textList[index];
                          return Card(
                            child: Container(
                                height: 50,
                                width: double.infinity,
                                // margin: const EdgeInsets.only(bottom: 10),
                                // padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    border: Border.all(
                                        color: Colors.grey.shade300,
                                        width: 0.5),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 2,
                                          offset: Offset(0, 1))
                                    ],
                                    borderRadius: BorderRadius.circular(5)),
                                child: ListTile(
                                  leading: const SizedBox(),
                                  onTap: () {},
                                  title: Text(
                                    data,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                )),
                          );
                        },
                      );
                    } else {
                      return const CircularProgressIndicator();
                    }
                  })),
            ),
          ],
        ),
      ),
    );
  }

  Future<ReturnOrderModel> getData() async {
    final response = await http
        .get(Uri.parse('https://sushaasan.amritsparsha.com/api/civil'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ReturnOrderModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }
}
