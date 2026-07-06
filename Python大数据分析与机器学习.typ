//导入cuti包，设置中文粗体
#import "@preview/cuti:0.4.0": show-cn-fakebold
#show: show-cn-fakebold
#import "@preview/cetz:0.5.2"


//设置页面样式
#set page(
  paper: "a4",
  margin:(top:1.8cm,rest:1.5cm),
  header: align(right)[
    Python 大数据分析与机器学习商业案例实战
  ],
  numbering: "1/1",
)

#set heading(numbering: "1.")  //设置标题的序号
#set text(font: ("Times New Roman","AR PL UKai"),size:10.5pt)  //分别设置“中文”和English字体
#set enum(numbering: "(1)")  //设置枚举的序号


= 大数据与机器学习


== 机器学习的基本概念

机器学习是强有力的大数据分析工具。机器学习主要分为监督式学习与非监督式学习两大类。两者的区别在于训练数据中是否有*目标变量*（又称为预测变量)。
- 监督式学习训练数据中有特征变量和目标变量。监督式学习主要分为回归分析(Regression)和分类问题（Classification）。
#table(
  columns: (0.8fr,1fr,1fr),
  stroke: 0.5pt,
  table.hline(),
  table.header([监督式学习分类],[特点],[典型案例]),
  [回归分析],[预测内容为连续值],[股价预测（股价是连续变化的值],
  [分类问题],[预测内容为类别值（非连续值）],[股价涨跌预测（只有涨和跌两种值）])

- 非监督式学习主要分为数据聚类与分群 （Clusterubg）与数据降维（Dimension Reductiion）。
#table(
  columns: (0.8fr,1fr,1fr),
  stroke: 0.5pt,
  table.header([非监督式学习分类],[特点],[典型案例]),
  [数据聚类与分群],[将相似的数据进行聚类和分群],[新闻聚类分群模型],
  [数据降维],[降低数据的维度（减少特征变量的数量）],[人脸特征数据降维]
)
- 从机器学习模型角度可将监督式学习和非监督式学习分为如下表所示的不同算法模型。
#table(
  columns: (1fr,1fr),
  table.header([监督式学习模型],[非监督式学习模型]),
  [
    1.线性回归模型 \
    2.逻辑回归模型 \
    3.决策数模型 \
    4.朴素贝叶斯模型 \
    5.K近邻算法(KNN)模型 \ 
    6.随机森林模型 \
    7.AdaBoost 与 GBDT 模型 \
    8.XGBoost 与 LightGBM 模型 \
    9.神经网络明星 
  ],
  [
    1.PCA(主成分分析)模型 \
    2.聚类与分群模型 \
    3.协同过滤算法模型 \
    4.Apriori关联分析模型
  ]
)

= 数据分析库
== NumPy
NumPy库的主要特点是引入了*数组*的概念。
数组与列表类似,但数组能更好支持一些数学运算。如列表不能by元素进行计算，不能转为二维的数据。


== Matplotlib
+ 添加文字说明 \
  使用plt.title()函数为图表添加标题，使用plt.xlabel()和plt.ylabel()函数分别为x轴和y轴添加标签。
+ 添加图例 \
  使用plt.legend()函数给图表添加图例，添加前需要设置好label（标签）参数。
+ 设置双坐标轴 \
  使用plt.twinx()函数创建一个共享x轴的双坐标轴。双坐标轴可以用来显示不同单位的数据。需注意，在绘制双坐标轴时，每绘制一次图表就得添加一次图例，第二个坐标轴的标签和图例需要单独设置。
+ 设置图表大小 \
  使用plt.figure(figsize=(width, height))函数设置图表的大小，width和height分别表示图表的宽度和高度，单位为英寸。
+ 设置x轴刻度的角度 \
  如果x轴的标签过长，可以使用plt.xticks(rotation=angle)函数设置x轴刻度的旋转角度，angle表示旋转的角度，单位为度。
+ 设置中文字体 \ 
  在Matplotlib中显示中文需要设置中文字体。可以使用plt.rcParams['font.sans-serif'] = ['FontName']来设置中文字体，其中FontName是你系统中安装的中文字体名称。常用的中文字体有SimHei（黑体）、Microsoft YaHei（微软雅黑）等。
  还需要设置plt.rcParams['axes.unicode_minus'] = False来解决负号显示为方块的问题。
+ 设置图表样式 \
  Matplotlib提供了多种预设的图表样式，可以使用plt.style.use('style_name')来应用这些样式，其中style_name是预设样式的名称，如'ggplot'、'seaborn'等。应用图表样式可以让你的图表看起来更美观和专业。
