import 'package:flutter/foundation.dart';
import '../models/pr_model.dart';
import '../services/github_service.dart';

class PRViewModel extends ChangeNotifier {
  final GitHubService _gitHubService;

  PRViewModel({GitHubService? gitHubService})
      : _gitHubService = gitHubService ?? GitHubService();

  List<PullRequest> _pullRequests = [];
  bool _isLoading = false;
  String? _error;

  List<PullRequest> get pullRequests => _pullRequests;
  bool get isLoading => _isLoading;
  String? get error => _error;


  Future<void> fetchPRs() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _pullRequests = await _gitHubService.fetchPullRequests();
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print("Error fetching PRs: $e\n$stackTrace");
      }
      _error = "Failed to load pull requests";
      _pullRequests = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearPRs() {
    _pullRequests = [];
    notifyListeners();
  }
}
