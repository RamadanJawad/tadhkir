class CardDate {
  int? id;
  String? title;
  String? idCard;
  String? pickedDate;
  String? pickedTime;
  String? isNotification;
  String? typeCard;

  CardDate(
      {this.id,
      this.title,
      this.idCard,
      this.pickedDate,
      this.pickedTime,
      this.typeCard,
      this.isNotification});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "idCard": idCard,
      "pickedTime": pickedTime,
      "pickedDate": pickedDate,
      "notification": isNotification,
      "typeCard": typeCard
    };
  }
}
