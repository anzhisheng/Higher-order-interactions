function index_dict_three = f_index_dict_three(n)
order = 3;
num_of_index = nchoosek(n, order);
index_dict_three = zeros(num_of_index, order);
tik = 1;
for i = 1: n
    for j = i+1: n
        for k = j+1: n
            index_dict_three(tik, 1) = i;
            index_dict_three(tik, 2) = j;
            index_dict_three(tik, 3) = k;
            tik = tik + 1;
        end
    end
end
