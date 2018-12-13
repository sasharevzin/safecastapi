-- imbrogno_export and the SQL-Query imbrogno_export.sql:
-- Exports all datasets into a csv file, where the location is within a radius of 3000 meter from
-- the citycenter of: Uppsala, Hong Kong, Seoul, Taipei, Amsterdam, Perth, Sydney, Honolulu and Munich
-- to prevent a timeout of the API
--                                                                                                                                                                                                 Uppsala                                                              Hong Kong                                                            Seoul                                                                     Taipei                                                                    Amsterdam                                                               Perth                                                              Sydney                                                            Honolulu                                                                   Munich
\copy (select id, user_id, captured_at, ST_Y(location::geometry), ST_X(location::geometry), value, unit, device_id from measurements WHERE location IS NOT NULL AND (ST_DWithin(location, ST_Point(17.6411, 59.8597)::geography, 3000) OR ST_DWithin(location, ST_Point(114.166667, 22.3)::geography, 3000) OR ST_DWithin(location, ST_Point(126.978135, 37.565654)::geography, 3000) OR ST_DWithin(location, ST_Point(121.533333, 25.033333)::geography, 3000) OR ST_DWithin(location, ST_Point(4.890444, 52.370197)::geography, 3000) OR ST_DWithin(location, ST_Point(115.85, -31.95)::geography, 3000) OR ST_DWithin(location, ST_Point(151.2, -33.85)::geography, 3000) OR ST_DWithin(location, ST_Point(-157.826111, 21.308889)::geography, 3000) OR ST_DWithin(location, ST_Point(11.575556, 48.137222)::geography, 3000)) AND value IS NOT NULL )to '/tmp/imbrogno_export.csv' csv
