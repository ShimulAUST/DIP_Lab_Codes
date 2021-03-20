Image1=imread('1.jpg');
Image2=imread('2.jpg');
Image1 = imresize(Image1, [512 512]);
figure; imshow(Image1);
Image2 = imresize(Image2, [512 512]);
figure; imshow(Image2);

[row,column,channel]=size(Image1);

ImagePartition = uint8(zeros(row, column, channel));
Partition = row/6;


for i = 1:3
    for j=0:2:4
         ImagePartition(j*Partition:(j+1)*Partition,:,i) = Image1(j*Partition:(j+1)*Partition,:,i);
    end
    for j=1:2:5
         ImagePartition(j*Partition:(j+1)*Partition,:,i)=Image2(j*Partition:(j+1)*Partition,:,i);
    end  
end
figure; imshow(ImagePartition);

newk = ImagePartition;

[r, c, ch] = size(newk);
ImageRotate = uint8(zeros(r, c, ch));

for i = 1:ch
    for j = 1:r
        for k = 1:c
         ImageRotate(j, k , i) = newk(k, j , i);
        end
    end
end
figure; imshow(ImageRotate);