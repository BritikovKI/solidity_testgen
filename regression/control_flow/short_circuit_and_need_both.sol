contract cs4 {
	uint x;
	function f() internal returns (uint) {
		x = x + 1;
		return x;
	}
	function g() public returns (bool) {
		x = 0;
		bool b = (f() > 0) && (f() > 0);
		assert(x == 2);
		assert(b);
		return b;
	}
}
// ====
// SMTEngine: all
// ----
