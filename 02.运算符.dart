void main(List<String> args) {
  int? a;
  a ??= 1; //??= 为null时赋值
  print(null ?? '123');
}

int b = 1 ~/ 2;// ~/ 取整除

//级联表示法
//级联（..、?..）允许您对同一对象执行一系列操作。
//除了访问实例成员之外，还可以对同一对象调用实例方法。
//这通常可以节省创建临时变量的步骤，并允许您编写更流畅的代码。

/* var paint = Paint()
  ..color = Colors.black
  ..strokeCap = StrokeCap.round
  ..strokeWidth = 5.0; */

//构造函数 Paint() 返回一个 Paint 对象。
//级联表示法后面的代码对此对象进行操作，忽略可能返回的任何值。


/* var paint = Paint();
paint.color = Colors.black;
paint.strokeCap = StrokeCap.round;
paint.strokeWidth = 5.0; */

//如果级联操作的对象可以为 null，则对第一个操作使用空短路级联 （?..）。
//以 ?.. 开头可保证不会对该 null 对象执行任何级联操作。

/* querySelector('#confirm') // Get an object.
  ?..text = 'Confirm' // Use its members.
  ..classes.add('important')
  ..onClick.listen((e) => window.alert('Confirmed!'))
  ..scrollIntoView(); */