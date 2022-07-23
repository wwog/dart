//ts的基本类型在dart中类比的是dart的编译时常值
/* 
  int , ts number (包含 int)
  double , ts number(包含 double)
  num , ts number
  String , ts string
  bool , ts boolean
  Null , ts value null ,此处js中没有null,类比null值。
  List , ts Array
  Set 
  Map , ts Map
  Runes (通常由characters Api替换)
  Symbol , ts Symbol
  Object , ts any,从语言层面等同于js的Object
  dynamic , ts //@ts-ignore,表明禁用静态检查
  Never , ts never,表明此类型永远不会存在
 */

//======================================
//======================================
//===============int,double=============
//======================================
//======================================
//int
//64位整数
//在本机平台上，值可以来自 -2^63至 2^63- 1.
//在 Web 上，整数值表示为 JavaScript 数字（64 位浮点值，没有小数部分）-2^53至 2^53- 1.
var x = 0;
var hex = 0xDEADBEEF;
//double 64位(双精度)浮点数
/* 
int 和 double 都是 num 的子类型。
num 类型包括基本运算符，如 +、-、/ 和 *，也是您可以找到 abs()、 ceil() 和 floor() 以及其他方法的地方。
（按位运算符（如 >>）int 类中定义。
如果 num 及其子类型没有您要查找的内容，则 dart：math 库可能会提供。 
*/
double y = 0.0;
var exponents = 1.42e5;
double z = 1; //等效于 z = 1.0

//======================================
//======================================
//===============String=================
//======================================
//======================================
//UTF-16代码单元的序列。
//等同于 let a = `hello${y}`,dart不同的是,如果{}内是标识符则可以省略。
var a = 'hello${y}';
var b = "hello$y";
//等同于 let s1 = `/* 此处注释理解为换行 */`
var s1 = '''
You can create
multi-line strings like this one.
''';
//https://dart.dev/guides/language/language-tour#characters
var s = r'In a raw string, not even \n gets special treatment.';

//======================================
//======================================
//===============List===================
//======================================
//======================================
var list = [1, 2, 3];
var list2 = [0, ...list];
// var list2 = [0, ...?list];如果可为null

//集合if 和集合 for (集合:collection)
// 这里有点像rust(好像是有代值的if else),但是不知道集合if能不能用在任意块中
var nav = ['Home', 'Furniture', 'Plants', if (true) 'Outlet'];
var listOfStrings = ['#0', for (var i in list) '#$i'];
// 整合看起来,有的像ecma6中废弃的数组推导式的拆解

//======================================
//======================================
//===============Sets=Maps==============
//======================================
//======================================
//无序集合
var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
//空集
var names = <String>{};
// Set<String> names = {}; //等同于上面的
// var names = {}; // name is Map. 空{} map优先
// new 是可选的
var gifts = {
  'first': 'partridge',
  'second': 'turtledoves',
  'fifth': 'golden rings'
};
void block() {
  gifts['fourth'] = 'calling birds';
  //gifts['不存在的键'] == null;
}

//======================================
//======================================
//===============function===============
//======================================
//======================================
//Dart是一种真正的面向对象语言，所以即使是函数也是对象。
//函数隐式返回null
//函数也可做为参数或变量进行传递
//支持可选参数,命名参数
void enableFlags({bool? bold, bool? hidden}) {/*  */}
String say(String from, String msg, [String? device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

//默认值
void enableFlags1({bool bold = false, bool hidden = false}) {/*  */}
//支持闭包,同js一样，函数就是对象,闭包就是一个函数对象,其有权访问词法作用域