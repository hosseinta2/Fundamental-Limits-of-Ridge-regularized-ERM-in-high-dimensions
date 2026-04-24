n = 100 ; 
delta = 8;
m = delta * n ; 
r= 0.003 ;
sz = 0.06;
 
iterations = 1000 ; % number of GD iterations
i=1;
for i=1:50
    y = zeros(1,m) ; % observarions
    x = normrnd(0,1,[n,m]) ; % measurement vectors
    y = sign(x(1,:)) ;
       
    coeff = zeros(n,1) ; % estimated paramter 
 for N = 1: iterations
    coeff = coeff - sz * (1/m * x* (y' .* (lprime_sg_eight(y' .* (x' *coeff) ) ) )+r*coeff) ;
 end
    err(i) = (norm(coeff(2:end))/coeff(1))^2;
end
mean(err)