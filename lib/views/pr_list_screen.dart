import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/pr_viewmodel.dart';
import '../widgets/pr_tile.dart';

class PRListScreen extends StatelessWidget {
  const PRListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Pull Requests")),
      body: Consumer<PRViewModel>(
        builder: (context, prViewModel, child) {
          if (prViewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (prViewModel.error != null) {
            return Center(child: Text("Error: ${prViewModel.error}"));
          }

          if (prViewModel.pullRequests.isEmpty) {
            return const Center(child: Text("No pull requests found."));
          }

          return ListView.builder(
            itemCount: prViewModel.pullRequests.length,
            itemBuilder: (context, index) {
              final pr = prViewModel.pullRequests[index];
              return PullRequestTile(pr: pr);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<PRViewModel>().fetchPRs();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
