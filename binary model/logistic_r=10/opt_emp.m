n = 100 ; 
delta = 8 ;
m = delta * n ; 
Num = 10 ;

la = 0.001;


iterations = 2000 ; % number of GD iterations
i= 1 ;
coeff0 = normrnd(0,1,[n,1]);
coeff0 = coeff0 / norm (coeff0);
i = 1 ;
for ave = 1: Num

coeff = normrnd(0,1,n,1) ; % estimated paramter 
x = normrnd(0,1,[n,m]) ; % measurement vectors
randomvector = rand(1,m);
y = (randomvector>1./(1+exp(10*coeff0'*x))) - (randomvector<1./(1+exp(10*coeff0'*x)));
for alpha = [.1]

for N = 1: iterations
   coeff = coeff - alpha * (1/m*x* (y' .* lprime_log_eight(y' .* (x' *coeff) ) ) + la*(coeff))  ;
    
end
    err(i) = testerror(norm(coeff - coeff0'*coeff*coeff0)/(coeff0'* coeff));
i= i +1 ;
end
end

mean(err)



