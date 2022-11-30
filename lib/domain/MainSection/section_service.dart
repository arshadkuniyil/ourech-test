import 'model/main_section_model.dart';

abstract class SectionService {
  Future<List<MainSectionModel>> getSectionData();
}
