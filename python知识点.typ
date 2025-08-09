//导入cuti包，设置中文粗体
#import "@preview/cuti:0.2.1": show-cn-fakebold
#show: show-cn-fakebold


//设置页面样式
#set page(
  paper: "a4",
  margin:(left:1.5cm,rest:1cm),
  header: align(right)[
    Python知识讲义
  ],
  numbering: "1/1",
)

#set heading(numbering: "1.")  //设置标题的序号
#set text(font: ("Times New Roman", "LXGW WenKai"),size:10pt)  //分别设置“中文”和English字体
#set enum(numbering: "(1)")  //设置枚举的序号


// Display inline code in a small box  设置行内代码格式
// that retains the correct baseline.
#show raw.where(block: false): box.with(
  fill: luma(249),
  inset: (x: 3pt, y: 0pt),
  outset: (y: 3pt),
  radius: 2pt,
)

// Display block code in a larger block 设置代码块格式
// with more padding. 使代码块有更大的空间
#show raw.where(block: true): block.with(
  fill: luma(251),
  inset: 10pt,
  radius: 2pt,
)

=  程序的格式框架
==  缩进

Python语言采用严格的“缩进”来表明程序的格式框架。

缩进指每一行代码开始前的空白区域，用来表示代码间的包含和层次关系。

当表达分支、循环、函数、类等程序含义时，在*if、for、def、class*等保留字所在完整语句后通过英文冒号(:)结尾并在之后进行缩进，表明后续代码与紧邻无缩进语句的所属关系。

== 注释
注释是代码中的辅助性文字，会被编译或解释器忽略，不被计算机执行。一般用于程序员对代码的说明。

Python语言采用(\#)作为单行注释的标记，多行注释需要在每行开始都使用 (\#)。



== 续行符
Python语言中一般以新行作为语句的结束符。

但如果将两个语句放在同一行，则可以使用分号(;)隔开。

如果将一行的语句分为多行显示，则可以使用续行符（\\）将它们放在同一行。

= 语法元素的名称变量
== 变量
  变量是保存和表示数据值的一种语法元素，在程序中用来存放程序的中间结果，或用更形象的方式表示数据。

== 命名（标识符）
  - 变量采用标识符（名字）来表示，关联标识符的过程叫命名。

  - Python语言允许采用大写字母、小写字母、数字、下划线(\_)和汉字等字符及其组合给变量命名。

  - 注意：标识符对大小写敏感

= 数据类型
Python 语言支持多种数据类型，最简单的包括数字类型、字符串类型、元祖类型、集合类型、列表类型、字典类型等。

== 数字类型
表示数字或数值的数据类型称为数字类型，Python 语言提供3种数字类型：整数、浮点数和复数，分别对应数学中的整数、实数和复数。

- 一个整数值可以表示为十进制、十六进制、八进制和二进制等不同进制数形式。
  #table(
    columns: 2,
    stroke: none,
    table.hline(),
    table.header([进制], [示例]),
    table.hline(stroke: 0.5pt),
    [二进制：], [0b0011111110010], 
    [八进制：], [0o1762],  
    [*十进制：*], [*1010*], 
    [十六进制：], [0x3f2],
    table.hline(),
  )

- 一个浮点数可以表示为带小数点的一般形式，也可以采用科学计数法表示。（e表示10的幂）
  - 一般形式： 12.3456
  - 科学计数法: 1.23456e2


- 复数类型与数学中的复数相一致，采用 a+bj 的形式表示，存在实部和虚部。

== 字符串类型
Python 语言中，字符串用两个双引号 " " 或者单引号 '' 括起来的一个或多个字符。

- Python字符串的两种序号体系： 
  - 如果字符串长度为L，正向递增需要以最左侧字符序号为0，向右依次递增，最右侧字符序号为L-1；
  - 反向递减序号以最右侧字符序号为 -1 ,向左依次递减，最左侧序号为 -L。

- 可以采用[N:M]格式获取字符串的子串，这个操作被形象地成为切片。[N:M]获取字符串中从N到M（但不包含M)间连续的子字符串。

