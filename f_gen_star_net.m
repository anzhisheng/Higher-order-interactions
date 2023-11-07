function mat = f_gen_star_net(n)
size = 2 * n + 1;
mat = zeros(size, size);
for i = 1: size
    if i == 1
        for j = i+1: size
            mat(i, j) = 1;
            mat(j, i) = 1;
        end
    else
        if mod(i, 2) == 0
            mat(i, i+1) = 1;
            mat(i+1, i) = 1;
        end
    end
end
