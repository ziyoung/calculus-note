function test() {
  // 从 a_n 得到 a_{2n}
  function nextEdge(a) {
    return Math.sqrt(2 - 2 * Math.sqrt(1 - (a / 2) ** 2));
  }

  // 正 n 边形的面积（半径 r = 1）
  function polygonArea(n, a) {
    const h = Math.sqrt(1 - (a / 2) ** 2);
    return (n * a * h) / 2;
  }

  // 初始：正六边形
  let n = 6;
  let a = 1; // 正六边形内接单位圆，边长 = 1

  for (let k = 0; k < 15; k++) {
    const area = polygonArea(n, a);
    console.log(`${n}\t${a}\t${area}`);
    a = nextEdge(a);
    n = 2 * n;
  }
}

console.log('--- test ---');
test();

function test2() {
  function nextEdgeStable(a) {
    const x = (a / 2) ** 2;
    return Math.sqrt((2 * x) / (1 + Math.sqrt(1 - x)));
  }

  function polygonArea(n, a) {
    const h = Math.sqrt(1 - (a / 2) ** 2);
    return (n * a * h) / 2;
  }

  let n = 6;
  let a = 1;

  for (let k = 0; k < 25; k++) {
    const area = polygonArea(n, a);
    console.log(`${n}\t${a}\t${area}`);
    a = nextEdgeStable(a);
    n *= 2;
  }
}

console.log('--- test2 ---');
test2();
