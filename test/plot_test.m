close all

figure
hold
for i = 1:length(location.lat)
    plot(location.log(i),location.lat(i),'bo')
    
    pause(0.01)
end