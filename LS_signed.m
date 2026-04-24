%%% comparing theoretical values and empirical ones for signed measurements with lambda = 0.5
%%%%%%%%%%%%%%%%%%%%%
i=1;
deltassim = [0.1:.5:5];
for d = deltassim % deltas
l = 0.5;% regularizer
t = (-2*d-l*d+2+sqrt((2*d+l*d-2)^2+8*l*d))/(4*l*d); % tau for LS
ex = sqrt(2/pi);% E[sy]
mu = (2*ex)/(2+2*l*t+l);% mu
als = (4*t^2*d*(mu^2+1-2*mu*ex))/(4*t^2+1+4*t-4*t^2*d);%alpha^2
sigs(i) = als/(mu^2) ; % sigma^2
i=i+1;
end
plot (deltassim, 1./sqrt(sigs+1))
hold on


%% empirical
n= 128;
i= 1;
epsilon = 0; % epsilon = probability of error
y= zeros(n,1);
iterations = 10;
lambda = 0.5; % regularizer 
corr = zeros (length(deltassim),iterations);
for delta = deltassim
    delta
    coeff0 = normrnd (0,1,[n,1]);
    coeff0 = coeff0/norm(coeff0);
    for N = 1:iterations
      m = floor(n*delta);  
      x= normrnd(0,1,[n,m]);
      randomvector=rand(m,1);
      y = (randomvector>epsilon).*(sign(coeff0'*x)') - (randomvector<epsilon).*(sign(coeff0'*x)') ;
      cvx_begin quiet
        variable coeff(n,1)
        minimize ((1-y.*(x'*coeff))'*(1-y.*(x'*coeff))/m+lambda/2*coeff'*coeff)
        cvx_end
      corr(i,N) = (coeff'*coeff0 ) / norm(coeff);
    end   
    i=i+1 ;
end
hold on
plot (deltassim,mean(corr,2),'s') ;