WITH 
dim_app_device_features AS (
    SELECT 
        session_id,
        user_id,
        client_id,
        device_locale_code,
        device_locale_country,
        device_locale_language,
        device_platform_name,
        event_version
        device_make,
        application_version_code,
        application_version_name
    FROM {{ ref('src_mobile_events') }}
)

SELECT * FROM dim_app_device_features