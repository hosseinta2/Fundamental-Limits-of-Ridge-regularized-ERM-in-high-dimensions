n = 100;
i = 1;
la = 0.05;
y = zeros(n,1);
iterations = 10;
deltassim = .2:.5:4;
corrLS = zeros (length(deltassim),iterations);
for delta = deltassim
    for N = 1:iterations
      m = floor(n*delta)  
      coeff0 = normrnd (0,1,[n,1]);
      coeff0 = coeff0/norm(coeff0);
      x = normrnd(0,1,[n,m]);
      ex = exprnd(1,[m,1]);
      ber =rand(m,1);
      z = (2*((ber<0.5)-.5)).*ex;
      y = x'*coeff0 + z;
      
      
      cvx_begin quiet
        variable coeff(n,1)
        minimize ((y-(x'*coeff))'*(y-(x'*coeff))/n+la/2*coeff'*coeff)
        cvx_end
      corrLS(i,N) = (norm(coeff-coeff0))^2;
    end   
    i=i+1 ;
end
plot (deltassim,mean(corrLS,2),'s') ;
hold on
