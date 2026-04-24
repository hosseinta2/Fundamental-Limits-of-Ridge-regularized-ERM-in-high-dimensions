%% unregularized %% z =E[SY]
deltas = 1.04:.01:10;
deltasreg = [.1:.01:10];
lambda = 0 ; % regularizer
z = 0.4132;
sigmaunreg = zeros (size(deltas));
sigmaunreg = (1-deltas*z^2)./(2*deltas*z^2)+ (2+deltas.*(2+lambda+z^2*((2+lambda)*deltas-6)))./(2*z^2*deltas.*sqrt(4+4*deltas*(lambda-2)+(deltas.^2)*(lambda+2)^2));
plot(deltas,(sigmaunreg));
hold on

%% regularized
lambdas = [1];
for lambda = lambdas
sigmas = zeros (size(deltasreg));
sigmas = (1-deltasreg*z^2)./(2*deltasreg*z^2)+ (2+deltasreg.*(2+lambda+z^2*((2+lambda)*deltasreg-6)))./(2*z^2*deltasreg.*sqrt(4+4*deltasreg*(lambda-2)+(deltasreg.^2)*(lambda+2)^2));
plot(deltasreg,(sigmas));
hold on
end



%% la-tuned LS for Signed-model
alphasLS = zeros(size(deltasreg));
alphasLS = (1-deltasreg*z^2+sqrt((1+deltasreg*z^2).^2-4*deltasreg*z^4))./(2*deltasreg*z^2);
plot(deltasreg,(alphasLS),'--');
hold on
%%
legend ('$\sigma_{_{\ell_2,0}}^2$ ', '$\sigma_{_{\ell_2,0.01}}^2 $','$\sigma_{_{\ell_2,10}}^2 $' ,'$\sigma_{_{\ell_2,\lambda_{\rm opt}}}^2 $')