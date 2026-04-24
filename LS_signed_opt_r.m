
epsilon = 0;
deltas = 1.01:.02:9 ;
mu= (1-2*epsilon)*sqrt(2/pi);
alphavec = sqrt(1-(1-2*epsilon)^2*2/pi)* sqrt(1./(deltas-1));
plot (deltas,mu./sqrt(mu.^2+ alphavec.^2)); 
hold on
%%
n= 128;
i= 1;

y= zeros(n,1);
iterations = 20;
lambda = 21; 
deltassim = [.2];
corr = zeros (length(deltassim),iterations);
for delta = deltassim
    delta
    coeff0 = zeros(n,1);
    coeff0(1) = 1 ;
    for N = 1:iterations
      m = floor(n*delta);  
      x= normrnd(0,1,[n,m]);
      randomvector=rand(m,1);
      y = (randomvector>epsilon).*(sign(coeff0'*x)') - (randomvector<epsilon).*(sign(coeff0'*x)') ;
      cvx_begin quiet
        variable coeff(n,1)
        minimize ((1-y.*(x'*coeff))'*(1-y.*(x'*coeff))/m+ lambda/2*coeff'*coeff)
        cvx_end
      corr(i,N) = norm(coeff(2:end))^2/coeff(1)^2;
    end   
    i=i+1 ;
end
hold on
mean(corr,2)
plot (deltassim,1/sqrt(1+mean(corr,2)),'s') ;