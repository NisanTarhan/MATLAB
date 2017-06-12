% baslangic temizligi
clear;
clf;

arkaPlanAlgilayicisi = vision.ForegroundDetector('NumGaussians', 3, 'NumTrainingFrames', 50);

videoOkuyucusu = vision.VideoFileReader('resim/ornek_video.mp4');

for i = 1:50
    cerceve = step(videoOkuyucusu); % sonraki frame 
    arkaPlan = step(arkaPlanAlgilayicisi, cerceve);
end

imshow(arkaPlan); title('Arka Plan');

% arkaplan temizleniyor...
se = strel('square', 4);
temizArkaPlan = imopen(arkaPlan, se);
figure; imshow(temizArkaPlan); title('Temiz Arka Plan');

damlaAnalizi = vision.BlobAnalysis('BoundingBoxOutputPort', true, ...
    'AreaOutputPort', false, 'CentroidOutputPort', false, ...
    'MinimumBlobArea', 500);
kutucuklar = step(damlaAnalizi, temizArkaPlan);

sonuc = insertShape(cerceve, 'Rectangle', kutucuklar, 'Color', 'green');
figure; imshow(sonuc); title('Algýlanmis Arac');

videoYazicisi = VideoWriter('./algilanmis.avi');
open(videoYazicisi);

while ~isDone(videoOkuyucusu)
    cerceve = step(videoOkuyucusu); 
    
    arkaPlan = step(arkaPlanAlgilayicisi, cerceve);
    temizArkaPlan = imopen(arkaPlan, se);
    kutucuklar = step(damlaAnalizi, temizArkaPlan);

    sonuc = insertShape(cerceve, 'Rectangle', kutucuklar, 'Color', 'green');

    writeVideo(videoYazicisi, sonuc);
end

close(videoYazicisi);
release(videoOkuyucusu);


