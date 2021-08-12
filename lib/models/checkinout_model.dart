class CheckInOutModel {
  final bool isCheckIn;
  final String time;
  final String location;

  CheckInOutModel(
      {required this.isCheckIn, this.time = "", this.location = ""});
}
