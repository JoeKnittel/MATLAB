%risk3D
%Updated: 11/12/09

getRisk
getMV
getDBCtP

avgRisk = mean(Risk);
avgMV = mean(MV);
avgDBCtP = 0; %by definition

region = zeros(1,n_subjects);
skilled = zeros(1,n_subjects);

for subject = 1:n_subjects
    if MV(subject) >= avgMV; skilled(subject) = 1; end
end

clc
commandwindow
disp('Please strike a a key') 
pause

figure(1)
maximize(figure(1))
hold on
for subject = 1:n_subjects
    tempx = Risk(subject); tempy = MV(subject); tempz = DBCtP(subject);
    if skilled(subject) == 1; plot3(tempx,tempy,tempz,'d','MarkerEdgeColor','k','MarkerFaceColor','r','MarkerSize',15)
    else plot3(tempx,tempy,tempz,'s','MarkerEdgeColor','k','MarkerFaceColor','b','MarkerSize',15)
    end
end

hold off

xlabel('Mean Normalized Risk');
ylabel('Mean Velocity');
zlabel('Decision-Based Contribution to Performance');

grid on
axis vis3d

view(0,0);

zoom(figure(1),0.4);

for i=1:90
    if i <=45; view(i,i);
    else view(90-i,90-i); end
    pause(0.01);
    M(i) = getframe;
end

clc

