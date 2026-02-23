class HttpStatusHandler {
  /// Map HTTP status code to user-friendly message
  static String getMessage(int statusCode) {
    switch (statusCode) {
      case 200:
        return "Success";
      case 201:
        return "Created successfully";
      case 400:
        return "User already exist. Please login!";
      case 401:
      case 403:
        return "You are not authorized to access this content.";
      case 404:
        return "Resource not found.";
      case 408:
        return "Request timeout. Please try again.";
      case 500:
        return "Server error. Please try again later.";
      case 503:
        return "Service unavailable. Try again later.";
      default:
        return "Unexpected error occurred. Please try again.";
    }
  }
}
