function W = Huftref(A)
k = 1;
Y = sort(A);
n = length(A);
B = Y(1) + Y(2);
W = [Y(1) Y(2) B];
Y1 = Y;
m = 0;
while m == 0
    k = k + 1;
    B1 = [B Y1(3 : length(Y1))];
    f = length(B1);
    if f >= 2
        Y1 = sort(B1);
        B = Y1(1) + Y1(2);
        W(k,:) = [Y1(1) Y1(2) B];
    else
        m = 1;
    end
end 
end