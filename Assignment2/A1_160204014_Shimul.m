%1. Take your RGB photo
I=imread('shimulImage2.jpg');
I = imresize(I, [256 256]);
figure;
imshow(I);

%2. Make it a grayscale image, say I
I=rgb2gray(I);
figure;
imshow(I);

%3. Calculate and plot histogram of image I
[row, col]= size(I);
A=zeros(1,256);
Y=zeros(1,256);
for i=1:row
   for j=1:col
      temp=I(i,j)+1;
      A(temp)=A(temp)+1;
   end
end
figure;
bar(A);
title('Gray scale image Hist plot');
xlabel('1 to 256 pixel value');
ylabel('frequency');

%4. Apply Negation Transformation on I
J=uint8(ones(row,col));
for i=1:row
   for j=1:col
      J(i,j)=(256-1)-I(i,j); 
   end
end
figure,imshow(J);
title('Negative Image');

%5. Calculate and plot histogram of the negative image
[row, col]= size(J);
B=zeros(1,256);
Y=zeros(1,256);
for i=1:row
   for j=1:col
      temp=J(i,j)+1;
      B(temp)=B(temp)+1;
   end
end
figure;
bar(B);
title('Negative Image transformation of hist');
xlabel('1 to 256 pixel value');
ylabel('frequency');

%6. Take a threshold value input from user, say A = 127
threshold = 'Write the Threshold Value: ';
A = input(threshold);

%7. Increase brightness by 50% for pixels with intensity greater than A; else decrease it by 25% of image I
I_threshold = I;
[row_threshold, column_threshold] = size(I_threshold);
for i=1:row_threshold
    for j=1:column_threshold
        if(I(i,j)>A)
            I_threshold(i, j) = I(i, j)+I(i, j)*0.5;
        else
            I_threshold(i, j) = I(i, j)-I(i, j)*0.25;
        end
    end
end  

figure;
imshow(I_threshold);
title('Thresholded image')

%8. Calculate and plot histogram of the thresholded image
[row, col]= size(I_threshold);
X=zeros(1,256);
Y=zeros(1,256);
for i=1:row
   for j=1:col
      temp=I_threshold(i,j)+1;
      X(temp)=X(temp)+1;
   end
end
figure;
bar(X);
title('Histogram of Thresholded Image');
xlabel('1 to 256 pixel value');
ylabel('frequency');

%9. Apply Log Transformation on image I with c = 1.5
%Equation:  s = c log(1 + r) where c is a constant
I_log = im2double(I);
c = 1.5;
I_log = c*log(1+I_log);
I_log = im2uint8(I_log);
[row_log, col_log] = size(I_log);
X_log = zeros(1,256);
for i=1:row_log
    for j=1:col_log
        temp = I_log(i, j)+1;
        X_log(temp) = X_log(temp)+1;
    end
end
figure;
imshow(I_log);
title('Log Transformed Image');

%10. Calculate and plot histogram of the log transformed image
[row, col]= size(I_log);
P=zeros(1,256);
Y=zeros(1,256);
for i=1:row
   for j=1:col
      temp=I_log(i,j)+1;
      P(temp)=P(temp)+1;
   end
end
figure();
bar(P);
title('Log transformed image of hist plot');
xlabel('1 to 256 pixel value');
ylabel('frequency');

%11. Take gamma value input from user, say Y = 0.6
%12. Apply Power Law Transformation on image I with c = 1.5
%S=cr^y
%Where c and gamma are positive constants
I_pow = im2double(I);
c = 1.5;
prompt ='Write the Gama Value: ';
Y = input(prompt);
I_pow = c*I_pow.^Y;
I_pow = im2uint8(I_pow);
[row_pow, col_pow] = size(I_pow);
X_pow = zeros(1,256);
for i=1:row_pow
    for j=1:col_pow
        temp = I_pow(i, j)+1;
        X_pow(temp) = X_pow(temp)+1;
    end
end
figure;
imshow(I_pow);
title('Power Law Transformed Image');

%13.Calculate and plot histogram of the Power Law transformed image. 
[row, col]= size(I_pow);
Q=zeros(1,256);
Y=zeros(1,256);
for i=1:row
   for j=1:col
      temp=I_pow(i,j)+1;
      Q(temp)=Q(temp)+1;
   end
end
figure;
bar(Q);
title('Power law transformed image of hist plot');
xlabel('1 to 256 pixel value');
ylabel('frequency');

%14. Understand the histograms, differences, their indications.
figure();
subplot(3,3,1), imshow(I),title('Grey Image');
subplot(3,3,2), imshow(J),title('Negative Image');
subplot(3,3,3), imshow(I_threshold),title('Thresholded Image');
subplot(3,3,4), imshow(I_log),title('Log Transformed ');
subplot(3,3,5), imshow(I_pow),title('Power Law Transformed Image ');
figure();
[row, col]= size(I);
A=zeros(1,256);
Y=zeros(1,256);
for i=1:row
   for j=1:col
      temp=I(i,j)+1;
      A(temp)=A(temp)+1;
   end
end
title('Gray scale image Hist plot');
xlabel('1 to 256 pixel value');
ylabel('frequency');
subplot(3,3,1) ,bar(A),title('Hist Grey');
subplot(3,3,2) ,bar(B),title('Negative Hist');
subplot(3,3,3) ,bar(X),title('Thresholded hist');
subplot(3,3,4) ,bar(P),title('Log Transformed hist');
subplot(3,3,5) ,bar(Q),title('Power Law Transformed hist ');

