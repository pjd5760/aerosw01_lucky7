%%  test용 입니다.
%% gnss 찍을 때 gnsslogger 프로그램에서 밑에 log nmea 키고 location 다 키고 찍었어요.
%% 지하철 타고 오면서 찍어가지고 시간만 찍히고 경도 위도 안찍힌데 있는거 같아요.

clear

fid = fopen('all.nmea','r');
nmea = textscan(fid,'%s');

nmea = nmea{1,1};
location.time = [];
location.lat = [];
location.log = [];
for i = 1:length(nmea)
    if startsWith(nmea(i,1),'NMEA,$GPGGA')
        N = nmea(i,1);
        a = split(N,',');
        location.time = [location.lat a(3,1)];
        location.lat = [location.lat a(4,1)];
        location.log = [location.lat a(5,1)];
    end
end
