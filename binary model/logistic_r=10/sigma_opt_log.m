points={{0.1, 4.33537}, {0.2, 3.39326}, {0.3, 2.6512}, {0.4, 2.11365}, {0.5, ...
  1.71688}, {0.6, 1.41551}, {0.7, 1.18136}, {0.8, 0.996379}, {0.9, ...
  0.848358}, {1., 0.728638}, {1.1, 0.63088}, {1.2, 0.550347}, {1.3, ...
  0.483449}, {1.4, 0.427433}, {1.5, 0.380177}, {1.6, 0.340023}, {1.7, ...
  0.305675}, {1.8, 0.276104}, {1.9, 0.250494}, {2., 0.228188}, {2.1, ...
  0.208658}, {2.2, 0.191473}, {2.3, 0.17628}, {2.4, 0.16279}, {2.5, ...
  0.150762}, {2.6, 0.139996}, {2.7, 0.130325}, {2.8, 0.121608}, {2.9, ...
  0.113724}, {3., 0.106573}, {3.1, 0.100067}, {3.2, 0.0941329}, {3.3, ...
  0.0887051}, {3.4, 0.0837288}, {3.5, 0.0791556}, {3.6,... 
  0.0749437}, {3.7, 0.0710562}, {3.8, 0.067461}, {3.9, ...
  0.0641298}, {4., 0.0610374}};

sigma = zeros(length(points),1) ; 
fisherinfo = sigma ;
for i=1:length(points)
sigma(i) = points{i}{1};
fisherinfo(i) = points{i}{2};
end
sigmaI = [0.01:.001:4]';
fisherinfoI = zeros(size(sigmaI));
fisherinfoI = interp1q(sigma,fisherinfo,sigmaI);


deltavec = [0.5,2,4,6,8];

%alpha_opt_ind = zeros(length(rvec),1);
minimumsig = zeros(size(deltavec));
r_opt_indice = minimumsig;
r_opt = r_opt_indice;
j=1;
for delta = deltavec
i=1;
rvec = 0.00001:0.001:1/delta;
for r = rvec
    arg = (1-(sigmaI.^2).*(1-(sigmaI.^2).*fisherinfoI))./(delta*sigmaI.^2.*(sigmaI.^2.*fisherinfoI+fisherinfoI-1))-2*r+r^2*delta*(1+sigmaI.^(-2))-1;
   [~,alpha_opt_ind(i)]=min(abs(arg)) ;
   i=i+1;
end
min_sigmas = sigmaI(alpha_opt_ind);
[minimumsig(j),r_opt_indice(j)] = min(min_sigmas);
r_opt(j) = rvec(r_opt_indice(j)); % r_opt based on delta
j=j+1;
end
plot (deltavec,1./sqrt(1+minimumsig.^2));
hold on
