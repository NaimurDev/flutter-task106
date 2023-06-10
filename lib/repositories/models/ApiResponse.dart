class ApiResponse{
  final bool success;
  final dynamic response;
  final String? errorMessage;

  ApiResponse({required this.success, this.response, this.errorMessage});

  @override
  String toString() {
    return 'ApiResponse{success: $success, response: $response, errorMessage: $errorMessage}';
  }
}