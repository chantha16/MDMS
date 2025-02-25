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
  DevicesGroup,
  Configuration,
  Schedule,
  TOU,
  TimeBands,
  Site,
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
  AddSub,
  AddTo,
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

enum Intervals {
  Daily,
  Weekly,
  Monthly,
}

enum Day {
  Sun,
  Mon,
  Tue,
  Wed,
  Thu,
  Fri,
  Sat,
}

enum StatusDevice {
  None,
  Commissioned,
  Decommissioning,
}

enum TimeBandAttributeKey {
  DayOfWeek,
  MonthOfYear,
  SpecialDay,
  Season,
}

enum DeviceType {
  IOT,
  SmartMeter,
  Others,
}

enum Time {
  StartTime,
  EndTime,
}

enum LabelMetrics {
  Units,
  FlowDirection,
  Phase,
  ApportionPolicy,
}

enum Deviceinfocheck {
  DeviceAttribute,
  Channel,
  LoadProfile,
  Reading,
  DeviceSpecification,
}

enum StatusSchedule {
  Enabled,
  Disabled,
}

enum ScheduleType {
  Calculation,
  Analytics,
}

enum StatusBillingDevice {
  Active,
  Inactive,
}

enum FlagSchedule {
  deviceschedule,
  devicegroupschedule,
  devicegroupscheduleID,
}

enum SelectDeviceOption {
  selectAll,
  removeAll,
  addOrRemove,
}

enum TypeSchedule {
  Group,
  Personal,
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
    case (Intervals):
      return Intervals.values.deserialize(value) as T?;
    case (Day):
      return Day.values.deserialize(value) as T?;
    case (StatusDevice):
      return StatusDevice.values.deserialize(value) as T?;
    case (TimeBandAttributeKey):
      return TimeBandAttributeKey.values.deserialize(value) as T?;
    case (DeviceType):
      return DeviceType.values.deserialize(value) as T?;
    case (Time):
      return Time.values.deserialize(value) as T?;
    case (LabelMetrics):
      return LabelMetrics.values.deserialize(value) as T?;
    case (Deviceinfocheck):
      return Deviceinfocheck.values.deserialize(value) as T?;
    case (StatusSchedule):
      return StatusSchedule.values.deserialize(value) as T?;
    case (ScheduleType):
      return ScheduleType.values.deserialize(value) as T?;
    case (StatusBillingDevice):
      return StatusBillingDevice.values.deserialize(value) as T?;
    case (FlagSchedule):
      return FlagSchedule.values.deserialize(value) as T?;
    case (SelectDeviceOption):
      return SelectDeviceOption.values.deserialize(value) as T?;
    case (TypeSchedule):
      return TypeSchedule.values.deserialize(value) as T?;
    default:
      return null;
  }
}
