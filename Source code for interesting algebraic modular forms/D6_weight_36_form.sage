from weilrep.weilrep.amf import AlgebraicModularForm, AlgebraicModularFormEigenform

B = matrix([[1, 1, 0, 0, 0, 0], [0, 1, 1, 0, 0, 0], [0, 0, 1, 1, 0, 0], [0, 0, 0, 1, 1, 0], [0, 0, 0, 0, 1, 1], [0, 0, 0, 0, 1, -1]])
S = matrix(ZZ, B * B.transpose())
R.<x1, x2, x3, x4, x5, x6> = PolynomialRing(QQ)
X = [sum(x**k for x in R.gens()) for k in [2, 4, 6, 8, 10, 12]]
X = [f(*(B.transpose() * vector(R.gens()))) for f in X]
M = matrix([x.gradient() for x in X])
m = AlgebraicModularForms(S)
f = lambda v1, v2, v3, v4, v5, v6: matrix(6, 6, [a(v1, v2, v3, v4, v5, v6) for a in M.list()]).determinant()
h = AlgebraicModularForm(m, [f], 36, spin = 1, det = -1)
h.base_field = lambda:QQ
h.__class__ = AlgebraicModularFormEigenform
h._AlgebraicModularFormEigenform__field = QQ
