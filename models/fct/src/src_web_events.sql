WITH 
web_events AS (
    SELECT
        event_name,
        event_timestamp,
        user_id,
        fingerprint,
        arrival_timestamp,
        browser_name,
        browser_version,
        language,
        screen_resolution,
        device_type,
        cookies_enabled,
        session_id,
        user_access_type,
        country_code,
        referrer,
        item_id,
        item_type,
        item_title
    FROM {{ source('Raw', 'raw_web_events') }}

)
SELECT * FROM web_events