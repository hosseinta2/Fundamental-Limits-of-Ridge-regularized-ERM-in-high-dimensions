deltas = [0.1:.1:4];

for r = 0.1:.1:.4
la = (-(r+deltas-1) + sqrt((r+deltas-1).^2+4*r))/(2*r);
alphas = ((2*deltas.*(la.^2))./((1+la).^2) + r^2*(la.^2))./(1-(deltas.*(la.^2))./((1+la).^2));
plot (deltas, alphas,'--')
hold on
end

