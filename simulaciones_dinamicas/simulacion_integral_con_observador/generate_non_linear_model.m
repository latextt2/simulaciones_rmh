function [] = generate_non_linear_model()
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

[xp,y] = get_symbolic_model('simulation');

fileID = fopen('hmb_non_linear_model.m','w');
head = 'function [xp,y] = hmb_non_linear_model(x,u,ws,Fd_x,Fd_y,Fd_z,Md_y,Md_z,Fmcce1,Fmcce2)';
tail  = 'end';

fprintf(fileID,'%s\n',head); %% function header
%%
fprintf(fileID,'\n[m,R_r,R_a,R_p,I_p,I_0] = system_parameters();\n');
%% assign input variables
fprintf(fileID,'\n');
for r = 1:size(xp,1)
    fprintf(fileID,'x%d = x(%d);\n',r,r);
end

fprintf(fileID,'\n');

for r = 1:5
    fprintf(fileID,'u%d = u(%d);\n',r,r);
end
%% write xp
fprintf(fileID,'\n');
fprintf(fileID,'%s\n','xp = [');
for r = 1:size(xp,1)
    fprintf(fileID,'\t%s;\n',char(xp(r)));    
end
fprintf(fileID,'%s\n','];');

%% write y
fprintf(fileID,'\n');
fprintf(fileID,'%s\n','y = [');
for r = 1:size(y,1)
    fprintf(fileID,'\t%s;\n',char(y(r)));
end
fprintf(fileID,'%s\n','];');
%% function tail
fprintf(fileID,'\n');
fprintf(fileID,'%s\n',tail);
fclose(fileID);

end

