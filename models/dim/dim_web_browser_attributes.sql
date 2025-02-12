WITH
dim_web_browser_attributes AS (
    SELECT
        session_id,
        user_id,
        fingerprint,
        browser_name,
        browser_version,
        language,screen_resolution,
        device_type,
        cookies_enabled,
        referrer
FROM {{ ref('src_web_events') }}
)
SELECT * FROM dim_web_browser_attributes