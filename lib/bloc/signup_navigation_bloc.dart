import 'package:rxdart/rxdart.dart';

class SignupNavigationBloc {
  var serviceFetcher = BehaviorSubject<int>.seeded(0);
  Stream<int> get responseData => serviceFetcher.stream;

  navigationTo(int index) async {
    serviceFetcher.sink.add(index);
  }

  void dispose() async {
    await serviceFetcher.drain();
    serviceFetcher.close();
  }
}

final signupNavigationBloc = SignupNavigationBloc();
