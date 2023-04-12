%% Plot RD Spectrum
clc;clear;cla;
f_s = 25000000;
array_start_time = 0:0.5:9.5;
array_Doppler_frequency = -40:2:40;
array_sample_shift = 0:1:5;
array_range = array_sample_shift/f_s*3e8;
thres_A_TRD = -10;
duration = 0.5;

for i =1:20
FileName = ['Fdata_' num2str(i)];
load (FileName)
A_TRD(i,:,:) = sum_all;
end



idx_max_range = zeros(1,length(array_start_time))-1;
idx_max_Doppler_frequency = zeros(1,length(array_start_time));
for idx_start_time = 1:20
    
%     idx_start_time = 1;
    fig2 = figure(idx_start_time);
    ScreenSize = get(0,'ScreenSize');
    set(fig2,'Position',[0.75*ScreenSize(3)+50,0.5*ScreenSize(4)+50,0.25*ScreenSize(3)-100,0.5*ScreenSize(4)-150]);
    [meshgrid_Doppler,meshgrid_range] = ...
        meshgrid(array_Doppler_frequency,[array_range,2*array_range(end)-array_range(end-1)]);
    % 画三维图
    plot_A_RD = abs(squeeze(A_TRD(idx_start_time,:,:)));% idx_start_time是标识数据组数的
    plot_A_RD = plot_A_RD/max(max(plot_A_RD));
    plot_A_RD = 20*log10(plot_A_RD);% 以dB表示的相对值
    plot_A_RD(plot_A_RD<thres_A_TRD) = thres_A_TRD;% 限制最小值
    plot_A_RD = [plot_A_RD;thres_A_TRD*ones(1,size(plot_A_RD,2))];
    surf(meshgrid_Doppler,meshgrid_range,plot_A_RD(1:7,1:41))% 画图
    view(0,90)% 视角位置
    colorbar% 图例
    xlim([array_Doppler_frequency(1),array_Doppler_frequency(end)])
    ylim([array_range(1),2*array_range(end)-array_range(end-1)])
    xticks([array_Doppler_frequency(1):20:array_Doppler_frequency(end)])
    yticks([array_range,2*array_range(end)-array_range(end-1)])
    xlabel('Doppler frequency (Hz)')
    ylabel('Range (m)')
    [idx_max_range(idx_start_time),idx_max_Doppler_frequency(idx_start_time)] = find(plot_A_RD==max(max(plot_A_RD)));
     temp = sprintf('Range-Doppler Spectrum [%4.1fs: %3.0fm %3.0fHz]', ...
         array_start_time(idx_start_time), ...
         array_range(idx_max_range(idx_start_time)), ...
         array_Doppler_frequency(idx_max_Doppler_frequency(idx_start_time)));
     title(temp)

     FileName = strcat('Fdata_',num2str(idx_start_time),'.jpg');
     saveas(gcf,FileName)
end




% Plot TD Spectrum
fig3 = figure(21);
ScreenSize = get(0,'ScreenSize');
set(fig3,'Position',[0.5*ScreenSize(3)+50,50,0.25*ScreenSize(3)-100,0.5*ScreenSize(4)-150]);
[meshgrid_Doppler,meshgrid_start_time] = ...
    meshgrid(array_Doppler_frequency,[array_start_time,array_start_time(end)+duration]);
plot_A_TD = zeros(length(array_start_time),length(array_Doppler_frequency));
for idx_start_time = 1:length(array_start_time)
    plot_A_TD(idx_start_time,:) = abs(squeeze(A_TRD(idx_start_time,idx_max_range(idx_start_time),:)));
end
plot_A_TD = plot_A_TD./max(plot_A_TD,[],2);
plot_A_TD = 20*log10(plot_A_TD);
plot_A_TD(plot_A_TD<thres_A_TRD) = thres_A_TRD;
plot_A_TD = [plot_A_TD;thres_A_TRD*ones(1,size(plot_A_TD,2))];
surf(meshgrid_Doppler,meshgrid_start_time,plot_A_TD)
view(0,90)
colorbar
xlim([array_Doppler_frequency(1),array_Doppler_frequency(end)])
ylim([array_start_time(1),array_start_time(end)])
xticks([array_Doppler_frequency(1):20:array_Doppler_frequency(end)])
yticks([array_start_time(1):0.5:array_start_time(end)+duration])
xlabel('Doppler frequency (Hz)')
ylabel('Time (s)')
title('Time-Doppler Spectrum')