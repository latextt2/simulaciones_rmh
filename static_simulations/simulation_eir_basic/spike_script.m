NI = 275 * 2;
l_gap_min = 0.25e-3;
l_gap_max = 0.75e-3;
n_samples = 100;

l_gap = linspace(l_gap_min,l_gap_max,n_samples);
F = zeros(1,n_samples);

for k = 1:n_samples;
F(k) = rmb_real_force(l_gap(k),NI);
end

plot(l_gap,-F)
grid on
xlabel('gap [m]')
ylabel('Force [N]')