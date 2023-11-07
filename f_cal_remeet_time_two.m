function [retime, flag]= f_cal_remeet_time_two(trans_mat, n)
index_dict = f_index_dict_two(n);
dict_size = nchoosek(n, 2);
storage_size = n;
id_x_arr = zeros(storage_size, 1); id_y_arr = zeros(storage_size, 1);
val_arr = zeros(storage_size, 1);
b_arr = zeros(dict_size, 1) - 1/2;
tik = 1;
for i = 1: n
    for j = i+1: n
        seq = [i, j];
        index_idx = f_find_index(seq, index_dict);
        id_x_arr(tik) = index_idx;
        id_y_arr(tik) = index_idx;
        val_arr(tik) = -1;
        tik = tik + 1;
        for k = 1: n
            if k == j || trans_mat(i, k) == 0
                continue
            end
            seq = [k, j];
            index_idy = f_find_index(seq, index_dict);
            id_x_arr(tik) = index_idx;
            id_y_arr(tik) = index_idy;
            val_arr(tik) = trans_mat(i, k) / 2;
            tik = tik + 1;
        end
        for k = 1: n
            if k == i || trans_mat(j, k) == 0
                continue
            end
            seq = [i, k];
            index_idy = f_find_index(seq, index_dict);
            id_x_arr(tik) = index_idx;
            id_y_arr(tik) = index_idy;
            val_arr(tik) = trans_mat(j, k) / 2;
            tik = tik + 1;
        end
    end
end

adj_mat = -sparse(id_x_arr, id_y_arr, val_arr, dict_size, dict_size);
clear id_x_arr id_y_arr val_arr index_dict
b_arr = -sparse(b_arr);
[retime, flag] = bicgstab(adj_mat, b_arr);


