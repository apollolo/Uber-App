function [latitude, longitude, status] = coordinate(origin)


data = webread('https://maps.googleapis.com/maps/api/geocode/json?','address',origin,'key','AIzaSyDzlBASL5Y__5-Tv-ILFeMwrWU_GPA-Aew');

status = data.status;
if strcmp(status, 'OK') == 1
latitude = data.results.geometry.location.lat;
longitude = data.results.geometry.location.lng;
else
    latitude = 0;
    longitude = 0;
end
end