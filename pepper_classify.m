clear
close all
clc
% 采用matlab2019，并安装Deep Learning Toolbox Model for GoogLeNet Network 包
%% 加载预训练网络
net = googlenet;
 
inputSize = net.Layers(1).InputSize
 
classNames = net.Layers(end).ClassNames;
numClasses = numel(classNames);
disp(classNames(randperm(numClasses,10)))
 
%% 读取图像并调整图像大小
I = imread('peppers.png');
figure
imshow(I)
size(I)
I = imresize(I,inputSize(1:2));
figure
imshow(I)
%% 对图像进行分类
[label,scores] = classify(net,I);
label
figure
subplot(121);
imshow(I)
title(string(label) + ", " + num2str(100*scores(classNames == label),3) + "%");
 
%% 显示排名靠前的预测值
[~,idx] = sort(scores,'descend');
idx = idx(5:-1:1);
classNamesTop = net.Layers(end).ClassNames(idx);
scoresTop = scores(idx);
subplot(122);
barh(scoresTop)
xlim([0 1])
title('Top 5 Predictions')
xlabel('Probability')
yticklabels(classNamesTop)
