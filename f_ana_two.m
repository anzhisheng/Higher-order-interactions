function val = f_ana_two(leaf_num, disc1)
n = leaf_num;
f1 = (36 * n * (-7+12*n) * (2+23*n+14*n^2));
f2 = 2 * (6-29*n-1267*n^2+818*n^3+1057*n^4)+disc1*(-12-338*n-1534*n^2+1181*n^3+1288*n^4);
val = f1 / f2;
