class HTTPException implements Exception {
  final String m;

  HTTPException(this.m);

  @override
  String toString() {
    return m;
  }
}
