class CacheData {
  static int userId = 0;
  static String title = "";
  static String details = "";
  static String date = "";
  static String time = "";
  static String type = "";

  void setUserId(int id) {
    userId = id;
  }

  void setType(String name) {
    type = name;
  }

  int getUserId() {
    return userId;
  }

  void setTitle(String name) {
    title = name;
  }

  String getTitle() {
    return title;
  }

  String getType() {
    return type;
  }

  void setDetails(String name) {
    details = name;
  }

  String getDetails() {
    return details;
  }

  void setDate(String name) {
    date = name;
  }

  String getDate() {
    return date;
  }

  void setTime(String name) {
    time = name;
  }

  String getTime() {
    return time;
  }
}
