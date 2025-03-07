contract Av3 {
	int x;
}

contract Bv3 is Av3 {
	int y;
	constructor (int a) {
		if (a >= 0) {
			y = 1;
			return;
		}
		x = 1;
		y = 2;
	}
}

contract Cv3 is Av3 {
	int z;
	constructor (int a) {
		if (a >= 0) {
			z = 1;
			return;
		}
		x = -1;
		z = 2;
	}
}

contract D1v3 is Bv3, Cv3 {
	constructor() Bv3(1) Cv3(1) {
		assert(x == 0); // should hold
		assert(x == 1); // should fail
		assert(x == -1); // should fail
	}
}

contract D2v3 is Bv3, Cv3 {
	constructor() Bv3(1) Cv3(-1) {
		assert(x == 0); // should fail
		assert(x == 1); // should fail
		assert(x == -1); // should hold (constructor of C is executed AFTER constructor of B)
	}
}

contract D3v3 is Bv3, Cv3 {
	constructor() Bv3(-1) Cv3(1) {
		assert(x == 0); // should fail
		assert(x == 1); // should hold
		assert(x == -1); // should fail
	}
}

contract D4v3 is Bv3, Cv3 {
	constructor() Bv3(-1) Cv3(-1) {
		assert(x == 0); // should fail
		assert(x == 1); // should fail
		assert(x == -1); // should hold (constructor of C is executed AFTER constructor of B)
	}
}
// ====
// SMTEngine: all
// ----
// Warning 6328: (337-351): CHC: Assertion violation happens here.\nCounterexample:\nz = 1, y = 1, x = 0\n\nTransaction trace:\nD1.constructor()
// Warning 6328: (370-385): CHC: Assertion violation happens here.\nCounterexample:\nz = 1, y = 1, x = 0\n\nTransaction trace:\nD1.constructor()
// Warning 6328: (460-474): CHC: Assertion violation happens here.\nCounterexample:\nz = 2, y = 1, x = (- 1)\n\nTransaction trace:\nD2.constructor()
// Warning 6328: (493-507): CHC: Assertion violation happens here.\nCounterexample:\nz = 2, y = 1, x = (- 1)\n\nTransaction trace:\nD2.constructor()
// Warning 6328: (670-684): CHC: Assertion violation happens here.\nCounterexample:\nz = 1, y = 2, x = 1\n\nTransaction trace:\nD3.constructor()
// Warning 6328: (736-751): CHC: Assertion violation happens here.\nCounterexample:\nz = 1, y = 2, x = 1\n\nTransaction trace:\nD3.constructor()
// Warning 6328: (827-841): CHC: Assertion violation happens here.\nCounterexample:\nz = 2, y = 2, x = (- 1)\n\nTransaction trace:\nD4.constructor()
// Warning 6328: (860-874): CHC: Assertion violation happens here.\nCounterexample:\nz = 2, y = 2, x = (- 1)\n\nTransaction trace:\nD4.constructor()
