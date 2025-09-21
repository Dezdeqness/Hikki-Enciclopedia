import 'package:hikki_enciclopedia/domain/model/personal_list_type.dart';
import 'package:hikki_enciclopedia/domain/model/personal_page_type.dart';

class PersonalTabArgs {
  final PersonalPageType type;
  final PersonalListType listType;

  PersonalTabArgs(this.type, this.listType);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonalTabArgs &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          listType == other.listType;

  @override
  int get hashCode => type.hashCode ^ listType.hashCode;
}
