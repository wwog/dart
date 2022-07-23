//所有变量均为Object
//js由于历史原因设计了null和undefined两种空值,dart没有两种空值,所以变量均为Object
//null类型是没有开启空安全下所有未初始化变量的初始值

//等同 let a = 1
var a = 1;
//等同 let b:any = 1
Object b = 1;
//等同 let c:string =1
String c = '1';
//等同 let d:number | null;
int? d;

//late 修饰符可以懒惰初始化变量.但如果不初始化,可能导致使用时发生类型错误
//等同 let e:number
late int e;

void main() {
  //局部变量声明后可以延迟初始化,但使用前必须初始化。
  int num;
  num = 1;
  //================================= const unit test
  //两个两桶的编译时常量将生成一个规范实例
  const List<int> list1 = [1, 2, 3];
  const List<int> list2 = [1, 2, 3];

  // 输出结果为true 比较的是指针指向
  print(list1 == list2);

  // 输出结果为true 比较指针指向同时也比较内容
  print(identical(list1, list2));

  //================================= final unit test
  final List<int> list3 = [1, 2, 3];
  final List<int> list4 = [1, 2, 3];

  // 输出结果为false 比较的是指针指向
  print(list3 == list4);

  // 输出结果为false 比较指针指向同时也比较内容
  print(identical(list3, list4));
}

//常量
//等同 const name = 'a',final是运行时常量
final name = 'a';
//const是编译时常量,此处从语法上等同ts,但效果并不一致。详见main函数
const name2 = 'a';

class TestPage2 {
  //类常量 规范要求必须使用 static 修饰。
  static const String name = "张三";

  void test() {
    //方法块常量
    const String name = "张三";
  }
}

//const 除了声明常量,还可声明常值。其实const 声明变量的时候,建立了const上下文
//内部的构造函数和文本(字面量)前都被赋予了const常值.
/* 
  //language:Typescript
  const obj = Object.freeze({
    'person': Object.freeze(new Person('张三'))
  })
  //language:Dart
  const obj = {
    'person': Person('张三')
  }
  //language:Dart
  const obj = const {
    'person': const Person('张三')
  }
 */
//等同与 let a = Object.freeze([1,2,3])
var f = const [1, 2, 3];
//f[0] = 1; error