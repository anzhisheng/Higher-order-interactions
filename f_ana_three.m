function val = f_ana_three(leaf_num, disc2)
N = leaf_num;
f1 = 18 *N *(-7+12 *N) *(2+23 *N+14 *N^2) *(11+67 *N+38 *N^2);
f2 = (-1+N);
f3 = -66-473 *N+9779 *N^2+61836 *N^3+67012 *N^4+20192 *N^5;
f4 = 42+1253 *N+9617 *N^2+10772 *N^3+3276 *N^4;
f5 = 66+2201 *N+17533 *N^2+39852 *N^3+31436 *N^4+8032 *N^5;
val = f1 / (f2 * (f3 + 6*N*disc2*f4 + disc2^2*f5));