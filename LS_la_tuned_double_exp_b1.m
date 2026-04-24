%% unregularized
deltas = 1.1:.01:20;
deltasreg = .1:.01:20;
b=2;
lambda = 0 ;
alphasunreg = zeros (size(deltas));
alphasunreg = 1/2*(1-2*b^2-deltas)+(2*b^2*(lambda+2*deltas+2)+2*(deltas-1).^2+lambda*(deltas+1))./(2*sqrt((lambda+2*deltas-2).^2+8*lambda));
plot(deltas,(alphasunreg));
hold on

%% regularized
lambdas = [.1];
for lambda = lambdas
alphas = zeros (size(deltasreg));
alphas = 1/2*(1-2*b^2-deltasreg)+(2*b^2*(lambda+2*deltasreg+2)+2*(deltasreg-1).^2+lambda*(deltasreg+1))./(2*sqrt((lambda+2*deltasreg-2).^2+8*lambda));
plot(deltasreg,(alphas));
hold on
end



%% la-tuned LS for Z~LAPLACE(0,b)
b=2;
deltasreg = [0.5,2,4,6,8];
alphasLS = zeros(size(deltasreg));
alphasLS = 1/2*(1-2*b^2-deltasreg+sqrt((1+deltasreg+2*b^2).^2-4*deltasreg));
plot(deltasreg,(alphasLS),'--');
hold on
%%
legend ('\alpha_{_{\ell_2,0}}^2 ','\alpha_{_{\ell_2,0.1}}^2 ', '\alpha_{_{\ell_2,1}}^2 ','\alpha_{_{\ell_2,10}}^2 ' ,'\alpha_{_{\ell_2,\la_{rm opt}}}^2 ', '\alpha_{\star}^2')