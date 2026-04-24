n = 100 ; 
delta = 8;
m = delta * n ;
y = zeros(1,m) ; % observarions

for j =1:10
X = binornd(1, 0.5, [n,m])*2-1 ; % measurement vectors
randomvector = rand(1,m);
y = (randomvector>1./(1+exp(X(1,:)))) - (randomvector<1./(1+exp(X(1,:))));

i = 1 ;
for lambda = [0:.2:20]
    
   sol = (X*X'+lambda*eye(n))^(-1)*X*y'; 
   perf(i) = (norm(sol(2:end))/sol(1))^2; 
   i= i+1;
end
    opt(j) = min(perf);
end


mean(opt)
    