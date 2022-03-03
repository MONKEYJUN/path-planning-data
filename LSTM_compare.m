function [] = LSTM_compare(YPred_only,YPred,YTest)

%% Parameters
sat = 0.5;      % Saturation value (0,1].
%加载海图2信息
%%%海图要修改
f1=imread('Image 2.png');
f1_large=imresize(f1,1.5,'nearest'); %放大地图
b1=imbinarize(f1_large(:,:,1));
Wo = flip_vertical(b1);

%Black borders. 设置图片边界
Wo(1,:) = 0;
Wo(end,:) = 0;
Wo(:,1) = 0;
Wo(:,end) = 0;

number = 100;

W = FMdist(Wo'); %从边界及障碍物开始进行第一次FM方法 %% Wo转置了一次

% Velocities map Saturation
W = min(W,sat);
W = rescale(double(W));
load W_totall.mat
%% Picking start and end points.
%目标无人艇起始点
for i =440
    W = cell2mat(W_toall(round(5)));
    LP = cell2mat(YTest(i,1))';
    LP_CLSTM = cell2mat(YPred(i,1))';
    LP_LSTM = cell2mat(YPred_only(i,1))';

    figure(i); %显示leader初始规划好的路径
    hold on;
    title('规划路径对比分析');
    plot_fast_marching_2d(W,[],LP,LP(1,:),LP(end,:));
    hold on
    plot(LP_CLSTM(:,1),LP_CLSTM(:,2),'--','linewidth',1.5)
    hold on 
    plot(LP_LSTM(:,1),LP_LSTM(:,2),'-.','linewidth',1.5)
    colormap gray(256);
    axis on;
end
