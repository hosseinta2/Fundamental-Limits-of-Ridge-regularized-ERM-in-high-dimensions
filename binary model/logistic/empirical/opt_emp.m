n = 100 ; 
delta = 6 ;
m = delta * n ; 
Num = 50 ;

la = 0.0669;


iterations = 2000 ; % number of GD iterations
i = 1 ;

for ave = 1: Num
i = 1 ;
coeff = normrnd(0,1,n,1) ; % estimated paramter 
x =  binornd(1,0.5,[n,m])*2-1 ; % measurement vectors
randomvector = rand(1,m);
y = (randomvector>1./(1+exp(x(1,:)))) - (randomvector<1./(1+exp(x(1,:))));
for alpha = [.1]

for N = 1: iterations
   coeff = coeff - alpha * (1/m*x* (y' .* lprime_log_six(y' .* (x' *coeff) ) ) + la*(coeff))  ;
    
end
sigma(ave,i) = norm(coeff(2:end))/coeff(1);
i= i +1 ;
end
end

mean(min(sigma,[],2)).^2



