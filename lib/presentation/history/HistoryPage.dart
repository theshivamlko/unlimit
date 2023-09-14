import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unlimit/presentation/history/history_cubit.dart';
import 'package:unlimit/presentation/homepage/my_home_page_state.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (context, state) {
        if (state is ResultLoading) {
          return const Center(
            child: SizedBox(
                width: 60, height: 60, child: CircularProgressIndicator()),
          );
        } else if (state is ResultError) {
          var error = state as ResultError;
          return Center(
            child: Text(
              error.message,
              style: TextStyle(fontSize: 20),
            ),
          );
        }

        var result = state as ResultData;
        return ListView.builder(itemBuilder: (context, index) {});
      },
    );
  }
}
