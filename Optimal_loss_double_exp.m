n = 100 ; % dimension
delta = 8 ;
m = delta * n ; % number of samples
Num = 50 ;
r = 0.1393 ; % r_{opt}
i = 1;
szs = [0.008,0.01,0.02,0.04,0.06,0.08,0.1:0.3:1];
alphasq = zeros (length(szs),Num);

finalalpha = zeros(size(szs))';
for sz = szs % step size
for num = 1:Num

x = 2*binornd(1,0.5,[n,m])-1 ; % measurement vectors
ex = exprnd(1,[m,1]);
ber =rand(m,1);
z = (2*(ber<0.5)-1).*ex;

iterations = 1000 ; % number of GD iterations
coeff0 = normrnd(0,1,[n,1]) ; % estimated paramter
coeff0 = coeff0/norm(coeff0);
y = x'*coeff0 + z;
coeff = normrnd(0,1,[n,1]); % initial value for coeff in GD
for N = 1: iterations
   coeff = coeff -  sz * (1/n * x * l_prime_opt_double_exp_deight((x' *coeff)-y )  + r*coeff) ;
end
alphasq(i,num) = (norm(coeff-coeff0))^2;

end
finalalpha(i) = mean(alphasq(i,:)) 
i = i+1;
end
min(finalalpha)