points= {{0.01, 1.20648}, {0.11, 1.18923}, {0.21, 1.14558}, {0.31, ...
  1.08111}, {0.41, 1.00297}, {0.51, 0.918192}, {0.61, ...
  0.832537}, {0.71, 0.750081}, {0.81, 0.6733}, {0.91, 0.60341}, {1.01,...
   0.540755}, {1.11, 0.485135}, {1.21, 0.436054}, {1.31, ...
  0.392881}, {1.41, 0.354949}, {1.51, 0.321615}, {1.61,... 
  0.292285}, {1.71, 0.266431}, {1.81, 0.243586}, {1.91,... 
  0.223348}, {2.01, 0.205367}, {2.11, 0.189346}, {2.21, ...
  0.175029}, {2.31, 0.162197}, {2.41, 0.150663}, {2.51, ...
  0.140266}, {2.61, 0.130867}, {2.71, 0.122349}, {2.81, ...
  0.114609}, {2.91, 0.107558}, {3.01, 0.101119}, {3.11, ...
  0.095226}, {3.21, 0.0898204}, {3.31, 0.0848512}, {3.41, ...
  0.080274}, {3.51, 0.0760495}, {3.61, 0.0721432}, {3.71, ...
  0.0685244}, {3.81, 0.0651664}, {3.91, 0.062045}};

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
plot (deltavec,minimumsig.^2);
hold on