+ 绘制多图
  使用plt.subplot()函数可以在同一图表中绘制多个子图。plt.subplot(nrows, ncols, index)函数将图表分成nrows行和ncols列，并在index位置绘制子图。index从1开始，按行优先顺序递增。 \
  该效果利用Matplotlib库的当前图形(figure)和当前坐标轴(axes)的概念实现。每次调用plt.subplot()函数时，Matplotlib会创建一个新的坐标轴对象，并将其设置为当前坐标轴。这样，在同一图表中绘制多个子图时，每个子图都有自己的坐标轴对象，可以独立设置标题、标签、图例等属性。\
  subplots()函数是subplot()函数的一个更高级的版本，可以一次性创建多个子图，并返回一个包含所有子图的数组。使用subplots()函数可以更方便地管理多个子图的布局和属性。
  需要注意的是，在绘制多图时，子图之间可能会有重叠或间距过大的问题，可以使用plt.tight_layout()函数自动调整子图的布局，使其更美观。

== scikit-learn
scikit-learn是一个基于Python的机器学习库，提供了丰富的机器学习算法和工具。

= 线性回归模型
线性回归模型是利用线性拟合的方式探寻数据背后的规律。 \
通过搭建线性回归模型寻找散点（样本点）背后的趋势线（也称回归曲线），再利用回归曲线进行一些简单的预测分析或因果关系分析。 \
在线性回归中，根据特征变量（自变量）来预测反应变量（因变量）。根据特征变量的个数可将线性回归模型分为一元线性回归和多元线性回归。
== 一元线性回归
- 一元线性回归模型又称为简单线性回归模型，其形式可用如下公式表示：
  $
    y = a x + b
  $
  其中，y是因变量，x是自变量，a为回归系数，b为截距。
  数学上，一元线性回归模型是通过最小二乘法（Least Squares Method）来拟合数据的。最小二乘法的目标是找到一条直线，使得所有数据点到这条直线的垂直距离的平方和最小。通过计算回归系数a和截距b，可以得到最佳拟合的直线方程，从而进行预测和分析。


- 一元线性回归模型还有一个进阶版本——*一元多次线性模型*，比较常见的是一元二次线性回归模型，其公式如下：
$
  y = a x^2 + b x + c
$

- 数学上通过最小二乘法来求解系数，Python通过scikit-learn库来实现：
```python
  from sklearn.linear_model import LinearRegression  #引入线性回归模型
  regr = LinearRegression()  #创建线性回归模型对象
  regr.fit(X,Y)  #拟合线性回归模型
  y = regr.predict(a)  #利用线性回归模型进行预测分析
```

== 线性回归模型评估
模型搭建完成后，需要对模型进行评估。线性回归模型的评估指标主要：R-squared (即数学中的R²)，Adj. R-squared (Adjusted R²),P值等。其中R-squared和Adj. R-squared越接近1，说明模型的拟合程度越好。P值越小，说明模型中自变量对因变量的影响越显著。
```python
   import statsmodels.api as sm #引入用于评估线性回归模型的statsmodels库并简写为sm
   X2 = sm.add_constant(X)  #给原来的特征变量X添加常数项，以便于计算截距
   est = sm.OLS(Y,X2).fit()  #拟合线性回归模型
   print(est.summary())  #输出模型评估结果

    
```

== 多元线性回归
多元线性回归模型是指有多个特征变量的线性回归模型，其形式可用如下公式表示：
$
  y = a_1 x_1 + a_2 x_2 + ... + a_n x_n + b 
$
其中，y是因变量，x_1,x_2,...,x_n是不同的特征变量，a_1,a_2,...,a_n为回归系数，b为常数项（截距）。数学上通过最小二乘法来求解系数，Python通过scikit-learn库来实现。 \
多元线性回归模型的搭建也是通过数学计算来获取合适的系数，使得如下残差平方和最小，其中 $y^((i))$是实际值，$hat(y)^((i))$是预测值:
$
  "RSS" = sum(y^((i)) - hat(y)^((i)))^2
$


= 逻辑回归模型
== 算法原理
逻辑回归模型是分类模型，但是由于其算法原理涉及线性回归模型中的线性回归方程，所以名字中含有“回归”二字: \
- 用逻辑回归模型预测某物品属于A类还是B类，本质上预测的是该物品属于A类或B类的概率，而概率的取值范围是 0 \~ 1——因此不能直接用线性回归方程来预测概率，其取值范围为$(-infinity,+infinity)$;
- 逻辑回归模型通过引入一个叫做*sigmoid函数*的函数来将线性回归方程的输出值（即线性回归方程的预测值）转换为概率值。sigmoid函数的公式如下：
  $  
    f(y) = 1 / (1 + e^(-y))
  $

