import 'package:rxdart/rxdart.dart';

class GenderSelectionBloc {
  var serviceFetcher = BehaviorSubject<int>.seeded(0);
  Stream<int> get responseData => serviceFetcher.stream;

  select(int index) async {
    serviceFetcher.sink.add(index);
  }

  void dispose() async {
    await serviceFetcher.drain();
    serviceFetcher.close();
  }
}

final genderSelectionBloc = GenderSelectionBloc();
