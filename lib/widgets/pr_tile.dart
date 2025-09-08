import 'package:flutter/material.dart';
import '../../models/pr_model.dart';
import '../../core/utils.dart';

class PullRequestTile extends StatelessWidget {
  final PullRequest pr;

  const PullRequestTile({super.key, required this.pr});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        title: Text(
          pr.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (pr.body != null && pr.body!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  pr.body!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            const SizedBox(height: 4),
            Text("Author: ${pr.author}"),
            Text("Created: ${Utils.formatDate(pr.createdAt)}"),
          ],
        ),
      ),
    );
  }
}
