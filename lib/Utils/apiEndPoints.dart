class ApiEndPoints {
  static const String baseUrl = "https://newsapi.org/v2";
  static _TopHeadlines topHeadlines = _TopHeadlines();
  final String apiKey = "your API key";
}

class _TopHeadlines {
  String getTopHeadlines = "top-headlines";
  String country = "country";
  Map<String, String> countryCode = {
    "us": "United States",
    "in": "India",
    "gb": "United Kingdom",
    "au": "Australia",
    "ca": "Canada",
    "de": "Germany",
    "fr": "France",
    "jp": "Japan",
    "kr": "Korea",
    "ru": "Russia",
    "sa": "Saudi Arabia",
  };
}
