分匀和精四字来领悟微积分核心思想

```
import graph;
size(8cm);

// Parameters
real R = 4;
real x0 = 2.2;
real dx = 0.4;
real y0 = sqrt(R^2 - x0^2);

// Axes
draw((-R-1,0)--(R+1,0), Arrow);
draw((0,-R-1)--(0,R+1), Arrow);
label("$x$", (R+1,0), E);
label("$y$", (0,R+1), N);

// Circle
draw(circle((0,0), R));

// Upper differential element
filldraw(
  (x0,0)--(x0,y0)--(x0+dx,y0)--(x0+dx,0)--cycle,
  lightblue,
  blue
);

// Lower differential element
filldraw(
  (x0,0)--(x0,-y0)--(x0+dx,-y0)--(x0+dx,0)--cycle,
  lightblue,
  blue
);

// x indication
draw((0,0)--(x0,0), dashed);
label("$x$", (x0/2,0), S);

// dx annotation above the differential element
real ydx = y0 + 0.4;
draw(
  (x0,ydx)--(x0+dx,ydx),
  Arrow(TeXHead)
);
draw(
  (x0+dx,ydx)--(x0,ydx),
  Arrow(TeXHead)
);
label("$dx$", (x0+dx/2,ydx), N);

// Radius (subtle)
draw((0,0)--(x0,y0), dashed);
label("$R$", (x0/2,y0/2), NE);

```

早期牛顿发明微积分的诉求之一便是去求解不规则图形的面积。在上一讲中，使用极限的方式给出圆面积公式。但是考虑到圆还是一个相对比较规则图形，假设要计算任意曲线与 $x$ 轴围成的面积，使用极限的方式是比较困难的。

为了求解任意曲线与 $x$ 轴围成的面积，我们需要引入积分的概念。积分的定义是曲线下的面积，而不是曲线与 $x$ 轴围成的面积。因此，积分的概念是对曲线下面积的一种抽象，它可以用来求解任意曲线与 $x$ 轴围成的面积。

## 第一步：分

假设我们需要计算曲线 $y=f(x)$ 与 $[a, b]$ 围成的面积，将区间 $[a, b]$ 任意分割成 $n$ 个小区间 $[x_i, x_{i+1}]$，其中

$$
a = x_0 < x_1 < \cdots < x_n = b
$$

每个小区间的长度为 $\delta x_i = x_{i+1} - x_i$。切分之后，保证每个小区间的长度 $\delta x_i$ 都趋近于 $0$。

写成表达式就是：

$$
\max\{\Delta x_i\} \to 0
$$

> 以上的教科书给出严谨的定义。如果抛弃严谨的定义，将区间 $[a, b]$ 等分成 $n$ 个小区间，每个小区间的长度为 $\Delta x = \frac{b - a}{n}$。

## 第二步：匀

当拆分之后的区间足够小时，$f(x)$ 与 $x$ 轴围成的面积就可以近似地用矩形来代替。在每个小区间 $[x_i, x_{i+1}]$ 中，$f(x)$ 的值可以用 $f(x_i)$ 或 $f(x_{i+1})$ 来近似。

> 取 $f(x_i)$ 与 $f(x_{i+1})$ 中的任意值计算都可以，应该来说，哪个计算方便，哪个可以让式子更加简明，就选择哪个。

## 第三步：和

将每个小区间的面积求和，就可以得到曲线 $y=f(x)$ 与 $[a, b]$ 围成的面积。

写成表达式就是：

$$
f(x_1)\cdot \Delta x_1 + f(x_2)\cdot \Delta x_2 + \cdots + f(x_n)\cdot \Delta x_n = \sum_{i=0}^{n-1} f(x_i) \Delta x_i
$$


## 第四步：精

第三步的求和根本不是目的，写成和式之后，会遇到这几个问题：

- $\Delta x_i$ 要小到什么程度？
- $f(x_i)$ 的值好计算吗？
- $\sum f(x_i) \Delta x_i$ 在没有通项公式的情况下，是否可以计算？
- 计算之后，我们无法得到精确值，只能得到一个近似值。

因此，我们需要引入积分的概念，将和式中的 $\Delta x_i$ 替换为 $dx$，使用新的积分符号 $\int$ 来表示该过程，写成表达式就是：

$$
\int_a^b f(x) \, dx = \lim_{n \to \infty} \sum_{i=0}^{n-1} f(x_i) \Delta x_i
$$

注意到 $\sum$ 左侧的 $\lim_{n \to \infty}$，我们是在求**极限**而非求和。如果只是求和的话，那微积分也谈重大进步，否则就跟两千多年的古希腊人没有本质的区别了！

为了计算这个极限，人们将积分计算转换成寻找原函数的过程。微积分基本定理告诉我们上述求和的极限值为原函数在 $[a, b]$ 上的积分值，即

$$
\int_a^b f(x) \, dx = F(b) - F(a)
$$

其中 $F(x)$ 是 $f(x)$ 的原函数。
