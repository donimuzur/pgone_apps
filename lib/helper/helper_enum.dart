import 'package:pgone_apps/shared/theme.dart';
import 'package:flutter/material.dart';

enum EnumLeaveType { Sick, Casual }

extension EnumLeaveTypeExtension on EnumLeaveType {
  Color get color {
    switch (this) {
      case EnumLeaveType.Casual:
        return casualLeaves;
      case EnumLeaveType.Sick:
        return sickLeaves;
      default:
        return Colors.black;
    }
  }

  String get text {
    switch (this) {
      case EnumLeaveType.Casual:
        return "Casul";
      case EnumLeaveType.Sick:
        return "Sick";
      default:
        return " ";
    }
  }
}

enum EnumStatusLeave { approved, waiting, decline }

extension EnumStatusLeaveExtension on EnumStatusLeave {
  String get text {
    switch (this) {
      case EnumStatusLeave.approved:
        return "Approved";
      case EnumStatusLeave.waiting:
        return "Waiting";
      case EnumStatusLeave.decline:
        return "Rejected";
      default:
        return "";
    }
  }

  Color get backgroundColor {
    switch (this) {
      case EnumStatusLeave.approved:
        return approvedLeavesBadgeBackgroundColor;
      case EnumStatusLeave.waiting:
        return waitingLeavesBadgeBackgroundColor;
      case EnumStatusLeave.decline:
        return declineLeavesBadgeBackgroundColor;
      default:
        return Colors.black;
    }
  }

  Color get textColor {
    switch (this) {
      case EnumStatusLeave.approved:
        return approvedLeavesBadgeTextColor;
      case EnumStatusLeave.waiting:
        return waitingLeavesBadgeTextColor;
      case EnumStatusLeave.decline:
        return declineLeavesBadgeTextColor;
      default:
        return Colors.black;
    }
  }
}

enum EnumDurationLeave {
  HalfDay,
  FullDay,
}

extension EnumDurationLeaveExtension on EnumDurationLeave {
  String get text {
    switch (this) {
      case EnumDurationLeave.FullDay:
        return "Full Day Application";
      case EnumDurationLeave.HalfDay:
        return "Half Day Application";
      default:
        return "More than 1 Days Application";
    }
  }

  Color get textColor {
    return leaveDurationTextColor;
  }
}

enum EnumGender { male, female }

extension EnumGenderExtension on EnumGender {
  String get text {
    switch (this) {
      case EnumGender.male:
        return "Male";
      case EnumGender.female:
        return "Female";
      default:
        return "Male";
    }
  }
}

enum EnumMaritalStatus { married, single }

extension EnumMaritalStatusExtension on EnumMaritalStatus {
  String get text {
    switch (this) {
      case EnumMaritalStatus.single:
        return "Single";
      case EnumMaritalStatus.married:
        return "Married";
      default:
        return "Single";
    }
  }
}
