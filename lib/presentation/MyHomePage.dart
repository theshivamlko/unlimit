import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:unlimit/domain/usecases/FetchJokeCases.dart';

import '../app/Theme.dart';
import 'my_home_page_bloc.dart';

final getIt = GetIt.instance;

class MyHomePage extends StatelessWidget {
  FetchJokeCases fetchJokeCases = getIt.get<FetchJokeCases>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("JOKES APP"),
      ),
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: () {
          return Future(() => null);
        },
        child: BlocBuilder<MyHomePageBloc, MyHomePageState>(
          bloc: MyHomePageBloc(fetchJokeCases),
          builder: (context, state) {
            return Container(
              color: Colors.green,
              width: MediaQuery.of(context).size.width,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      color: Colors.white,
                      elevation: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Some Random Jokes",
                              style: heading1,
                            ),
                            Text("Emoji")
                          ],
                        ),
                      ),
                    ),
                  ]),
            );
          },
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
