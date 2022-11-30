import 'package:flutter/material.dart';
import 'package:project_test/res/colors.dart';

class CityDetails extends StatelessWidget {
  const CityDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: kBlack),
          bottom: const TabBar(
            labelColor: kBlack,
            tabs: [
              Tab(text: 'tab1'),
              Tab(text: 'tab2'),
              Tab(text: 'tab3'),
              Tab(text: 'tab4'),
              Tab(text: 'tab5'),
            ],
          ),
          title: const Text(
            'Tabs',
            style: TextStyle(color: kBlack),
          ),
        ),
        body: const TabBarView(
          children: [
            Text('Tab1'),
            Text('Tab2'),
            Text('Tab3'),
            Text('Tab4'),
            Text('Tab5'),
          ],
        ),
      ),
    );
  }
}
