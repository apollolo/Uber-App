function [timeres] = Ubertime(strlat, strlng)

data = webread('https://api.uber.com/v1/estimates/time?', 'start_latitude', strlat, 'start_longitude', strlng, 'server_token', '1oftJ_WqYEl9e8cxVu7Se-sNLKkKn2pvy3ckRuHQ');

for i = 1:length(data.times)
timeres(i) = struct('Name', data.times(i).localized_display_name, 'estimate', data.times(i).estimate);
end

end