0. pig starten

1. Beispieldaten einlesen mit

grunt>users_tracks_data = LOAD 'users_tracks_data.tsv' AS (user_id:chararray, country:chararray, gender:chararray, age:int, artist_name:chararray, track_name:chararray);

2. Daten filtern mit

grunt>tracks_from_germany = FILTER users_tracks_data BY country == 'Germany';

3. Daten gruppieren mit

grunt>grouped_tracks = GROUP tracks_from_germany BY (artist_name, track_name);

4. SELECT count(...) mit

grunt>counted_tracks = FOREACH grouped_tracks GENERATE FLATTEN(group), COUNT(tracks_from_germany) AS count;

5. Daten sortieren

grunt>ordered_tracks = ORDER counted_tracks BY count DESC;

6. Die Top 100 speichern

grunt>top_100_tracks = LIMIT ordered_tracks 100;
grunt>uTORE top_100_tracks INTO 'top_100_tracks.tsv';
