function Image6=moravec(Image)
    [m,n]=size(Image);
    Image2=colfilt(Image,[5,5],'sliding','diff_moravec',5);
    Image3=Image2>=500;
    Image4=Image2.*double(Image3); 

    Image5=colfilt(Image2,[20,20],'distinct','fun');
    Image6=Image5.*Image3;
     figure(2);
    imshow(Image);
     hold on
     for i=1:m
        for j=1:n
             if(Image6(i,j)==1)
                   plot([j],[i],'+','MarkerEdgeColor','r');
             end
         end
     end
    hold off

