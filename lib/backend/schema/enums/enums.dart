import 'package:collection/collection.dart';

enum UserProfile {
  email,
  userID,
  displayName,
  photoURL,
  phoneNumber,
  emailValidate,
  idTokenJWT,
}

enum MenuItems {
  Dashboard,
  Devices,
  Configuration,
  TOU,
  TimeBands,
  SpecialDays,
  Seasons,
  Events,
  ProductSettings,
  Security,
}

enum Idseason {
  Id,
}

enum FileType {
  CSV,
  JSON,
  EXCEL,
  PDF,
}

enum CellType {
  text,
  number,
}

enum Crud {
  create,
  update,
  delete,
  view,
}

enum Flag {
  Add,
  Update,
  Delete,
  View,
}

enum Month {
  Jan,
  Feb,
  Mar,
  Apr,
  May,
  Jun,
  Jul,
  Aug,
  Sep,
  Oct,
  Nov,
  Dec,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (UserProfile):
      return UserProfile.values.deserialize(value) as T?;
    case (MenuItems):
      return MenuItems.values.deserialize(value) as T?;
    case (Idseason):
      return Idseason.values.deserialize(value) as T?;
    case (FileType):
      return FileType.values.deserialize(value) as T?;
    case (CellType):
      return CellType.values.deserialize(value) as T?;
    case (Crud):
      return Crud.values.deserialize(value) as T?;
    case (Flag):
      return Flag.values.deserialize(value) as T?;
    case (Month):
      return Month.values.deserialize(value) as T?;
    default:
      return null;
  }
}
