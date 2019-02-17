function [priceres] = Uberprice(strlat, strlng, endlat, endlng)

data = webread('https://api.uber.com/v1/estimates/price?', 'start_latitude', strlat, 'start_longitude', strlng, 'end_latitude', endlat, 'end_longitude', endlng, 'server_token', '1oftJ_WqYEl9e8cxVu7Se-sNLKkKn2pvy3ckRuHQ');

for i = 1:length(data.prices)
priceres(i) = struct('Name', data.prices(i).localized_display_name, 'distance', data.prices(i).distance, 'surge', data.prices(i).surge_multiplier, 'estimate' , data.prices(i).estimate, 'duration', data.prices(i).duration); 
end

end