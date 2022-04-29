// ignore_for_file: non_constant_identifier_names

class MainLesson {
  late bool completed;
  late String content;
  late String name;
  late int number;
  late bool started;
  late int time;
  late int watchedTime;

  MainLesson(String con, String name, int num, bool started, int time,
      int watchedTime, bool comp) {
    this.completed = comp;
    this.content = con;
    this.name = name;
    this.number = num;
    this.started = started;
    this.time = time;
    this.watchedTime = watchedTime;
  }
}
