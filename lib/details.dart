import 'package:apicalling/model/service_model.dart';
import 'package:flutter/material.dart';

class ServicesDetailsScreen extends StatelessWidget {
  ServicesDetailsScreen({super.key, required this.datum});
  ReturnOrderModel datum;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: datum.data!.values.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  var data = datum.data!.values.toList()[index];
                  List<Datum> filterdata = data
                      .where((e) =>
                          e.serviceGroup!.np ==
                          'शिक्षा युवा र खेलकुद क्षेत्र सँग सम्बन्धित')
                      .toList();
                  print(filterdata.length);
                  return Card(
                    child: ListView.builder(
                        itemCount: filterdata.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Text(
                              filterdata[index].services!.en.toString());
                        }),
                  );
                })
          ],
        ),
      ),
    );
  }
}
