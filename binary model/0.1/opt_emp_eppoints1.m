n = 100 ; 
delta = 8;
m = delta * n ; 
r = 0.012;
szs = [0.04];
 
iterations = 1000 ; % number of GD iterations

for sz = szs
for i=1:50
    y = zeros(1,m) ; % observarions
    x = normrnd(0,1,[n,m]) ; % measurement vectors
    randomvector = rand(1,m);
    epsilon = 0.1 ;
    y = (randomvector>epsilon).*(sign(x(1,:))) - (randomvector<epsilon).*(sign(x(1,:))) ;
       
    coeff = zeros(n,1) ; % estimated paramter 
 for N = 1: iterations
    coeff = coeff - sz * (1/m * x* (y' .* (lprime_sg1_eight(y' .* (x' *coeff) ) ) )+r*coeff) ;
 end
    err(i) = (norm(coeff(2:end))/coeff(1))^2;
end
mean(err)

end
