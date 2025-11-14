{{ config(materialized='view') }}

WITH raw AS (
    SELECT
        question_id,
        tags
    FROM {{ ref('stg_questions') }}
),

split_tags AS (
    SELECT
        question_id,
        REGEXP_EXTRACT_ALL(tags, r"<([^>]+)>") AS tag_list
    FROM raw
),

unnested AS (
    SELECT
        question_id,
        tag
    FROM split_tags,
    UNNEST(tag_list) AS tag
)

SELECT
    question_id,
    LOWER(tag) AS tag_name
FROM unnested;
