import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:unlimit/domain/usecases/FetchJokeCases.dart';
import 'package:unlimit/presentation/homepage/my_home_page_cubit.dart';
import 'package:unlimit/presentation/homepage/my_home_page_state.dart';

import '../../app/Theme.dart';

final getIt = GetIt.instance;

class MyHomePage extends StatelessWidget {
  FetchJokeCases fetchJokeCases = getIt.get<FetchJokeCases>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyHomePageBloc.new(fetchJokeCases),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("JOKES APP"),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.history))],
        ),
        backgroundColor: Colors.white,
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
              onPressed: () {
                context.read<MyHomePageBloc>().refresh();
              },
              child: Icon(Icons.refresh));
        }),
        body: RefreshIndicator(
          onRefresh: () {
            return context.read<MyHomePageBloc>().refresh();
          },
          child: BlocBuilder<MyHomePageBloc, MyHomePageState>(
               bloc: MyHomePageBloc(fetchJokeCases),
            builder: (context, state) {
              print("BlocBuilder $state");
              return Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  child: getContent(state));
            },
          ),
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  Widget getContent(state) {
    if (state is ResultLoading) {
      return const Center(
        child:
            SizedBox(width: 60, height: 60, child: CircularProgressIndicator()),
      );
    } else if (state is ResultError) {
      return Center(
        child: Text(
          state.message,
          style: TextStyle(fontSize: 20),
        ),
      );
    }

    var result = state as ResultData;
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                      result.jokeModel.joke,
                      style: heading1,
                    ),
                    Text(
                      "🤣",
                      style: TextStyle(fontSize: 50),
                    )
                  ],
                ),
              ),
            ),
          ]),
    );
  }
}