- 可以通过内置函数 len() 函数获取字符串的长度，一个中文字符和西文字符的长度都记为1。

=== 字符串操作符
#table(
  columns: 2,
  stroke: none,
  table.hline(),
  table.header([操作符], [描述]),
  table.hline(stroke: 0.5pt),
  [+], [字符串连接], 
  [\*], [重复输出字符串],  
  [[x]], [通过索引获取x位置的字符], 
  [[:]], [截取字符串的一部分],
  [in],[*成员运算符*-如果字符串中包含给定的字符返回True],
  [not in],[*成员运算符*-如果字符串中不包含给定的字符返回True],
  [r / R],[原始字符串-所有的字符串都是直接按照字面的意思来使用，没有转义特殊或不能打印的字符。原始字符串除在字符串的第一个引号前加上字母"r"（可以大小写）以外，与普通字符串有着几乎完全相同的语法],
  [%],[格式字符串-可以接受不限个参数，位置可以不按顺序],
  table.hline(),
)

=== 字符串方法

#table(
  columns: 2,
  stroke: none,
  table.hline(),
  table.header([方法], [描述]),
  table.hline(stroke: 0.5pt),
  [string.capitalize()], [把字符串的第一个字符大写], 
  [string.center(width)], [返回一个原字符串居中，并使用空格填充至长度 width 的新字符串],  
  [string.count(str,beg=0,end=len(string))], [返回str在string中出现的次数，如果beg或者end指定则返回指定范围内str出现的次数], 
  [string.decode(encoding='UTF-8',errors='strict')],[以encoding指定的编码格式 *解码* string，如果出错默认报一个ValueError的异常,除非errors指定的是'ignore'或者'replace'],
  [string.encode(encoding='UTF-8',errors='strict')],[以encoding指定的编码格式 *编码* string，如果出错默认报一个ValueError的异常,除非errors指定的是'ignore'或者'replace'],
  [string.endswith(obj,beg=0,end=len(string))],[检查字符串是否以obj结束，如果beg或者end指定则检查指定的范围内是否以obj结束，如果是，返回True,否则返回False],
  [string.expandtabs(tabsize=8)],[把字符串string中的tab符号(\t)转为空格，tab符号(\t)默认的空格数是8],
  [string.format()],[格式化字符串],
  [string.find(str,beg=0,end=len(string))],[检测str是否包含在字符串中，如果指定范围beg和end，则检查是否包含在指定范围内，如果包含返回开始的索引值，否则返回-1],
  [string.index(str,beg=0,end=len(string))],[跟find()方法一样，只不过如果str不在字符串中会报一个异常],
  [string.isalnum()],[如果字符串至少有一个字符并且所有字符都是字母或数字则返回True,否则返回False],
  [string.isalpha()],[如果字符串至少有一个字符并且所有字符都是字母则返回True,否则返回False],
  [string.isdecimal()],[如果字符串只包含十进制数字则返回True,否则返回False],
  [string.isdigit()],[如果字符串只包含数字则返回True,否则返回False],
  [string.islower()],[如果字符串中包含至少一个区分大小写的字符，并且所有这些(区分大小写的)字符都是小写，则返回True,否则返回False],
  [string.isnumeric()],[如果字符串中只包含数字字符，则返回True,否则返回False],
  [string.isspace()],[如果字符串中只包含空格，则返回True,否则返回False],
  [string.istitle()],[如果字符串是标题化的(见title())则返回True,否则返回False],
  [string.isupper()],[如果字符串中包含至少一个区分大小写的字符，并且所有这些(区分大小写的)字符都是大写，则返回True,否则返回False],
  [string.join(seq)],[以string作为分隔符，将seq中所有的元素(的字符串表示)合并为一个新的字符串],
  [string.ljust(width)],[返回一个原字符串左对齐,并使用空格填充至长度width的新字符串],
  [string.lower()],[转换string中所有大写字符为小写],
  [string.lstrip()],[截掉字符串左边的空格或指定字符],
  [max(str)],[返回字符串str中最大的字母],
  [min(str)],[返回字符串str中最小的字母],
  [string.partition(str)],[有点像find()和split()的结合体,从str出现的第一个位置起,把字符串string分成一个3元素的元组(string_pre_str,str,string_post_str),如果string中不包含str则 string_pre_str==string],
  [string.replace(str1,str2,num=string.count(str1))],[把string中的str1替换成str2,如果num指定，则替换不超过num次],
  [string.rfind(str,beg=0,end=len(string))],[类似于find()函数，不过是从右边开始查找],
  [string.rindex(str,beg=0,end=len(string))],[类似于index()，不过是从右边开始],
  [string.rjust(width)],[返回一个原字符串右对齐,并使用空格填充至长度width的新字符串],
  [string.rpartition(str)],[类似于partition()函数,不过是从右边开始查找],
  [string.rstrip()],[删除string字符串末尾的空格],
  [string.split(str="",num=string.count(str))],[以str为分隔符切片string，如果num有指定值，则仅分隔num+1个子字符串],
  [string.splitlines(num=string.count('\n'))],[按照行('\r','\r\n','\n')分隔，返回一个包含各行作为元素的列表，如果参数num有指定值，则仅分隔num+1个子字符串，并且每一个字符串可以通过newline字符分割],
  [string.startswith(obj,beg=0,end=len(string))],[检查字符串是否是以obj开头，是则返回True,否则返回False,如果beg和end指定值，则在指定范围内检查],
  [string.strip([chars])],[在字符串上执行lstrip()和rstrip()],
  [string.swapcase()],[翻转string中的大小写],
  [string.title()],[返回"标题化"的string,就是说所有单词都是以大写开始，其余字母均为小写(见istitle())],
  [string.translate(str,del="")],[根据str给出的表(包含256个字符)转换string的字符,要过滤掉的字符放到del参数中],
  [string.upper()],[转换string中的小写字母为大写],
  [string.zfill(width)],[返回长度为width的字符串，原字符串string右对齐，前面填充0],
  table.hline(),
)


