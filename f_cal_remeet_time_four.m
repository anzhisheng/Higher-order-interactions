function [retime] = f_cal_remeet_time_four(trans_mat, retime2, retime3, n)
index_dict_two = f_index_dict_two(n);
index_dict_three = f_index_dict_three(n);
index_dict_four = f_index_dict_four(n);
dict_size = nchoosek(n, 4);
storage_size = 1;
id_x_arr = zeros(storage_size, 1); id_y_arr = zeros(storage_size, 1);
val_arr = zeros(storage_size, 1);
b_arr = zeros(dict_size, 1) - 1/4;
tik1 = 1;
tik2 = 1;
for i = 1: n
    for j = i+1: n
        for k = j+1: n
            for g = k+1: n
                index_idx = tik1;
                id_x_arr(tik2) = index_idx;
                id_y_arr(tik2) = index_idx;
                val_arr(tik2) = -1;
                tik2 = tik2 + 1;
                for l = 1: n
                    if trans_mat(i, l) == 0
                        continue
                    end
                    seq = [l, j, k, g];
                    seq = unique(seq);
                    len = length(seq);
                    if len == 1
                        continue
                    elseif len == 2
                        index = f_find_index(seq, index_dict_two);
                        val = retime2(index) * trans_mat(i, l) / 4;
                        b_arr(tik1) = b_arr(tik1) - val;
                    elseif len == 3
                        index = f_find_index(seq, index_dict_three);
                        val = retime3(index) * trans_mat(i, l) / 4;
                        b_arr(tik1) = b_arr(tik1) - val;
                    else
                        index_idy = f_find_index(seq, index_dict_four);
                        id_x_arr(tik2) = index_idx;
                        id_y_arr(tik2) = index_idy;
                        val_arr(tik2) = trans_mat(i, l) / 4;
                        tik2 = tik2 + 1;
                    end
                end
                for l = 1: n
                    if trans_mat(j, l) == 0
                        continue
                    end
                    seq = [i, l, k, g];
                    seq = unique(seq);
                    len = length(seq);
                    if len == 1
                        continue
                    elseif len == 2
                        index = f_find_index(seq, index_dict_two);
                        val = retime2(index) * trans_mat(j, l) / 4;
                        b_arr(tik1) = b_arr(tik1) - val;
                    elseif len == 3
                        index = f_find_index(seq, index_dict_three);
                        val = retime3(index) * trans_mat(j, l) / 4;
                        b_arr(tik1) = b_arr(tik1) - val;
                    else
                        index_idy = f_find_index(seq, index_dict_four);
                        id_x_arr(tik2) = index_idx;
                        id_y_arr(tik2) = index_idy;
                        val_arr(tik2) = trans_mat(j, l) / 4;
                        tik2 = tik2 + 1;
                    end
                end
                for l = 1: n
                    if trans_mat(k, l) == 0
                        continue
                    end
                    seq = [i, j, l, g];
                    seq = unique(seq);
                    len = length(seq);
                    if len == 1
                        continue
                    elseif len == 2
                        index = f_find_index(seq, index_dict_two);
                        val = retime2(index) * trans_mat(k, l) / 4;
                        b_arr(tik1) = b_arr(tik1) - val;
                    elseif len == 3
                        index = f_find_index(seq, index_dict_three);
                        val = retime3(index) * trans_mat(k, l) / 4;
                        b_arr(tik1) = b_arr(tik1) - val;
                    else
                        index_idy = f_find_index(seq, index_dict_four);
                        id_x_arr(tik2) = index_idx;
                        id_y_arr(tik2) = index_idy;
                        val_arr(tik2) = trans_mat(k, l) / 4;
                        tik2 = tik2 + 1;
                    end
                end
                for l = 1: n
                    if trans_mat(g, l) == 0
                        continue
                    end
                    seq = [i, j, k, l];
                    seq = unique(seq);
                    len = length(seq);
                    if len == 1
                        continue
                    elseif len == 2
                        index = f_find_index(seq, index_dict_two);
                        val = retime2(index) * trans_mat(g, l) / 4;
                        b_arr(tik1) = b_arr(tik1) - val;
                    elseif len == 3
                        index = f_find_index(seq, index_dict_three);
                        val = retime3(index) * trans_mat(g, l) / 4;
                        b_arr(tik1) = b_arr(tik1) - val;
                    else
                        index_idy = f_find_index(seq, index_dict_four);
                        id_x_arr(tik2) = index_idx;
                        id_y_arr(tik2) = index_idy;
                        val_arr(tik2) = trans_mat(g, l) / 4;
                        tik2 = tik2 + 1;
                    end
                end
            tik1 = tik1 + 1;
            end
        end
    end
end

adj_mat = -sparse(id_x_arr, id_y_arr, val_arr, dict_size, dict_size);
clear id_x_arr id_y_arr val_arr index_dict
b_arr = -sparse(b_arr);
retime = bicgstab(adj_mat, b_arr, [], 10^5);


