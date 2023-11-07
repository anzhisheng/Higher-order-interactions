function bcratio = f_get_bcratio_average_type2(madj2, madj3, trans_mat, repro_val, n, retime2, retime3, retime4, disc1, disc2)
trans_mat2 = trans_mat ^ 2;
trans_mat0 = trans_mat ^ 0;
index_dict2 = f_index_dict_two(n);
index_dict3 = f_index_dict_three(n);
index_dict4 = f_index_dict_four(n);
[t12, t13, t22, t23, t33] = f_gen_stru_info_average_type2(madj2, madj3, n);

tik1 = 0;
for j = 1: n
    for m = 1: n
        seq = [j, m];
        seq = unique(seq);
        len = length(seq);
        if len == 1
            val = 0;
        else
            index = f_find_index(seq, index_dict2);
            val = retime2(index);
        end
        tik1 = tik1 + repro_val(j) * (t12(m) + t13(m)) * (trans_mat2(j, m) - trans_mat0(j, m)) * val;
    end
end

tik2 = 0;
for j = 1: n
    for m = 1: n
        seq = [j, m];
        seq = unique(seq);
        len = length(seq);
        if len == 1
            val = 0;
        else
            index = f_find_index(seq, index_dict2);
            val = retime2(index);
        end
        tik2 = tik2 + repro_val(j) * (t12(m)/2 + t13(m)/3) * (trans_mat2(j, m) - trans_mat0(j, m)) * val;
    end
end

for j = 1: n
    for m = 1: n
        for j1 = 1: n
            seq = [j, j1];
            seq = unique(seq);
            len = length(seq);
            if len == 1
                val = 0;
            else
                index = f_find_index(seq, index_dict2);
                val = retime2(index);
            end
            tik2 = tik2 + repro_val(j) * (t22(m, j1)/2 + t23(m, j1)/3) * (trans_mat2(j, m) - trans_mat0(j, m)) * val;
        end
    end
end

for j = 1: n
    for m = 1: n
        for j1 = 1: n
            seq = [j, m, j1];
            seq = unique(seq);
            len = length(seq);
            if len == 1
                val = 0;
            elseif len == 2
                index = f_find_index(seq, index_dict2);
                val = retime2(index);
            else
                index = f_find_index(seq, index_dict3);
                val = retime3(index);
            end
            tik2 = tik2 + repro_val(j) * ((disc1-1)*t22(m, j1)/2 + (disc2-1)*t23(m, j1)/3) * (trans_mat2(j, m) - trans_mat0(j, m)) * val;
        end
    end
end

if sum(sum(madj3)) > 0

for j = 1: n
    for m = 1: n
        for j1 = 1: n
            for j2 = 1: n
                seq = [j, j1, j2];
                seq = unique(seq);
                len = length(seq);
                if len == 1
                    val = 0;
                elseif len == 2
                    index = f_find_index(seq, index_dict2);
                    val = retime2(index);
                else
                    index = f_find_index(seq, index_dict3);
                    val = retime3(index);
                end
                seq = [m, j1, j2];
                seq = unique(seq);
                len = length(seq);
                if len == 3
                    index = f_find_index([j1, j2], index_dict2);
                    tik2 = tik2 + repro_val(j) * (disc2-1)*t33(m, index)/6 * (trans_mat2(j, m) - trans_mat0(j, m)) * val;
                end
            end
        end
    end
end

for j = 1: n
    for m = 1: n
        for j1 = 1: n
            for j2 = 1: n
                seq = [j, m, j1, j2];
                seq = unique(seq);
                len = length(seq);
                if len == 1
                    val = 0;
                elseif len == 2
                    index = f_find_index(seq, index_dict2);
                    val = retime2(index);
                elseif len == 3
                    index = f_find_index(seq, index_dict3);
                    val = retime3(index);
                else
                    index = f_find_index(seq, index_dict4);
                    val = retime4(index);
                end
                seq = [m, j1, j2];
                seq = unique(seq);
                len = length(seq);
                if len == 3
                    index = f_find_index([j1, j2], index_dict2);
                    tik2 = tik2 + repro_val(j) * (disc2-1)^2*t33(m, index)/6 * (trans_mat2(j, m) - trans_mat0(j, m)) * val;
                end
            end
        end
    end
end

end

bcratio = tik1 / tik2;
