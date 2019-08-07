close all
clear all
pkg load image

% 쉬프트할 이미지
inp=imread('pl0621/bad/5937a_62.jpg');
inp2= imresize(inp, [224, 224]);
% 푸리에 변환
H=fftshift(fft2(inp2));

for k=1:5
    % 쉬프트할 변화량
    x0=22*k;
    y0=0;

    % 일단, 이미지도 쉬프트 해주어야
    [xF,yF] = meshgrid(-112:111,-112:111);

    % 가우시안 펄스 곱해주기
    H=H.*exp(-1i*2*pi.*(xF*x0+yF*y0)/224);

    % 푸리에 역변환.
    IF_image=ifft2(ifftshift(H));


    tmpName = [tempname('/Users/kerb/Desktop/pl0621/bad/'), '.jpg'];
    result=mat2gray(abs(IF_image));
    imwrite(result, tmpName)
end

% 푸리에 변환
H=fftshift(fft2(inp2));
for k=1:5
    % 쉬프트할 변화량
    x0=0;
    y0=22*k;

    % 일단, 이미지도 쉬프트 해주어야
    [xF,yF] = meshgrid(-112:111,-112:111);

    % 가우시안 펄스 곱해주기
    H=H.*exp(-1i*2*pi.*(xF*x0+yF*y0)/224);

    % 푸리에 역변환.
    IF_image=ifft2(ifftshift(H));

    tmpName = [tempname('/Users/kerb/Desktop/pl0621/bad/'), '.jpg'];
    result=mat2gray(abs(IF_image));
    imwrite(result, tmpName)
end