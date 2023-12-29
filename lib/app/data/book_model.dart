class Book {
  final String title;
  final String path;
  final int pageNumber;
  final String format;

  Book({
    required this.title,
    required this.path,
    required this.pageNumber,
    required this.format,
  });

  // Method to convert Book object to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'path': path,
      'pageNumber': pageNumber,
      'format': format,
    };
  }

  // Factory method to create a Book object from JSON
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'],
      path: json['path'],
      pageNumber: json['pageNumber'],
      format: json['format'],
    );
  }
}
