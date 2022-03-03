function [] = LSTM_compare(YPred_only,YPred,YTest)

%% Parameters
sat = 0.5;      % Saturation value (0,1].
%���غ�ͼ2��Ϣ
%%%��ͼҪ�޸�
f1=imread('Image 2.png');
f1_large=imresize(f1,1.5,'nearest'); %�Ŵ��ͼ
b1=imbinarize(f1_large(:,:,1));
Wo = flip_vertical(b1);

%Black borders. ����ͼƬ�߽�
Wo(1,:) = 0;
Wo(end,:) = 0;
Wo(:,1) = 0;
Wo(:,end) = 0;

number = 100;

W = FMdist(Wo'); %�ӱ߽缰�ϰ��￪ʼ���е�һ��FM���� %% Woת����һ��

% Velocities map Saturation
W = min(W,sat);
W = rescale(double(W));
load W_totall.mat
%% Picking start and end points.
%Ŀ������ͧ��ʼ��
for i =440
    W = cell2mat(W_toall(round(5)));
    LP = cell2mat(YTest(i,1))';
    LP_CLSTM = cell2mat(YPred(i,1))';
    LP_LSTM = cell2mat(YPred_only(i,1))';

    figure(i); %��ʾleader��ʼ�滮�õ�·��
    hold on;
    title('�滮·���Աȷ���');
    plot_fast_marching_2d(W,[],LP,LP(1,:),LP(end,:));
    hold on
    plot(LP_CLSTM(:,1),LP_CLSTM(:,2),'--','linewidth',1.5)
    hold on 
    plot(LP_LSTM(:,1),LP_LSTM(:,2),'-.','linewidth',1.5)
    colormap gray(256);
    axis on;
end
