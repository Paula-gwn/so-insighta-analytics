{{ config(materialized='view') }}

SELECT
  question_id,
  creation_date AS creation_ts,
  owner_user_id,
  accepted_answer_id,
  question_score,
  view_count,
  title,
  body,
  tags,
  favorite_count,
  answer_count
FROM `so-assessment-478013.so_assessment_us.questions`;

