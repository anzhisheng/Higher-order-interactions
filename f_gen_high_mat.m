function high_mat = f_gen_high_mat(madj, n)
size = nchoosek(n, 2);
index_dict = f_index_dict_two(n);
high_mat = zeros(n, size);
for i = 1: n
    for j = 1: size
        idx = index_dict(j, 1); idy = index_dict(j, 2);
        high_mat(i, j) = madj(i, idx) * madj(idx, idy) * madj(idy, i);
    end
end