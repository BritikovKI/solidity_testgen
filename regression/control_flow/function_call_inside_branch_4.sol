contract Cc4
{
	function f() public pure {
		if (true) {
			address a = g();
			assert(a == address(0));
		}
		if (true) {
			address a = h();
			assert(a == address(0));
		}

	}
	function g() public pure returns (address) {
		address a;
		a = address(0);
		return a;
	}
	function h() public pure returns (address) {
		address a;
		return a;
	}

}
// ====
// SMTEngine: all
// ----
