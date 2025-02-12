WITH 

mobile_events AS (
  SELECT
    --Creating a column called event_source and naming it 'app' as these records com from mobile event data
    'app' AS event_source, 
    event_timestamp,
    event_name,
    user_id,
    user_access_type,
    session_id,
    device_locale_country AS country_code,
    item_id

 FROM {{ ref('src_mobile_events') }}
),

web_events AS (
  SELECT 
    --Creating a column called event_source and naming it 'web' as these records com from web event data
    'web' AS event_source,
    event_timestamp,
    event_name,
    user_id,
    user_access_type,
    session_id,
    country_code,
    item_id
  
  FROM {{ ref('src_web_events') }} 
)

SELECT * FROM mobile_events
UNION ALL 
SELECT * FROM web_events 
