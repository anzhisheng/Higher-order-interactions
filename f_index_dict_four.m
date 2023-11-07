function index_dict_four = f_index_dict_four(n)
order = 4;
num_of_index = nchoosek(n, order);
index_dict_four = zeros(num_of_index, order);
tik = 1;
for i = 1: n
    for j = i+1: n
        for k = j+1: n
            for l = k+1: n
                index_dict_four(tik, 1) = i;
                index_dict_four(tik, 2) = j;
                index_dict_four(tik, 3) = k;
                index_dict_four(tik, 4) = l;
                tik = tik + 1;
            end
        end
    end
end
