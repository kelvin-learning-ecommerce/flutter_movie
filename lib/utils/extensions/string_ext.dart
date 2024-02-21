extension Convert on String {
  bool toBool() {
    var flag = this;
    return (flag.toLowerCase() == "true" || flag.toLowerCase() == "1") ? true : false;
  }
}
