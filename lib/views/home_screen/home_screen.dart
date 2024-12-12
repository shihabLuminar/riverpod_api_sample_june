import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_api_sample_june/controllers/home_screen_controller/home_screen_controller.dart';
import 'package:riverpod_api_sample_june/controllers/home_screen_controller/home_screen_state.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await ref.read(homeScreenStateNotifierProvider.notifier).fetchData();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // state object
    final homeScreenState =
        ref.watch(homeScreenStateNotifierProvider) as HomeScreenState;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await ref.read(homeScreenStateNotifierProvider.notifier).fetchData();
        },
        child: Icon(Icons.refresh),
      ),
      body: Center(
        child: homeScreenState.isLoading
            ? CupertinoActivityIndicator(
                radius: 30,
              )
            : Text(homeScreenState.data?.insult.toString() ?? "NO Data"),
      ),
    );
  }
}
