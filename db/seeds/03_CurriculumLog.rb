30.times do
  CurriculumLog.create!(
    title: "Sample Curriculum Log",
    body: "This is a sample curriculum log.",
    hour: 1,
    minutes: 30,
    user_id: 1,
    curriculum_id: 1,
    chapter_id: 1
  )
end