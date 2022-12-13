/// return bool เช็คว่าเป็นตัวเลขหรือไม่ [0-9]
bool isNumeric(String str) {
  RegExp _numeric = RegExp(r'^-?[0-9]+$');
  return _numeric.hasMatch(str);
}