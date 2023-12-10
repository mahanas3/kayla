class NetworkError {
  static String networkError(int statusCode) {
    switch (statusCode) {
      case 200:
        {
          return 'Ok';
        }
      case 400:
        {
          return 'Bad request';
        }
      case 401:
        {
          return 'Unauthorized';
        }
      case 403:
        {
          return 'Forbidden';
        }
      case 404:
        {
          return 'Not found';
        }
      default:
        {
          return 'Error';
        }
    }

  }
}
