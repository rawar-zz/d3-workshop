-- load data
userid_track_data = LOAD 'users_tracks_data.tsv' AS (user_id, country, artist_name, track_name);

-- select the hole 100%
userid_track_data_sample = SAMPLE userid_track_data 1;

-- group by country, artist_nane and track_name
grouped_userid_track_data = GROUP userid_track_data_sample BY (country, artist_name, track_name);

-- values by user by country, artist and trackname
counted_grouped = FOREACH grouped_userid_track_data GENERATE 'Top-10-per-Land', FLATTEN(group), COUNT(userid_track_data_sample.user_id) AS counter;

grouped_by_country = GROUP counted_grouped BY country; 

-- select for every country the top 10 tracks
top_10_by_country = FOREACH grouped_by_country {
	ordered_by_tracks = ORDER counted_grouped BY counter DESC;
	top_10_tracks = LIMIT ordered_by_tracks 10;
	GENERATE FLATTEN(top_10_tracks);
}

-- order countries by size
ordered_by_country = ORDER top_10_by_country BY $0, $1, $2, $3 DESC;

-- store results
STORE ordered_by_country INTO 'ordered_by_country.tsv';
