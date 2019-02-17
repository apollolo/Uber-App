    startadd = input('Enter pickup location: \n', 's');
[strlat, strlng, status] = coordinate(startadd);

endadd = input('Enter destination: \n', 's');
[endlat, endlng, check] = coordinate(endadd);

while strcmp(status, 'OK')~= 1 || strcmp(check, 'OK')~= 1
    
    if strcmp(status, 'OK') == 0
        startadd = input('Enter VALID pickup location: \n', 's');
        [strlat, strlng, status] = coordinate(startadd);
    end
    
    if strcmp(check, 'OK') == 0
        endadd = input('Enter VALID destination: \n', 's');
        [endlat, endlng, check] = coordinate(endadd);
    end
end




timeres = Ubertime(strlat, strlng);
priceres = Uberprice(strlat, strlng, endlat, endlng);

distance = priceres(1).distance;
duration = priceres(1).duration;

fprintf('\n\nTrip distance: %.1f miles \n', distance)
fprintf('Trip duration: %f minutes \n', duration/60)
fprintf('-------------------- \n')



for i = 1:length(timeres)
    
name = timeres(i).Name;	
price = priceres(i).estimate;
surge = priceres(i).surge;
time = (timeres(i).estimate)/60;

fprintf('%s: %s | Surge Multiplier: %.1f. \n', name, price, surge)

fprintf('Current wait time: %d minutes \n\n\n', time)

end
