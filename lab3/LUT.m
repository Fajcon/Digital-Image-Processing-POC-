function LUT(obraz,przekodowanie)
    subplot(2,2,1:2);
    plot(przekodowanie)
    xlim
    ylim
    
    subplot(2,2,3);
    imshow(obraz)
    
    subplot(2,2,4);
    imshow(intlut(obraz, przekodowanie));
end