== 逻辑回归模型的代码实现
  ```py
    from sklearn.linear_model import LogisticRegression # 从库中引入逻辑回归模型LogisticRegression
    model = LogisticRegression()  #将逻辑回归模型赋给变量model,没有设置成参数即使用默认参数
    model.fit(X,Y) #用fit()函数进行模型训练

    model.predict([[2,2]])  #用模型的predict()函数进行预测，predict()函数默认接收一个多维数据，因此是两个中括号
  ```
== 客户流失预警模型
客户流失预警模型用于预测客户是否会流失，属于二分类问题，在金融、电信、娱乐游戏等行业有广泛应用。 

 == 模型的搭建与使用
  + 导入数据
  + 数据预处理\
    在进行模型训练前，需要对数据进行预处理，主要包括数据清洗、数据转换、特征选择等步骤。数据清洗包括处理缺失值、异常值等；数据转换包括对数据进行标准化、归一化等操作；特征选择包括选择对模型有重要影响的特征变量，去除冗余的特征变量等。
  + 划分训练集和测试集 \
    进行模型训练前需要将数据划分为*训练集和测试集*，训练集用于模型的训练，测试集用于评估模型的性能。常用的划分方法是使用scikit-learn库中的train_test_split函数，该函数可以随机划分数据集，并且可以设置划分比例和随机种子。
    ```python
    from sklearn.model_selection import train_test_split
    X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size=0.2, random_state=42)  #random_state是随机种子，保证每次划分的结果相同;test_size是测试集的比例，0.2表示20%的数据作为测试集，80%的数据作为训练集
    ```
  + 模型训练
  + 模型评估

== 模型评估方法
对于二分类模型，主流的评估方法有ROC曲线、KS曲线两种。
=== ROC曲线
在实际业务中，我们关心模型的两个指标：
#table(
  columns: (auto,auto,1fr),
  table.header([指标],[含义],[计算公式]),
  [TPR(True Positive Rate)],[命中率（真正率，表示模型预测为正样本的比例）],[TPR = TP / (TP + FN)],
  [FPR(False Positive Rate)],[假警报率（假正率，表示模型预测为负样本的比例）],[FPR = FP / (FP + TN)]
)
其中TP,FP,FN,TN的含义见下表（混淆矩阵）：
#table(
  columns: (1fr,auto,auto,1fr),
  table.header([],[预测流失],[预测不流失],[合计]),
  [实际流失],[TP(True Positive)正确肯定],[FN(False Negative)漏报],[TP + FN],
  [实际不流失],[FP(False Positive)虚报],[TN(True Negative)正确否定],[FP + TN],
)

命中率计算的是所有实际流失（分类为1）的客户中被预测为流失的客户所占的比例，也称真正率或召回率；而假警报率计算的是所有实际未流失的客户中被预测未流失的客户的比例。
$
  "命中率(TPR)" = "预测为流失且实际流失的客户"/"实际流失的客户"\
  "假警报率(FPR)" = "预测为流失但实际为流失的客户"/"实际未流失的客户" 
$
优秀的客户流失模型，命中率应尽可能高，同时假警报率尽可能低，但两者往往成正相关，如果调整阈值导致假警报率很低，则命中率也很低。因此，为了衡量一个模型的优劣，数据科学家根据不同阈值下的命中率和假警报率绘制*ROC曲线*。
#image("附件/roc.png",height:160pt)

=== KS曲线 
KS曲线与ROC曲线本质上是相同的，同样关注命中率(TPR)和假警报率(FPR)，区别在于ROC曲线将警报率(FPR)作为横坐标，将命中率(TPR)作为纵坐标；*KS曲线*将阈值作为横坐标，将*命中率(TPR)与假警报率(FPR)之差*作为纵坐标。
#image("附件/KS曲线.png",height:160pt)
和ROC曲线一样，除可视化图形外，还需一个可量化指标来衡量模型预测效果，KS曲线对应的是KS值，KS全称为Kolmogorov-Smirnov，其计算公式如下：
$
  "KS" = max("TPR" - "FPR")
$
即KS值是KS曲线的峰值。KS值越大，说明模型在正样本和负样本上的区别能力越强，模型的性能越好；
