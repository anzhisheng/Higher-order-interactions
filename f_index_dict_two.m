function index_dict_two = f_index_dict_two(n)
order = 2;
num_of_index = nchoosek(n, order);
index_dict_two = zeros(num_of_index, order);
tik = 1;
for i = 1: n
    for j = i+1: n
        index_dict_two(tik, 1) = i;
        index_dict_two(tik, 2) = j;
        tik = tik + 1;
    end
end
