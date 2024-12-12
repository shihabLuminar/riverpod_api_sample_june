import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_api_sample_june/controllers/home_screen_controller/home_screen_state.dart';
import 'package:riverpod_api_sample_june/models/random_data_model.dart';

//state notifier provider object
final homeScreenStateNotifierProvider =
    StateNotifierProvider((ref) => HomeScreenStateNotifier());

//state notifier
class HomeScreenStateNotifier extends StateNotifier<HomeScreenState> {
  HomeScreenStateNotifier() : super(HomeScreenState());

  Future<void> fetchData() async {
    final url = Uri.parse(
        "https://evilinsult.com/generate_insult.php?lang=en&type=json");

    try {
      //  to set loading state to true before fetching data
      state = state.copyWith(isLoading: true);
      //  to fetch data from the url
      final response = await http.get(url);
      // checking status code
      if (response.statusCode == 200) {
        // success  -  converting data to model and storing it to state variable  and setting loading state to false
        state = state.copyWith(
            isLoading: false, data: randomDataModelFromJson(response.body));
      } else {
        // handle api failed state
      }
    } catch (e) {
      // handle exception
      log(e.toString());
    }
    // setting laoding state to false at the end of the function
    state = state.copyWith(isLoading: false);
  }
}
