 clc,close all
 action_sequence('E:\Case1 - Full body\1','*.jpg');
 action_sequence('E:\Case1 - Full body\2','*.jpg');
 action_sequence('E:\Case2 - body part\bend','*.bmp');
 action_sequence('E:\Case2 - body part\wave1','*.bmp');
 action_sequence('E:\Case2 - body part\wave2','*.bmp');
 action_sequence('E:\Case3 - Full body - dynamic BG','*.jpg');
 action_sequence('E:\Complex BG','*.jpg');

I = imread('01.jpg');
I2 = imread('02.jpg');
I3 = imread('03.jpg');
I4 = imread('04.jpg');
I5 = imread('05.jpg');

I4 = ModifiedImage3(I4,I5,275,440,352,610,55);
I4 = ModifiedImage3(I4,I,883,951,290,402,12);
I4 = ModifiedImage3(I4,I3,715,828,350,478,60);
I4 = ModifiedImage3(I4,I2,790,889,320,450,15);

% Show the result
figure,imshow(I4),title('Final Result')
function action_sequence(path,s)
myFolder=path;
outputFolder = fullfile(myFolder,s); 
images = dir(outputFolder);

for k = 1:length(images)
  baseFileName = images(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  fprintf(1, 'Now reading %s\n', baseFileName);
  ImageArray{k} = imread(fullFileName);
end

if ((path == "E:\Case2 - body part\bend") || (path == "E:\Case2 - body part\wave1") || (path == "E:\Case2 - body part\wave2"))
    mov=VideoReader('background.avi');
    B = read(mov,1);
    v = 1;
else
    B = ImageArray{1};
    v = 2;
end


    a = fspecial('average',8);

[h, w, c] = size(B);
B=imfilter(B,a);
R=zeros(h,w,c);
index=0;

for k = v:length(images)
    
    I=ImageArray{length(images)-index};
    II=imfilter( I,a);
    Z=abs(B-II);
    Z2=abs(II-B);

    for i=1:h
        for j = 1:w
            
             if(Z(i,j,1)>30||Z(i,j,2)>30||Z(i,j,3)>30)
                 R(i,j,:) = I(i,j,:);      
             end
             if(Z2(i,j,1)>30||Z2(i,j,2)>30||Z2(i,j,3)>30)
                 R(i,j,:) = I(i,j,:);  
           
             end
        end
    end
index=index+1;
end
for i=1:h
    for j = 1:w
       if(R(i,j,:)==0)
            R(i,j,:) = ImageArray{2}(i,j,:);   
       end
    end
end

figure,imshow(uint8(R)),title('Final Result');
end
function I = ModifiedImage3(I,I2,x1,x2,y1,y2,n)
[h, w, c] = size(I);
for i=1:h
    for j = 1:w
        if((((j > x1) && (j < x2)) && ((i > y1) && (i < y2))) && (I2(i,j,1) < 190) && ((I2(i,j,2) - I2(i,j,1) <= n)))
            I2(i,j,:) = I2(i,j,:);                            
         else
             I2(i,j,:) = 0;
        end
    end
end
for i=1:h
    for j = 1:w
        if(I2(i,j,:)>0)
            I(i,j,:)=I2(i,j,:);
        else
            I(i,j,:)=I(i,j,:);
        end
    end
end
end