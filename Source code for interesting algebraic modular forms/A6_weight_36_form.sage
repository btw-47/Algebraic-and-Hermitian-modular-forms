from weilrep.weilrep.amf import AlgebraicModularForm, AlgebraicModularFormEigenform

S = CartanMatrix(['A', 6])
R.<x1, x2, x3, x4, x5, x6> = PolynomialRing(QQ)
A = [x1, x2 - x1, x3 - x2, x4 - x3, x5 - x4, x6 - x5, -x6]
X = [sum(x**k for x in A) for k in [2, 3, 4, 5, 6, 7]]
M = matrix([x.gradient() for x in X])
m = AlgebraicModularForms(S)
f = lambda v1, v2, v3, v4, v5, v6: matrix(6, 6, [a(v1, v2, v3, v4, v5, v6) for a in M.list()]).determinant()
h = AlgebraicModularForm(m, [f], 21, spin = 7, det = -1)
h.base_field = lambda:QQ
h.__class__ = AlgebraicModularFormEigenform
h._AlgebraicModularFormEigenform__field = QQ