mi = ones(4096);
n=4;
mat = [1 2 3; 4 5 6; 7 8 9];
mat_z = zero_interp(mat, n);
%m2z = zero_fill_interp(m2, n);
%zfm = zero_fill_interp(mi, 4);


kernel = ones(1, 2*n-1);
x=1;
for i=1:size(kernel,2)
    kernel(i)=x;
    if i<n
        x = x+1;
    elseif i>=n
        x = x-1;
    end
end
kernel = kernel/n;

peg = kernel.'*kernel;

mat_l = conv2(peg, zero_fill_interp(mat, n));