+ format(args) 方法\
  format() 方法用于格式化字符串，将字符串中的占位符替换为指定的值。
  占位符由大括号 {} 表示，其中可以包含格式化选项，例如指定宽度、对齐方式等。\
  注意：要使用 format() 方法，最复杂的地方在于字符串模板的定义,具体的语法结构如下：
  ```python
  "{[index]:[fill]align[sign][#][width][.precision][type]}"
  ```
  其中，各部分的含义如下：
  - index：可选参数，用于指定要格式化的参数的索引；
  - fill：可选参数，用于指定填充字符；
  - align：可选参数，用于指定对齐方式，包括左对齐（<）、右对齐（>）、居中对齐（^）；
  - sign：可选参数，用于指定数字的符号，包括正号（+）、负号（-）、空格（ ）；
  - \#：可选参数，用于指定是否显示进制前缀，例如十六进制数的前缀为 0x；
  - width：可选参数，用于指定最小宽度；
  - .precision：可选参数，用于指定小数点后的精度；
  - type：可选参数，用于指定格式化类型，包括字符串(s)、整数（d）、浮点数（f）、科学计数法（e）、十六进制数（x）、百分比(%)等。



== List 列表类型

=== 列表的创建
  + 通过赋值的方式创建列表：使用赋值运算符(=)进行创建，当列表元素为空时此列表为空列表
  + 使用list()函数创建列表
    ```python
    # iterable 为可迭代对象，可以是字符串、列表、元组、字典等对象，通过list()函数将可迭代对象转换为列表类型
    列表名 = list(iterable)
    ```
=== 列表的属性
列表是一个可重复的可变序列，所以在列表创建后，可以对其进行增删改查等操作。
+ 列表元素的访问
列表是典型的有序集合，可以使用索引值对应的位置获取元素，也可以使用切片操作获得任何部分的元素。

注意：如果提供的索引位置超出列表范围，就会报错：IndexError:list index out of range 

+ 列表元素的增加
 - 可通过 append() 函数在列表的尾部添加一个元素；
 - 通过 insert() 函数在列表的任意指定位置插入元素；
 - 通过 extend() 函数将一个列表中所有的元素追加到当前列表的尾部；
 - Python 中的列表运算支持“+”和“\*”:"+"表示将两个列表的元素进行连接，使其成为新列表；“\*”表示将列表元素重复遍数。

