import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Remittancedashboard extends StatefulWidget {
  const Remittancedashboard({Key? key}) : super(key: key);

  @override
  State<Remittancedashboard> createState() => _RemittancedashboardState();
}

class _RemittancedashboardState extends State<Remittancedashboard> {
  int cancelledCount = 0;
  int claimedCount = 0;
  int pendingCount = 0;
  int sentCount = 0;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse('https://sit-api-janus.fortress-asya.com:1234/get_remittancestatus'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          final cancelledCountString = data['data'][0]['CANCELLED'].toString();
          cancelledCount = int.parse(cancelledCountString);
          final claimedCountString = data['data'][0]['CLAIMED'].toString();
          claimedCount = int.parse(claimedCountString);
          final pendingCountString = data['data'][0]['PENDING'].toString();
          pendingCount = int.parse(pendingCountString);
          final sentCountString = data['data'][0]['SENT'].toString();
          sentCount = int.parse(sentCountString);
        });
      } else {
        print('API request failed with status code ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred while fetching counts: $e');
    }
  }

  void navigateToDetailsScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int totalCount = cancelledCount + claimedCount + pendingCount + sentCount;

    return Container(
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(child: buildStatusButton(context, 'PENDING', pendingCount)),
              Container(child: buildStatusButton(context, 'CANCELLED', cancelledCount)),
              Container(child: buildStatusButton(context, 'CLAIMED', claimedCount)),
              Container(child: buildStatusButton(context, 'SENT', sentCount)),
           SizedBox(
             height: 250.0,
             width: 180.0,
             child:Card(
             color: Colors.blueGrey,
             child: InkWell(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   const Text(
                     'TOTAL',
                     style: TextStyle(
                       color: Colors.white,
                     ),
                   ),
                   const Icon(
                     Icons.add,
                     color: Colors.white,
                     size: 30.0,
                   ),
                   Text(
                     '$totalCount',
                     style: const TextStyle(
                       color: Colors.white,fontSize: 35,fontWeight:FontWeight.w900
                     ),

                   ),
                   const SizedBox(height: 4.0),
                   GestureDetector(
                     child: const Text(
                       'All Total',
                       style: TextStyle(
                         color: Colors.white,
                       ),
                     ),
                   ),
                 ],
               ),
             ),
           ),)
            ],
          ),
        ],
      ),
    );
  }


  Widget buildStatusButton(BuildContext context, String label, int count) {
    Color cardColor;

    switch (label) {
      case 'CANCELLED':
        cardColor = Colors.red;
        break;
      case 'PENDING':
        cardColor = Colors.orange;
        break;
      case 'SENT':
        cardColor = Colors.green;
        break;
      case 'CLAIMED':
        cardColor = Colors.white30;
        break;
      default:
        cardColor = Colors.orange;
    }

    return SizedBox(
      height: 250.0,
      width: 180.0,
      child: Card(
        color: cardColor,
        child: InkWell(
          onTap: () => navigateToDetailsScreen(context),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,fontWeight: FontWeight.w900,fontSize: 28
                ),
              ),
              const Icon(
                Icons.remove_circle_outline,
                color: Colors.white,
                size: 30.0,
              ),
              Text(
                '$count',
                style: const TextStyle(
                  color: Colors.white,fontWeight: FontWeight.w900,fontSize: 35
                ),
              ),
              const SizedBox(height: 4.0),
              GestureDetector(
                onTap: () => navigateToDetailsScreen(context),
                child: const Text(
                  'DETAILS',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Screen'),
      ),
      body: const Center(
        child: Text('Details Screen Content'),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Remittancedashboard(),
  ));
}
