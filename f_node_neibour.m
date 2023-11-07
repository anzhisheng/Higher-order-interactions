function [neibour_record, number_record] = f_node_neibour(madj, n)
number_record = zeros(1, n);
neibour_record = zeros(n, n) - 1;
for i = 1 : n
    for j = i : n
        if madj(i, j) > 0
            number_record(i) = number_record(i) + 1; 
            number_record(j) = number_record(j) + 1;
            neibour_record(i, number_record(i)) = j;
            neibour_record(j, number_record(j)) = i;
        end
    end
end