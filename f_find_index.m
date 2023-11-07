function serial_num = f_find_index(seq, index_dict)
seq = sort(seq);
size_record = size(index_dict);
len = size_record(1);
serial_num = -1;
for i = 1: len
    norm_seq = index_dict(i, :);
    if isequal(seq, norm_seq)
        serial_num = i;
        break
    end
end