=== 列表元素的修改
- 可以直接修改列表中索引号对应位置的元素；
- 也可以通过赋值的方式修改列表

=== 列表元素的删除
- 可通过del语句删除列表中指定位置的元素，也可以删除整个列表；
- 通过remove()函数可以删除列表中的某个匹配元素，如果列表中有多个匹配元素，则只删除第1个匹配到的元素。*当列表中找不到匹配的元素时会报错*；
- 通过pop()函数可以删除并返回指定位置的元素，如果省略了索引号，则默认删除列表的最后一个元素；
- 通过clear()函数可以清空列表，即删除列表中的所有元素。

=== 列表的常用方法
#table(
  columns: 2,
  stroke: none,
  table.hline(),
  table.header([函数], [描述]),
  table.hline(stroke: 0.5pt),
  [list.append(x)], [在列表的末尾添加1个元素x], 
  [list.extend(x)], [将列表x中的元素全部插入列表list的尾部],  
  [list.insert(i,x)], [在列表的索引i位置插入元素x], 
  [list.remove(x)], [删除列表中的元素x,未找到指定元素时，出发 ValueError 异常],
  [list.pop(i)],[*删除列表中i位置的元素，并返回该元素*，当i省略时默认删除列表中最后一个元素。如果列表为空或索引号在列表索引范围之外则会引发 IndexError],
  [list.clear()],[移除列表中的所有元素],
  [list.index(x[,start[,end]])],[返回列表中第一个值为x的元素的零基索引。未找到指定元素时，出发 ValueError异常。
  
  可选参数start 和 end 是切片符号，用于将搜索限制为列表的特定子序列。返回的索引是相对于整个序列的开始计算的，而不是基于start参数],
  [list.count(x)],[返回列表中元素x出现的次数],
  [list.sort(\*,key=None,reverse=False)],[对列表中的元素进行排序，就地排序；key 和 reverse 都可以省略，key用于指定排序的规则，默认值是None;reverse 用于控制列表元素的排序方式是升序还是降序，True为降序，False 为升序，默认值为False],
  [list.reverse()],[翻转列表中的元素],
  [list.copy()],[返回列表的浅拷贝],
  table.hline(),
)

- 使用count()函数返回列表中指定元素出现的次数时，指定元素必须完全匹配才能找到。\
- sort()函数是对原列表进行排序，就是原列表发生改变了；而Python内置函数sorted()不会改变原列表。\
- reverse()函数用于对列表中的元素进行倒序排序，即将原列表的元素从右到左倒序，倒序后的列表数据替换原列表数据。
- 使用copy()函数复制列表是浅复制（列表的一级元素是复制了，但是列表中子列表会是对象引用），类似于 a[:]。

=== 遍历列表
Python 中遍历列表最常用、最直观的方式是使用 for 循环，适用于大多数情况。


=== 列表的复制
Python 中列表的复制有两种方式：
+ 直接赋值：将一个列表赋值给另一个变量，实际上是将列表的引用赋值给了新变量，因此两个变量指向同一个列表。
+ 使用切片操作：通过切片操作可以创建列表的副本，即创建一个新的列表，其中包含与原列表相同的元素。

+ List 列表复制的差异
  #image("\附件\list_copy.png",width: 180pt, height: 150pt)

+ Array 数组复制的差异

  #image("\附件\array_copy.png",width: 180pt, height: 210pt)


== 元组（Tuple）
Python 中的元组是一种有序不可变的元素的集合，所有元素放在一堆小括号"()"内，用英文逗号","分割。
- 与列表一样，元组中的元素可以是不同类型的数据；
- 与列表不同的是，元组是不可变的序列，不可以对元组中的元素进行增、删、改等操作；
- 通过 type() 查看元组的类型为tuple,元组中的元素可以是重复的。
=== 元组的创建
+ 通过赋值创建元组
  - 可以通过将 '（）'赋值给变量，创建空元组（意义不大，因为元组不可变）
  - 元组中只包含一个元素时，需要在元素后面添加“，”,否则阔后会被当做运算符，而变量表示的不是元组，而是元素本身的数据类型；
