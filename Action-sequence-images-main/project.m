choose_test_case("1")
choose_test_case("2")
choose_test_case("3")
choose_test_case("4")
choose_test_case("5")
choose_test_case("6")
choose_test_case("7")
choose_test_case("8")


function I = ModifiedImage(I,I2)
[h, w, c] = size(I);
for i=1:h
    for j = 1:w
        if(I(i,j,3) - I2(i,j,3) > 0 )
            I(i,j,:) = I2(i,j,:);
        end
    end
end
end

function I = ModifiedImage2(I,I2,x1,x2,y1,y2)
[h, w, c] = size(I);
for i=1:h
    for j = 1:w
        if(((j > x1) && (j < x2)) && ((i > y1) && (i < y2)))
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

function I = ModifiedImage3(I,I2,x1,x2,y1,y2,m,n)
[h, w, c] = size(I);
if m == 190 || m == 100 || m == 120 || m == 80 || m == 300
for i=1:h
    for j = 1:w
        if((((j > x1) && (j < x2)) && ((i > y1) && (i < y2))) && (I2(i,j,1) < m) && ((I2(i,j,2) - I2(i,j,1) <= n)))
            I2(i,j,:) = I2(i,j,:);                            
         else
             I2(i,j,:) = 0;
        end
    end
end
else
for i=1:h
    for j = 1:w
        if(((j > x1) && (j < x2)) && ((I2(i,j,2) > I2(i,j,1)) && (I2(i,j,2) - I2(i,j,1) < m) || ((I2(i,j,1) - I2(i,j,2) >= n))) )
            I2(i,j,:) = I2(i,j,:);                            
         else
             I2(i,j,:) = 0;
        end
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

function choose_test_case(s)
if s == "1"
   
I=imread('in000574.jpg');
I2 = imread('in000604.jpg');
I3 = imread('in000654.jpg');
I4 = imread('in000674.jpg');

I = ModifiedImage(I,I2);
I = ModifiedImage(I,I3);
I = ModifiedImage(I,I4);

figure,imshow(I),title('Output');

end
if s == "2"
I=imread('in000332.jpg');
I2 = imread('in000312.jpg');
I3 = imread('in000352.jpg');
I4 = imread('in000392.jpg');
I5 = imread('in000372.jpg');
I6 = imread('in000409.jpg');

I = ModifiedImage3(I,I6,238,283,57,157,300,255);
I = ModifiedImage3(I,I5,145,190,57,157,300,255);
I = ModifiedImage3(I,I4,196,235,57,157,300,255);
I = ModifiedImage3(I,I3,96,131,57,157,300,255);
I = ModifiedImage3(I,I2,0,37,57,157,300,255);

% Show the result
figure,imshow(I),title('Output');
end
if s == "3"
I=imread('bend1.bmp');
I2 = imread('bend2.bmp');
I3 = imread('bend3.bmp');

I = ModifiedImage3(I,I2,54,100,38,121,100,255);
I = ModifiedImage3(I,I3,54,100,38,121,100,255);

figure,imshow(I),title('Output');

end
if s == "4"
I = imread('wave1_1.bmp');
I2 = imread('wave1_2.bmp');
I3 = imread('wave1_3.bmp');
I4 = imread('wave1_4.bmp');


I = ModifiedImage3(I,I2,50,100,30,121,120,255);
I = ModifiedImage3(I,I3,50,100,30,121,120,255);
I = ModifiedImage3(I,I4,50,100,30,121,120,255);

figure,imshow(I),title('Output');

end
if s == "5"
I = imread('wave2_1.bmp');
I2 = imread('wave2_2.bmp');
I3 = imread('wave2_3.bmp');
I4 = imread('wave2_4.bmp');

I = ModifiedImage3(I,I2,54,100,38,121,80,255);
I = ModifiedImage3(I,I3,54,100,38,121,80,255);
I = ModifiedImage3(I,I4,54,100,38,121,80,255);


figure,imshow(I),title('Output');

end
if s == "6"
I=imread('in002338.jpg');
I2 = imread('in002366.jpg');
I3 = imread('in002389.jpg');
I4 = imread('in002429.jpg');

I = ModifiedImage3(I,I4,130,220,0,0,55,10);
I = ModifiedImage3(I,I3,70,155,0,0,55,22);
I = ModifiedImage3(I,I2,20,100,0,0,55,20);

% Show the result
figure,imshow(uint8(I)),title('Output')
end
if s == "7"
I=imread('in001954.jpg');
I2 = imread('in001982.jpg');
I3 = imread('in002012.jpg');
I4 = imread('in002031.jpg');

I = ModifiedImage3(I,I4,0,60,120,173,300,255);
I = ModifiedImage3(I,I3,17,160,118,171,300,255);
I = ModifiedImage3(I,I2,141,250,114,168,300,255);

% Show the result
figure,imshow(uint8(I)),title('Output')
end
if s == "8"
    I=imread('01.jpg');
I2 = imread('02.jpg');
I3 = imread('03.jpg');
I4 = imread('04.jpg');
I5 = imread('05.jpg');

I4 = ModifiedImage3(I4,I5,275,440,352,610,190,55);
I4 = ModifiedImage3(I4,I,883,951,290,402,190,12);
I4 = ModifiedImage3(I4,I3,715,828,350,478,190,60);
I4 = ModifiedImage3(I4,I2,790,889,320,450,190,15);

% Show the result
figure,imshow(I4),title('Output')
end
end