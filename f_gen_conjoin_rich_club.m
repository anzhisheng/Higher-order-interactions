function mat = f_gen_conjoin_rich_club(m1, n1, m2, n2)
size1 = m1+n1; size2 = m2+n2;
size = size1 + size2;
mat = zeros(size, size);
for i = 1: m1
    for j = i+1: size1
        mat(i, j) = 1;
        mat(j, i) = 1;
    end
end

for i = size1+1: (size1+m2)
    for j = i+1: size
        mat(i, j) = 1;
        mat(j, i) = 1;
    end
end

if n1 > 0 && n2 > 0
    for i = 1: m1
        mat(i, size1+i) = 1;
        mat(size1+i, i) = 1;
    end
end


