 clear
close all
clc
%% ����Ԥѵ������
net = googlenet;
 
inputSize = net.Layers(1).InputSize
 
classNames = net.Layers(end).ClassNames;
numClasses = numel(classNames);
disp(classNames(randperm(numClasses,10)))
 
%% ��ȡͼ�񲢵���ͼ���С
I = imread('peppers.png');
figure
imshow(I)
size(I)
I = imresize(I,inputSize(1:2));
figure
imshow(I)
%% ��ͼ����з���
[label,scores] = classify(net,I);
label
figure
subplot(121);
imshow(I)
title(string(label) + ", " + num2str(100*scores(classNames == label),3) + "%");
 
%% ��ʾ������ǰ��Ԥ��ֵ
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