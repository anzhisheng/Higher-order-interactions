function [t12, t13, t22, t23, t33] = f_gen_stru_info_average_type2(madj2, madj3, n)
t12 = zeros(n, 1); t13 = zeros(n, 1);
t22 = zeros(n, n); t23 = zeros(n, n);
size = nchoosek(n, 2);
t33 = zeros(n, size);
index_dict = f_index_dict_two(n);

for i = 1: n
    if sum(madj2(i, :)) > 0
        t12(i) = sum(madj2(i, :)) / sum(madj2(i, :));
    end
    if sum(madj3(i, :)) > 0
        t13(i) = sum(madj3(i, :)) / sum(madj3(i, :));
    end
end

for i = 1: n
    for j = 1: n
        if sum(madj2(i, :)) > 0
            t22(i, j) = madj2(i, j) / sum(madj2(i, :));
        end
    end
end

for i = 1: n
    for j = 1: size
        if madj3(i, j) > 0 && sum(madj3(i, :)) > 0
            idx = index_dict(j, 1); idy = index_dict(j, 2);
            t23(i, idx) = t23(i, idx) + 1 / sum(madj3(i, :));
            t23(i, idy) = t23(i, idy) + 1 / sum(madj3(i, :));
        end
    end
end

for i = 1: n
    for j = 1: size
        if madj3(i, j) > 0 && sum(madj3(i, :)) > 0
            t33(i, j) = madj3(i, j) / sum(madj3(i, :));
        end
    end
end
