[c_10,r_R] = get_cap_vs_curv(1);
[c_15,r_R] = get_cap_vs_curv(1.5);
[c_20,r_R] = get_cap_vs_curv(2.0);
%%
plot(r_R,c_10/max(c_10),r_R,c_15/max(c_15),r_R,c_20/max(c_20));
