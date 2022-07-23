class Person {
  final String name;
  //const 常量必须附加到类上
  static const String type = 'person';
  //构造函数
  Person(this.name);
}

class Employee extends Person {
  final String job;
  //构造函数
  Employee(String name, this.job) : super(name);
  //命名构造函数, :号后面可以跟超类构造函数,也可以赋值内部状态
  Employee.developer(String name)
      : job = 'developer',
        super(name);
  //重定向构造函数 不能和SuperInitArgs一起使用
  Employee.reflectx(String name, String job) : this(name, job);
}

// ==========================================
class Vector2d {
  final double x;
  final double y;

  Vector2d(this.x, this.y);
}

class Vector3d extends Vector2d {
  final double z;

  // 将x和y参数转发给默认的超级构造函数
  // Vector3d(final double x, final double y, this.z) : super(x, y);
  Vector3d(super.x, super.y, this.z);
}

//如果超构造函数调用已经具有位置参数，则超级初始值设定项参数不能是位置参数，但它们始终可以命名：

class Vector2d1 {
  final x;
  final y;

  Vector2d1.named({required this.x, required this.y});
}

class Vector3d1 extends Vector2d1 {
  final z;

  // Forward the y parameter to the named super constructor like:
  // Vector3d.yzPlane({required double y, required this.z})
  //       : super.named(x: 0, y: y);
  Vector3d1.yzPlane({required super.y, required this.z}) : super.named(x: 0);
}

//常量构造函数
class ImmutablePoint {
  static const ImmutablePoint origin = ImmutablePoint(0, 0);

  final double x, y;

  const ImmutablePoint(this.x, this.y);
}

void main(List<String> args) {
  var employee = Employee.developer('张三');
  print(employee.name);
  print(employee.job);
}
