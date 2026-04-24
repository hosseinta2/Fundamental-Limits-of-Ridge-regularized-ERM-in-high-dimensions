function [error] = testerror(sigma) % test error of logistic model in terms of sigma with r=10
error = zeros (size(sigma));
for i = 1:length(sigma)
num = 0 ;
sz = 1000000 ; 
s = normrnd(0,1,sz,1) ;
fs = (1./(1+exp(-10*s))>rand(sz,1));
fs = (fs-0.5)*2;
sp = normrnd(0,1,sz,1) ;
num = sum (sign(fs)==sign(s+sigma(i)*sp)) ;
error(i) = 1-num/sz ;
end
end

