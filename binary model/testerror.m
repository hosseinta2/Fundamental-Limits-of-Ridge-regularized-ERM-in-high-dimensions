function [error] = testerror(sigma)
num = 0 ;
sz = 1000000 ; 
s = normrnd(0,1,sz,1) ;
fs = (1./(1+exp(-10*s))>rand(sz,1)); %specialized for logistic with r=10
fs = (fs-0.5)*2;
sp = normrnd(0,1,sz,1) ;
num = sum (sign(fs)==sign(s+sigma*sp)) ;
error = 1-num/sz ;
end

