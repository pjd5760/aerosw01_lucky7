close all

figure
hold
for i = 1:length(location.lat)
    plot(location.lat(i),location.log(i),'bo')
    
    pause(0.01)
end