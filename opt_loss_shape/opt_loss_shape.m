start= -2 ; 
fun = @(x) l_prime_opt_double_exp_dtwo(x);
xx = [-1:0.1:4];
for i=1:length(xx)
yy(i) = integral(fun,start,xx(i));
end
yy= yy-min(yy);
plot(xx,yy/yy(21))
hold on

%%
fun2 = @(x) l_prime_opt_double_exp2_dtwo(x);
for i=1:length(xx)
yy(i) = integral(fun2,start,xx(i));
end
yy= yy-min(yy);
plot(xx,yy/yy(21))
hold on
plot(xx,xx.^2)
%%
fun3 = @(x) lprime_sg_two(x);
xxs = [-1:0.01:4];
for i = 1:length(xxs)
yys(i) = integral(fun3,-1,xxs(i));
end
yys  = yys  - min(yys);
plot(xxs,yys)
hold on

xxl = [0:0.1:20];
fun4 = @(x) lprime_log_two(x);
for i=1:length(xxl)
yyl(i) = integral(fun4,0,xxl(i));
end
yyl=yyl-min(yyl);
yyd= downsample(yyl,10);
plot(xxl(1:length(yyd)),yyd/yyd(length(yyd)))
hold on

xxl2 = [-1:0.1:4];
fun5 = @(x) lprime_log_two_r10(x);
for i=1:length(xxl2)
yyl2(i) = integral(fun5,0,xxl2(i));
end
yyl2=yyl2-min(yyl2);
plot([-1:.1:4],yyl2)
hold on
plot(xxl2,(xxl2-1).^2)

legend ( '$\mathcal{L}_\star$, Signed', '$\mathcal{L}_\star$,Logistic, r=1', '$\mathcal{L}_\star$,Logistic, r=10','$\ell_2$')