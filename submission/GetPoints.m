function [points] = GetPoints(img)
flag = false;
while ~flag
    imshow(img);
    title('Press Enter When Done');
    hold on;
    [x,y] = ginput();
    points = [x,y]';
    plot(x,y,'rx','linewidth',2);
    for i = 1:size(x,1)
        text(x(i),y(i)-10,num2str(i));
    end
    flag = true;
    hold off;
end
end
