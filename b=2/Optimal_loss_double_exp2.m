n = 100 ; % dimension
delta = 16;
m = delta * n ; % number of samples
Num = 50 ;
r = .2470 ; % r_{opt}
i= 1;
szs= [.008,0.01,0.02,0.04,0.06,0.08,0.1:0.3:1];
alphasq = zeros (length(szs),Num);

finalalpha = zeros(size(szs))';
for sz = szs % step size
for num = 1:Num

x = normrnd(0,1,[n,m]) ; % measurement vectors
ex = exprnd(1,[m,1]);
ber =rand(m,1);
z = 2*(2*((ber<0.5)-.5)).*ex;

iterations = 1000 ; % number of GD iterations
coeff0 = normrnd(0,1,[n,1]) ; % estimated paramter
coeff0 = coeff0/norm(coeff0);
y = x'*coeff0 + z;
coeff = normrnd(0,1,[n,1]); % initial value for coeff in GD
for N = 1: iterations
   coeff = coeff -  sz * (1/n * x * l_prime_opt_double_exp2_dsixteen((x' *coeff)-y )  + r*coeff) ;
end
alphasq(i,num) = (norm(coeff-coeff0))^2;

end
finalalpha(i) = mean(alphasq(i,:)) 
i = i+1;
end
min(finalalpha)