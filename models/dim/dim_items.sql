
WITH
web_events_items AS (
    SELECT 
        DISTINCT 
            item_id,
            item_type,
            item_title
    FROM {{ ref('src_web_events') }}
    WHERE item_id IS NOT NULL
),

mobile_events_items AS (
    SELECT 
        DISTINCT 
            item_id,
            item_type,
            item_title
    FROM {{ ref('src_mobile_events') }}
    WHERE item_id IS NOT NULL
)

SELECT * FROM web_events_items
UNION ALL
SELECT * FROM mobile_events_items