+ 通过tuple()函数创建元组
  使用tuple()函数将列表或其他可迭代对象转换为元组

=== 元组的访问
Python 中的元组也是有序集合，同样可以使用索引值对应的位置获取元素，也可以使用切片操作获得任何部分的元素。

=== 元组的运算
Python 中元组的运算支持“+”和“\*”：“+”表示将两个元组的元素进行连接使其成为新的元组；“\*”表示将元组元素重复几遍。

=== 元组的常用操作方法
元组的操作方法只有 index() 和 count(),其使用方法与列表类似：
- index() 函数用于返回元组中指定元素的下标位置的index值，当元组中有多个元素与指定元素相同时，返回最前面的第一个元素的位置。

== 字典(dict)
Python中用于存储具有一一对应的映射关系的数据结构称为字典，它以键-值对的方式存放数据，通过“键”查找对应的“值”。字典中的“键”必须是唯一不可重复的，“值”可以重复，可以通过唯一的“键”找到对应的“值”。

=== 字典的创建
字典的定义是一组键-值对存放在大括号“{}”中，每个键-值对之间用英文逗号","分割，键和值之间用冒号分隔。字典中的“键”为不可变的，字符串和数字总是可以作为“键”，“值”可以是任意类型的数据，字典的定义格式如下：
  ```python 
  dict1 = {key1:value1,key2:value2,key3:value3,...}
  ```
+ 通过赋值创建字典；
+ 通过dict()函数创建字典；
+ 使用存在的数据创建字典（zip()函数）
  ```python 
  key = (1,2,3,4)
  value = 'abcd'
  # Python中使用zip()函数将可迭代对象作为参数，将对象中对应的元素打包为一个个元组，然很返回由这些元组组成的zip对象 
  dict1 = dict(zip(key,list(value)))
  ```
=== 字典的常用操作方法
字典是可变的，所以和列表一样可以增删改查。字典的常用函数如下:
#table(
  columns: 2,
  stroke: none,
  table.hline(),
  table.header([函数], [描述]),
  table.hline(stroke: 0.5pt),
  [dict.keys()], [返回字典中所有的“键”], 
  [dict.values()], [返回字典中所有的“值”],  
  [dict.items()], [返回字典中所有的键-值对元素], 
  [dict.setdefault(k,default)], [返回字典中k对象的值，如果不存在，则在字典中创建一个“键”为k,“值”为default的元素],
  [dict.copy()],[字典的复制，返回一个新字典],
  [dict.get(k,default)],[获取字典中键k对应的值，如果不存在，则返回给定的默认值],
  [dict.fromkeys(k,v)],[以k为“键”,v为“值”创建字典],
  [dict.update(dict2)],[将字典dict2中的元素更新到字典dict中],
  [dict.pop(k)],[返回字典中指定的“键”为k的对应的“值”，同时删除该键-值对],
  [dict.popitem()],[随机删除字典中一个键-值对，返回被删除的元素],
  [dict.clear()],[清空字典元素],
  table.hline(),
)


=== 字典的访问
字典是无序的，所以不能通过索引位置访问元素，但字典可以通过唯一的“键”进行访问。

- 通过keys()函数访问字典时返回的是字典中所有的键信息，values()返回的是字典中所有值信息，items()函数则返回的是字典键-值对信息——返回信息都存放在一个列表中，可以通过遍历的方式访问。

- 通过get(k,default) 函数返回字典中 k 对应的值，如果不存在，则返回 default ，原字典不变。

