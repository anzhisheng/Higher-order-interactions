function mat = f_gen_conjoin_well_mixed(n1, n2)
size = n1 + n2;
mat = zeros(size, size);
for i = 1: n1
    for j = i+1: n1
        mat(i, j) = 1;
        mat(j, i) = 1;
    end
end

for i = n1+1: size
    for j = i+1: size
        mat(i, j) = 1;
        mat(j, i) = 1;
    end
end

if n1 > 0 && n2 > 0
    mat(1, n1+1) = 1;
    mat(n1+1, 1) = 1;
end
