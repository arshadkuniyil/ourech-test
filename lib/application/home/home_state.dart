part of 'home_bloc.dart';

class HomeState {
  final int? mainSectionSelectedValue;
  final int? subSection1SelectedValue;
  final int? subSection2SelectedValue;
  
  final List<MainSectionModel> mainSectionList;
  final List<MainSectionModel> subSection1List;
  final List<MainSectionModel> subSection2List;
  final List<MainSectionModel> subSection3List;
  HomeState(
     {
    required this.subSection1List,
    required this.mainSectionList,
    required this.subSection2List,
    required this.subSection3List,
    required this.mainSectionSelectedValue,
    required this.subSection1SelectedValue,
    required this.subSection2SelectedValue,
   
  });
}

class HomeInitial extends HomeState {
  HomeInitial()
      : super(
          mainSectionList: [],
          subSection1List: [],
          subSection2List: [],
          subSection3List: [],
          mainSectionSelectedValue: null,
          subSection1SelectedValue: null,
          subSection2SelectedValue: null,
       
        );
}
