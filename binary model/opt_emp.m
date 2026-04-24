n = 100 ; 
delta = 8;
m = delta * n ; 
r= 0.003 ;
sz = 0.06;
 
iterations = 1000 ; % number of GD iterations
i=1;
coeff0 = normrnd(0,1,[n,1]);
coeff0 = coeff0 / norm (coeff0);
for i=1:50
    y = zeros(1,m) ; % observarions
    x = 2*binornd(1,0.5,[n,m])-1 ; % measurement vectors
    y = sign(coeff0'*x) ;
       
    coeff = zeros(n,1) ; % estimated paramter 
 for N = 1: iterations
    coeff = coeff - sz * (1/m * x* (y' .* (lprime_sg_eight(y' .* (x' *coeff) ) ) )+r*coeff) ;
 end
    err(i) = (norm(coeff - coeff0'*coeff*coeff0)/(coeff0'* coeff))^2;
end
mean(err)