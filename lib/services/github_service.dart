import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pr_model.dart';

class GitHubService {
  final String owner;
  final String repo;

  GitHubService({
    this.owner = "flutter",
    this.repo = "flutter",
  });


  Future<List<PullRequest>> fetchPullRequests() async {
    final url = Uri.parse(
        "https://api.github.com/repos/$owner/$repo/pulls");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => PullRequest.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load pull requests: ${response.statusCode}");
    }
  }
}
