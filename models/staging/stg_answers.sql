{{ config(materialized='view') }}

SELECT
  answer_id,
  question_id,
  creation_date AS creation_ts,
  owner_user_id,
  answer_score,
  body
FROM `so-assessment-478013.so_assessment_us.answers`;

