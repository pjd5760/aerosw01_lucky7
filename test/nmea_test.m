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
        time = a{3,1};
        hours = str2num(time(1:2));
        minutes = str2num(time(3:4));
        seconds = str2num(time(5:end));
        time_s = hours * 3600 + minutes * 60 + seconds;
        location.time = [location.time time_s];
        
       

        %% 지금 지하철 타고 오면서 찍어서 지하라 안찍힌 부분이 있는 거 같습니다.
        %% 어쩔수 없이 if 문써서 일단 처리해놓긴 했는데 나중에 제대로 찍히면 지우면 될 것 같아요.
        
        latitude = a{4,1};
        if ~isempty(latitude)
        degrees_lat = str2num(latitude(1:2));
        minutes_lat = str2num(latitude(3:end));
        latitute_new = degrees_lat + minutes_lat/60;
        location.lat = [location.lat latitute_new];
        end
       

       longitude = a{6,1};
       if ~isempty(longitude)
        degrees_log = str2num(longitude(1:3));
        minutes_log = str2num(longitude(4:end));
        longitude_new = degrees_log + minutes_log/60;
        location.log = [location.log longitude_new];
       end
    end
end

fclose(fid);
%% 위치 구글지도에 다 찍어봤는데 저 집오는길이랑 일치합니당.