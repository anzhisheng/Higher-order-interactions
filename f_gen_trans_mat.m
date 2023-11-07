function trans_mat = f_gen_trans_mat(madj, n)
trans_mat = double(madj);
for i = 1: n
    trans_mat(i, :) = trans_mat(i, :) / sum(trans_mat(i, :));
end