== 字典的增加和修改
字典是可变的，可以对字典中的元素进行增加、修改和删除操作。

  + 通过fromkeys(k,v)函数也可以增加以k为“键”，“值”为v的字典元素，其中k是一个不可变的序列（元组），v可以是任意数据类型。
    ```python 
    #fromkeys()函数 
    dict1 = {}
    k = (1,2,3,4)
    v = ["x","y","z"] 
    dict1 = dict1.fromkeys(k,v) #k的元素依次为键，值都为v
    print(dict1) #输出结果为{1: ['x', 'y', 'z'], 2: ['x', 'y', 'z'], 3: ['x', 'y', 'z'], 4: ['x', 'y', 'z']}
    ```
  + setdefault(k,default) 函数可以返回字典中k对应的值，如果不存在，则在字典中创建一个“键”为k,"值"为default的元素。

  + 通过updtae()函数将一个字典中的元素更新到当前字典中，如果与当前字典中的“键”重复，则更新，如果当前字典中不存在该“键”，则添加到当前字典中。

=== 字典的删除 
通过pop(k) 和 popitem() 函数都可以删除字典中的元素，pop(k)用于返回字典中指定的“键”为k对应的“值”，同时删除该键-值对。

popitem()函数用于返回字典中随机的一组键-值对，存在在元组中，同时在原字典中删除该键-值对。

clear()函数可以清除字典所有的元素。

字典也可以使用 del 语句直接删除，通过del删除后，将不能再访问该字典，否则会报 not defined 错误。

== 集合(Set)类型
Python 中的集合是一种无序的、不重复的元素集合。集合中的元素可以是不同类型的数据，集合中的元素是不可变的，不能包含可变对象。集合所有元素都放在一对大括号“{}”内，元素之间用英文逗号“,”分割。可以对集合进行元素的增删改等操作，通过type()函数可知，集合的类型为set。

=== 集合的创建 
+ 通过赋值创建集合  
集合的创建可以使用赋值运算符进行，当集合元素为空时此集合为空集合——但是空集合只能通过 set()函数创建，如果直接用  set1={} 的方式创建出来的就是字典（需要特别注意）。
  ```python
  集合变量名 = {元素1,元素2,元素3,...}
  ```
+ 通过 set()函数创建集合 

通过set()函数可以将字符串、列表、元组等可迭代对象转换为集合，*也可创建空集合*。

```python
# 通过set()函数创建空集合
set1 = set()

# 将字符串转换为集合，会过滤掉重复的元素，顺序随机
set2 = set("hello world")
print(set2) #输出结果为{'e', 'h', 'l', 'o', 'r', 'd', 'w'}

# 将列表转换为集合，会过滤掉重复的元素，顺序随机
set3 = set([1,2,3,4,5,6,7,'a',9,10])
print(set3) #输出结果为{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
```

=== 集合的运算 
集合支持 "|"、"-"、"&"、"^" 四种运算，以集合A和集合B为例，如图所示：
  #image("\附件\set.png",width: 200pt, height: 120pt)
  - 集合A | 集合B：返回集合A和集合B的并集，属于集合A或属于集合B；
  - 集合A - 集合B：返回集合A和集合B的差集，属于集合A，不属于集合B；
  - 集合A & 集合B：返回集合A和集合B的交集，属于集合A并且同时属于集合B；
  - 集合A ^ 集合B：返回集合A和集合B的补集，属于集合A或者属于集合B，但同时不属于A和B的交集。

=== 集合的常用操作方法
集合是无序的，所以无法通过索引访问集合中的元素。集合是可变的，所以和列表一样可以增删改。集合的常用函数如下:

#table(
  columns: 2,
  stroke: none,
  table.hline(),
  table.header([函数], [描述]),
  table.hline(stroke: 0.5pt),
  [set.add(x)], [将元素x添加到集合set中，如果x已经存在，则不添加], 
  [set.copy()], [复制集合set,返回新集合],  
  [set.pop()], [随机返回集合中的任意一个元素，同时将该元素删除，如果集合为空，则抛KeyError异常], 
  [set.remove(x)], [删除集合中指定的x元素，如果x不存在，则抛KeyError异常],
  [set.discard(x)],[删除集合中制定的x元素，如果x不存在，则不抛异常],
  [set.clear()],[删除集合中所有的元素],
  [set.isdisjoin(T)],[判断集合set和集合T中是否存在相同的元素，如果不存在，则返回True，否则返回False],
  [set.issubset(T)],[判断集合set是否是集合T的子集，如果是，则返回True，否则返回False],
  [set.issuperset(T)],[判断集合set是否是集合T的超集，如果是，则返回True，否则返回False],
  table.hline(),
)

