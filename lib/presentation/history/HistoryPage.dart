import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:unlimit/domain/usecases/ShowHistoryJokeCases.dart';
import 'package:unlimit/presentation/history/history_cubit.dart';
import 'package:unlimit/presentation/homepage/my_home_page_state.dart';

import '../../app/Theme.dart';

final getIt = GetIt.instance;

class HistoryPage extends StatelessWidget {
  HistoryPage({super.key});

  ShowHistoryJokeCases showHistoryJokeCases = getIt.get<ShowHistoryJokeCases>();

  @override
  Widget build(BuildContext context) {
    print("HistoryPage ${showHistoryJokeCases}");
    return BlocProvider<HistoryCubit>(
        create: (context) => HistoryCubit(showHistoryJokeCases),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("History"),
          ),
          body: getBody(),
        ));
  }

  Widget getBody() {
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (context, state) {
        if (state is HistoryLoading) {
          return const Center(
            child: SizedBox(
                width: 60, height: 60, child: CircularProgressIndicator()),
          );
        } else if (state is HistoryError) {
          var error = state as ResultError;
          return Center(
            child: Text(
              error.message,
              style: TextStyle(fontSize: 20),
            ),
          );
        }

        var result = state as HistoryData;
        return ListView.builder(
            itemCount: result.jokesList.length,
            itemBuilder: (context, index) {
              return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${result.jokesList[index].joke}",style: heading2,),
                  ),
              margin: EdgeInsets.all(10),);
            });
      },
    );
  }
}
