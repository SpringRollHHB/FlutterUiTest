class SingleTon {

  SingleTon._internal();

  static SingleTon? _singleTon;

  static SingleTon get singleTon => _getInstance();

  static SingleTon _getInstance() {
    _singleTon ??= SingleTon._internal();
    return _singleTon!;
  }

}