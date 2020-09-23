close all; 
clear all;
clc;
warning off;

format long

class_number = 3;

beta = 0.5;

bw   = 0.5 ; %0.2; 


%% Reading an image

im = imread('ISIC_0000019.jpg');
im = imresize(im,[246,246]);
img = rgb2gray(im);

%% Get the graph of an image and it segmentation 
[G S] = GetGraphiM(img);
[G S] = GetGraphiM(G);
[G S] = GetGraphiM(G);
[G S] = GetGraphiM(G);
%[G S] = GetGraphiM(G);

Svec = imstack2vectors(S);
%% Get the gibs 

P   = gibs(im, class_number, beta) ;
gib = reshape(P(:,2),[246 246]);

%% Calculate the MAP 

Im_seg = P(:,2) .* Svec;
Im_seg = max(Im_seg ,[],2);
Seg = reshape(Im_seg ,[246 246]);

%% show
figure()
subplot(221); imshow(im);    title('Original'); 
subplot(222); imshow(gib); title('Probability of r'); 
subplot(223); imshow(G);  title('Vector segmentation');
subplot(224); imshow(im2bw(Seg));  title('Segmented Image');






