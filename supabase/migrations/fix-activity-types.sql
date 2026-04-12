-- Fix: Update lessons to use correct activity types
-- Execute no SQL Editor

-- Update activities that use "activity" type to use "multiple_choice"
UPDATE public.lessons 
SET activity_data = (
  SELECT jsonb_agg(
    CASE 
      WHEN (step->>'type') = 'activity' THEN
        step || '{"type": "multiple_choice"}'::jsonb - 'type'
      ELSE step
    END
  )
  FROM jsonb_array_elements(activity_data) AS step
);

-- Check if update worked
SELECT id, title, jsonb_array_length(activity_data) as total_steps 
FROM public.lessons 
ORDER BY section_id, lesson_number;