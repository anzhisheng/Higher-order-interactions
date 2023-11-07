function replace_mat = f_gen_raplace_mat(madj2, madj3, n)
replace_mat = zeros(n, n);
high_link_num = nchoosek(n, 2);
index_dict = f_index_dict_two(n);
for i = 1: n
    for j = 1: high_link_num
        if madj3(i, j) > 0
            idx = index_dict(j, 1); idy = index_dict(j, 2);
            replace_mat(i, idx) = replace_mat(i, idx) + 1;
            replace_mat(i, idy) = replace_mat(i, idy) + 1;
        end
    end
end
replace_mat = replace_mat + madj2;