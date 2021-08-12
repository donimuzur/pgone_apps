class AttendanceDailyLogModel {
  final String tgl;
  final String day;
  final String status;
  final String checkIn;
  final String checkOut;
  final String jamKerja;
  final String location;

  AttendanceDailyLogModel(
      {this.tgl = "",
      this.day = "",
      this.checkIn = "",
      this.checkOut = "",
      this.jamKerja = "",
      this.status = "",
      this.location = ""});
}
