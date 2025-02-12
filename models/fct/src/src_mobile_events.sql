WITH 
mobile_events AS (
    SELECT
        event_name,
        application_version_code,
        application_version_name,
        arrival_timestamp,
        category,
        client_id,
        device_locale_code,
        device_locale_country,
        device_locale_language,
        device_make,
        device_platform_name,
        event_timestamp,
        event_version,
        session_id,
        user_access_type,
        user_id,
        item_id,
        item_type,
        item_title
    FROM {{ source('Raw', 'raw_mobile_events') }}

)
SELECT * FROM mobile_events