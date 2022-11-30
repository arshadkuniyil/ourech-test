import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_test/domain/MainSection/model/main_section_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    List<MainSectionModel> mainSectionList = [];
    List<MainSectionModel> subSection1List = [];
    List<MainSectionModel> subSection2List = [];
    List<MainSectionModel> subSection3List = [];

    int mainSectionSelectedValue = -1;
    int subSection1SelectedValue = -1;
    int subSection2SelectedValue = -1;
  

    on<HomeInitialEvent>((event, emit) {
      mainSectionList = List.generate(5,
          (index) => MainSectionModel(id: '$index', name: 'continents$index'));
      emit(HomeState(
        mainSectionList: mainSectionList,
        mainSectionSelectedValue: null,
        subSection1SelectedValue: null,
        subSection2SelectedValue: null,
        subSection1List: subSection1List,
        subSection2List: [],
        subSection3List: [],
      ));
    });
    on<ChangeMainSectionEvent>((event, emit) {
      mainSectionSelectedValue = event.index;

      subSection1List = List.generate(
          5,
          (index) => MainSectionModel(
              id: '$index',
              name: 'conti$mainSectionSelectedValue country$index'));

      emit(HomeState(
        mainSectionList: mainSectionList,
        mainSectionSelectedValue: mainSectionSelectedValue,
        subSection1SelectedValue: null,
        subSection2SelectedValue: null,
        subSection1List: subSection1List,
        subSection2List: [],
        subSection3List: [],
      ));
    });
    on<ChangeSubSection1Event>((event, emit) {
      subSection1SelectedValue = event.index;
      subSection2List = List.generate(
          10,
          (index) => MainSectionModel(
              id: '$index',
              name:
                  'conti$mainSectionSelectedValue country$subSection1SelectedValue state$index'));

      emit(HomeState(
        mainSectionList: mainSectionList,
        mainSectionSelectedValue: mainSectionSelectedValue,
        subSection1SelectedValue: subSection1SelectedValue,
        subSection2SelectedValue: null,
        subSection1List: subSection1List,
        subSection2List: subSection2List,
        subSection3List: [],
      ));
    });

    on<ChangeSubSection2Event>((event, emit) {
      subSection2SelectedValue = event.index;
      subSection3List = List.generate(
          12,
          (index) => MainSectionModel(
              id: '$index',
              name:
                  'conti$mainSectionSelectedValue country$subSection1SelectedValue state$subSection2SelectedValue city$index'));

      emit(HomeState(
        mainSectionList: mainSectionList,
        mainSectionSelectedValue: mainSectionSelectedValue,
        subSection1SelectedValue: subSection1SelectedValue,
        subSection2SelectedValue: subSection2SelectedValue,
        subSection1List: subSection1List,
        subSection2List: subSection2List,
        subSection3List: subSection3List,
      ));
    });
  }
}