+ 集合的访问 
  - 与列表等不同，集合是无序的，所以不能通过索引位置访问元素，但可以通过遍历的方式访问。
  - 集合也可以使用 in 或 not in 操作符来检查元素是否存在于集合中。
  - 可以使用 for 循环遍历集合中的元素。
  - 可以使用 len() 函数获取集合的长度。
  - 可以使用 min() 函数获取集合中的最小值。


= file（文件）的操作
== open()方法
Python 的open()方法用于打开一个文件，并返回文件对象，在对文件进行处理过程中都需要使用到这个函数，如果该文件无法被打开，会抛出 OSError 异常。

* 注意：使用open()方法一定要保证关闭文件对象，即调用close()方法。*

open() 函数常用的形式是接收两个参数：文件名(file)和模式(mode)。

open() 函数的语法格式如下：
```python 
file_object = open(file_name, mode='r', buffering=-1,encoding=None,errors=None,newline=None,closefd=True,opener=None)
```
其中，file_name 是一个字符串，表示要打开的文件名；mode 是一个字符串，表示打开文件的模式,默认为文本模式；buffering 是一个整数，表示文件的缓冲策略，默认为-1，表示使用系统默认的缓冲策略;encoding ：一般使用utf-8; errors：报错级别；newline：区分换行符；closefd：传入的file参数类型;opener：用于自定义打开文件的方式。


== file 对象
file 对象使用open函数创建，以下是file对象常用的函数：
#table(
  columns: 2,
  stroke: none,
  table.hline(),
  table.header([函数], [描述]),
  table.hline(stroke: 0.5pt),
  [file.tell()],[返回文件当前位置], 
  [file.next()],[返回文件下一行],
  [file.read(size)],[从文件读取指定的字节数，如果未给定或为负则读取所有],
  [file.readline(size)],[读取整行，包括"\n"字符],
  [file.readlines(sizehint)],[读取所有行并返回列表，若给定sizeint>0，返回总和大约为sizeint字节的行,实际读取值可能比sizeint较大,因为需要填充缓冲区], 
  [file.write(str)],[将字符串str写入文件],  
  [file.writelines(sequence)],[向文件写入一个序列字符串列表，如果需要换行则要自己加入每行的换行符"\n"],   
  [file.close()],[关闭文件。关闭后文件不能再进行读写操作],
  [file.flush()],[刷新文件内部缓冲，直接把内部缓冲区的数据立刻写入文件,而不是被动的等待输出缓冲区写入],
  [file.seek(offset,from)],[移动文件读取指针到指定位置],
  [file.truncate(size)],[从文件的首行首字符开始截断，截断文件为size个字符，无size表示从当前位置截断],  
  table.hline(),
)


= 处理错误和寻求帮助
当程序运行出错时，需要以下两个步骤找到错误原因：检查回溯信息以及在网上搜索错误信息。

== 理解Python错误信息
=== 检查回溯信息
如果代码抛出异常未被except语句捕获，Python 程序运行崩溃时。Python 会展示异常信息和*回溯*。*回溯*也被成为*调用栈*，它展示了异常在程序中的具体位置，以及引发异常的函数调用链路。
- 只有导致异常的函数调用所在行才会被展示在回溯信息中；
- 回溯给出的行号是Python最终检测到错误的位置，引起Bug的罪魁祸首可能在这行之前。
=== 搜索错误信息
一是使用引号包裹错误信息作为关键词； 二是将python一起作为关键词。三是将错误信息中的关键词用双引号包裹。


== 借助linter避免错误
linter 是一种静态代码分析工具(在不运行的情况下检查源代码，可以识别由错别字引起的拼写错误)，用于检查代码中的错误和潜在问题。它可以帮助开发者在编写代码时发现潜在的错误和问题，从而提高代码质量和可维护性。
Python 中有多个 linter 工具，如 Pylint、Flake8、Pyright 等。这些工具可以通过命令行或集成到 IDE 中使用。


