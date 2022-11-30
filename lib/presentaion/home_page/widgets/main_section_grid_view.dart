import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_test/application/home/home_bloc.dart';
import 'package:project_test/helpers/get_responsive_value.dart';
import 'package:project_test/res/colors.dart';
import 'package:project_test/res/constant.dart';

class MainSectionGirdView extends StatelessWidget {
  const MainSectionGirdView({
    Key? key,
    required this.screenWidth,
    required this.sectionList,
    required this.sectionName,
    required this.selectedIndex,
    required this.title,
  }) : super(key: key);

  final double screenWidth;
  final List sectionList;
  final SectionName sectionName;
  final int? selectedIndex;
  final String title;
  @override
  Widget build(BuildContext context) {
    final kPadding = screenWidth * 0.01;
    final isSubSection3 = sectionName == SectionName.subSection3;
    return SizedBox(
      height: screenWidth * 0.62,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: kPadding * 2),
            padding: EdgeInsets.symmetric(vertical: kPadding),
            color: primaryColor,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: getKFontSize(context), fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.builder(
                itemCount: sectionList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: kPadding,
                  crossAxisSpacing: kPadding,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () {
                      if (isSubSection3) {
                        Navigator.of(context).pushNamed('/cityDetails');
                      }
                    },
                    onTap: () {
                      switch (sectionName) {
                        case SectionName.mainSection:
                          context
                              .read<HomeBloc>()
                              .add(ChangeMainSectionEvent(index: index));
                          break;
                        case SectionName.subSection1:
                          context
                              .read<HomeBloc>()
                              .add(ChangeSubSection1Event(index: index));
                          break;
                        case SectionName.subSection2:
                          context
                              .read<HomeBloc>()
                              .add(ChangeSubSection2Event(index: index));
                          break;
                        default:
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        image: isSubSection3
                            ? const DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://www.iss.europa.eu/sites/default/files/styles/large_banner_image/public/city-5000648_1920%20banner.jpg?itok=2VD5CQf5?%3E'))
                            : null,
                        borderRadius: BorderRadius.circular(screenWidth * 0.02),
                        color: selectedIndex == index ? kBlue : kGrey,
                      ),
                      child: Align(
                        alignment: isSubSection3
                            ? Alignment.bottomCenter
                            : Alignment.centerLeft,
                        child: Text(
                          '${sectionList[index].name}',
                          style: TextStyle(
                              color: isSubSection3 ? Colors.white : kBlack),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
