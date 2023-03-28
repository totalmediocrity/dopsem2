enum URL {
  user('http://localhost:8080/user'),
  token('http://localhost:8080/token'),
  finance ('http://localhost:8080/post');

  final String value;

  const URL(this.value);
}
