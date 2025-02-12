WITH
web_events_arrival_timestamp AS (
  SELECT 
    user_id, 
    session_id, 
    event_timestamp,
    arrival_timestamp 
  FROM {{ ref('src_web_events') }}
),

mobile_events_arrival_timestamp AS (
  SELECT 
    user_id, 
    session_id, 
    event_timestamp,
    arrival_timestamp 
  FROM {{ ref('src_mobile_events') }}
)

SELECT * FROM web_events_arrival_timestamp
UNION ALL
SELECT * FROM mobile_events_arrival_timestamp