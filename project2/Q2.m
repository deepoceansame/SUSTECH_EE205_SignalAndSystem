clc;clear;close all;

load data_15.mat;
end_time = cur_time+duration;
t = linspace(0,duration,f_s*duration);
f = linspace(-f_s/(1000000*2),f_s/(1000000*2),length(seq_ref));
ref_DDC = seq_ref.*exp(1i.*2*pi*3e6.*t);
[b, a] = butter(20, 10e6/(f_s/2));
ref_LPF = filter(b,a,ref_DDC);
sur_DDC = seq_sur.*exp(1i.*2*pi*3e6.*t);
[b, a] = butter(20, 10e6/(f_s/2));
sur_LPF = filter(b,a,sur_DDC);

t_final = 0;
d_final = 0;

x = 1;

d_ran = -40:2:40;
c_ran = 0:4e-8:24e-8;

% load temp5_sav.mat
%%
sum_all = zeros(length(c_ran), length(d_ran));
for d = d_ran
    sur_NEW = sur_LPF;
    for T = c_ran
        if T ~= c_ran(1)
            N = f_s*4e-8;
            sur_NEW(:,1:N) = [];
            sur_NEW=[sur_NEW zeros(1,N)];
        end
        y = sur_NEW.*conj(ref_LPF).*exp(-1i.*2.*pi.*d.*t).*(1/f_s);
        % sum_ = sum(y)/(length(seq_sur)-T*f_s)*length(seq_sur);
        sum_all(x) = sum(y);
        d
        T
        x = x+1;
    end
end
save('temp15_sav', "sum_all");
%%

clear;clc;close all;

load temp15_sav.mat

d_ran = -40:2:40;
c_ran = 0:12:72;


fq2 = figure;
figure(fq2);
[c, d] = meshgrid(d_ran, c_ran);

surf(c,d,abs(sum_all));
view(0, 90);

%%

thres_A_TRD = -10;
plot_A_RD = abs(sum_all);
plot_A_RD = plot_A_RD/max(max(plot_A_RD));
plot_A_RD = 20*log10(plot_A_RD);
plot_A_RD(plot_A_RD<thres_A_TRD) = thres_A_TRD;


surf(c,d,plot_A_RD);
view(0, 90);

colorbar;






















