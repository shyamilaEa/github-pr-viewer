class PullRequest {
  final int id;
  final String title;
  final String author;
  final String? body;
  final String state;
  final String url;
  final DateTime createdAt;

  PullRequest({
    required this.id,
    required this.title,
    required this.author,
    this.body,
    required this.state,
    required this.url,
    required this.createdAt,
  });

  factory PullRequest.fromJson(Map<String, dynamic> json) {
    return PullRequest(
      id: json['id'],
      title: json['title'] ?? "No title",
      author: json['user']?['login'] ?? "Unknown",
      body: json['body'],
      state: json['state'] ?? "unknown",
      url: json['html_url'] ?? "",
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
