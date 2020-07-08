main() {
  var p = Point(2,2);
// 为实例变量 y 赋值。
// p.y = 3;
  print(p.y);
// 如果 p 为非空则将其属性 y 的值设为 4
  p?.y = 4;
  print(p.y);
}

class Point {
  num x, y;

  // 在构造函数体执行前用于设置 x 和 y 的语法糖。
  Point(this.x, this.y);
}

String stringify(int x, int y) {
  // Return a formatted string here
  String str = '$x'+' '+ '$y';
  str.toUpperCase();
}