== 寻求编程帮助
在编程过程中，遇到问题时可以通过搜索引擎、社区论坛等渠道寻求编程帮助。
+ 避免：
  - 先询问是否可以提问，而非直接提出问题。
  - 拐弯抹角而非直截了当地提问。
  - 在不适合的论坛或网站上提出问题。
  - 帖子名称或者邮件主题不够具体，比如“我有一个问题”或“求助”这样的主题。
  - 只说程序不能正常工作，但不解释预期的正确行为是什么。
  - 不提供完整的错误信息。
  - 不分享代码。
  - 分享的代码格式不好。
  - 不说明你已经尝试过的方案。
  - 不提供操作系 统或者版本信息。
  - 让人帮你写程序。


+ 建议:
  - 预先提供信息以避免反复补充。
  - 以实际问题的形式陈述问题。
  - 在不适合的论坛或网站上提出问题。
  -  在标题中概述问题。
  - 说明代码的预期目的。
  - 提供完整的错误信息。
  - 分享全部代码，且通过适当的格式增强代码可读性。
  - 告诉帮忙者已经尝试过的方法。
  - 描述操作系统、Python版本、模块版本等设置信息。

= 环境设置和命令行
*环境设置*是指为编写代码而对计算机所做的设置，包括安装必要的工具并修改它们的设置，以及解决这个过程中遇到的问题。

== 文件系统
文件系统体现的是操作系统如何组织文件以便存储和检索文件。文件有两个关键属性：文件名和路径。

=== Python中的路径
在Windows上，文件夹和文件名用反斜杠（\\）分隔；在 macos 和 linux 上，则是使用正斜杠（/）分隔。为使Python 脚本跨平台兼容，可以使用 Pathlib模块和 / 运算符。

导入pathlib的常用方法 `from pathlib import Path`。使用形式是在表达式的最左边输入一个Path对象，在后面使用 / 把Path 对象活字符串连接成一条完整路径。

=== 主目录
所有用户在计算机上都有一个被称为主目录或主文件夹的文件夹，用于存放该用户自己的文件。可通过 `Path.home()` 来获取主目录的Path对象。

=== 当前工作目录
计算机运行的每个程序都有自己的当前工作目录（英文为cwd,是 current working directory的首字母缩写）。可以使用 `Path.cwd()` 函数将 cwd 作为一个Path 对象来获取，并使用 os.chdir() 修改，如果将 cwd 修改到一个不存在的目录，Python 即会报错。

=== 绝对路径额相对路径
指定文件路径有两种方法：
- 绝对路径：以根目录为起点的路径；
- 相对路径：相对于程序的当前工作目录的路径。
  #image("\附件\文件路径.jpg",width: 225pt, height: 180pt)

== 程序和进程
*程序*指的是可以运行的软件应用，如浏览器，Excel等。
*进程*指的是一个程序的运行实例。进程之间是相互独立的，同一个程序的多个进程也是如此。通常情况下，一个命令行内只能同时运行一个进程，但是可以打开多个命令行以同时运行多个进程。

== 命令行
*命令行*是一个基于文本的程序，通过输入命令，可与操作系统进行交互或运行程序。

- 在命令行中输入程序或命令的名称即可运行程序。\
- 使用命令行参数和命令行选项：*命令行参数*是命令名称后输入的其他文本，其作用是为命令提供特定选项或者附加说明。*命令行选项（也叫标志、开关或者简称为选项）*，是使用单字母或短词的命令行参数。在Window上命令行选项通常以正斜杠/开头;在macos或linux上，命令行选项以 - 或 -- 开头。 
- 在命令行中使用 -c 运行 python 代码：在想快速查看单个Python指令结果时，把要运行的代码放在 -c 开关后，用双引号包括起来，可以不进入shell即可输出内容。
- 在Python程序中运行命令：Python的subprocess模块有subprocess.run()函数，可以在Python程序内运行shell命令，将输出作为字符串显示。
```python
import subprocess,locale
proObj = subprocess.run(['ls','-al'],stdout=subprocess.PIPE)
outputStr = proObj.stdout.decode(locale.getdefaultlocale()[1])
print(outputStr)
```