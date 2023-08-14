
class Event {
  int? id;
  String? title;
  String? details;
  String? pickedDate;
  String? pickedTime;
  String? isNotification;

  Event(
      {this.id,
      this.title,
      this.details,
      this.pickedDate,
      this.pickedTime,
      this.isNotification});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "details": details,
      "pickedTime": pickedTime,
      "pickedDate": pickedDate,
      "notification": isNotification
    };
  }
}
