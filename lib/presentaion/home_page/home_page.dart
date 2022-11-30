import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_test/application/home/home_bloc.dart';
import 'package:project_test/helpers/get_responsive_value.dart';
import 'package:project_test/res/colors.dart';
import 'package:project_test/res/constant.dart';

import 'widgets/date_container.dart';
import 'widgets/main_section_grid_view.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final ValueNotifier<int?> mainSectionSelectedValue = ValueNotifier(null);
  final ValueNotifier<int?> subSection1SelectedValue = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    final screenWidth = getScreenWidth(context);

    final DateTime dateToday = DateTime.now();
    final String date = dateToday.toString().substring(0, 10);
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kBlack),
        titleSpacing: 0.0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Heading1',
              style: TextStyle(fontSize: getKFontSize(context), color: kBlack),
            ),
            Text(
              'Heading2',
              style: TextStyle(
                  fontSize: screenWidth * 0.03,
                  color: kBlack,
                  fontWeight: FontWeight.w400),
            )
          ],
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {},
            itemBuilder: (BuildContext context) {
              return List.generate(
                  2,
                  (index) => PopupMenuItem<String>(
                        value: 'MenuItem$index',
                        child: Text('MenuItem$index'),
                      ));
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(screenWidth, screenWidth * .1),
          child: DateContainer(screenWidth: screenWidth, date: date),
        ),
        shadowColor: Colors.transparent,
      ),
      body: SafeArea(
          child: Column(
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Expanded(
                  child: Scrollbar(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    MainSectionGirdView(
                      screenWidth: screenWidth,
                      sectionList: state.mainSectionList,
                      sectionName: SectionName.mainSection,
                      selectedIndex: state.mainSectionSelectedValue,
                      title: 'Main section',
                    ),
                    MainSectionGirdView(
                      screenWidth: screenWidth,
                      sectionList: state.subSection1List,
                      sectionName: SectionName.subSection1,
                      selectedIndex: state.subSection1SelectedValue,
                      title: 'Sub Section 1',
                    ),
                    MainSectionGirdView(
                      screenWidth: screenWidth,
                      sectionList: state.subSection2List,
                      sectionName: SectionName.subSection2,
                      selectedIndex: state.subSection2SelectedValue,
                      title: 'Sub Section 2',
                    ),
                    MainSectionGirdView(
                      screenWidth: screenWidth,
                      sectionList: state.subSection3List,
                      sectionName: SectionName.subSection3,
                      selectedIndex: -1,
                      title: 'Sub Section 3',
                    ),
                  ],
                ),
              ));
            },
          )
        ],
      )),
    );
  }
}
