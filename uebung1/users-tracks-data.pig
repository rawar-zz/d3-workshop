/*
users-tracks-samples.pig
generates a sample of 10 tracks per users
*/

tracks = LOAD 'lastfm-dataset-1K/userid-timestamp-artid-artname-traid-traname.tsv' AS (user_id, timestamp, mb_artist_id, artist_name, mb_track_id, track_name);

users = LOAD 'lastfm-dataset-1K/userid-profile.tsv' AS (user_id, gender, age: int, country, signup);

users_with_countries = FILTER users BY (country IS NOT NULL);
users_with_gender = FILTER users_with_countries BY (gender IS NOT NULL);
users_with_age = FILTER users_with_gender BY (age IS NOT NULL);

users_data = FOREACH users_with_age GENERATE user_id, country, gender, age;
tracks_data = FOREACH tracks GENERATE user_id, artist_name, track_name;

users_tracks = JOIN tracks_data BY user_id, users_data BY user_id;

users_tracks_data = FOREACH users_tracks GENERATE users_data::user_id, country, gender, age, artist_name, track_name;

STORE users_tracks_data INTO 'users_tracks_data.tsv';
