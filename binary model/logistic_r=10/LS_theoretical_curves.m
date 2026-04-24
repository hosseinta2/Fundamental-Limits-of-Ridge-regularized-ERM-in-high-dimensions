%% unregularized %% z =E[SY]
deltas = 1.01:.01:8; % 
deltasreg = [.01:0.01:8]; % delta for the regularized case
lambda = 0 ; % regularizer
z = 0.785191; % E[SY]
sigmaunreg = zeros (size(deltas));
sigmaunreg = (1-deltas*z^2)./(2*deltas*z^2)+ (2+deltas.*(2+lambda+z^2*((2+lambda)*deltas-6)))./(2*z^2*deltas.*sqrt(4+4*deltas*(lambda-2)+(deltas.^2)*(lambda+2)^2));
plot(deltas,1./sqrt(1+sigmaunreg));
hold on

%% regularized
lambdas = [.01,10];
for lambda = lambdas
sigmas = zeros (size(deltasreg));
sigmas = (1-deltasreg*z^2)./(2*deltasreg*z^2)+ (2+deltasreg.*(2+lambda+z^2*((2+lambda)*deltasreg-6)))./(2*z^2*deltasreg.*sqrt(4+4*deltasreg*(lambda-2)+(deltasreg.^2)*(lambda+2)^2));
plot(deltasreg,1./sqrt(1+sigmas));
hold on
end



%% la-tuned LS for Signed-model
sigmaLS = zeros(size(deltasreg));
sigmaLS = (1-deltasreg*z^2+sqrt((1+deltasreg*z^2).^2-4*deltasreg*z^4))./(2*deltasreg*z^2);
plot(deltasreg,1./sqrt(1+sigmaLS),'-.');
hold on
%%
legend ('$\sigma_{_{\ell_2,0}}^2$ ', '$\sigma_{_{\ell_2,0.01}}^2 $','$\sigma_{_{\ell_2,10}}^2 $' ,'$\sigma_{_{\ell_2,\lambda_{\rm opt}}}^2 $')
sigav=1./deltasreg/(z^2);
plot (deltasreg,1./sqrt(1+sigav));
