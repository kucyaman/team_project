user1 = User.create!(
  email: "user@example.com",
  password: '12345',password_confirmation: '12345')
Profile.create!(
  name: "user01",
  user_id: user1.id)

user2 = User.create!(
  email: "user@example.com2",
  password: '12345',password_confirmation: '12345')
Profile.create!(
  name: "user02",
  user_id: user2.id)

user3 = User.create!(
  email: "user@example.com3",
  password: '12345',password_confirmation: '12345')
Profile.create!(
  name: "user03",
  user_id: user3.id)

user4 = User.create!(
  email: "user@example.com4",
  password: '12345',password_confirmation: '12345')
Profile.create!(
  name: "user04",
  user_id: user4.id)

user5 = User.create!(
  email: "user@example.com5",
  password: '12345',password_confirmation: '12345')
Profile.create!(
  name: "user05",
  user_id: user5.id)

user6 = User.create!(
  email: "user@example.com6",
  password: '12345',password_confirmation: '12345')
Profile.create!(
  name: "user06",
  user_id: user6.id)

CurriculumLog.create!(
  title: "Sample Curriculum Log1",
  body: "This is a sample curriculum log.",hour: 1,minutes: 00,
  user_id: user1.id,
  curriculum_id: 1,created_at: Time.zone.today+1)

CurriculumLog.create!(
  title: "Sample Curriculum Log2",
  body: "This is a sample curriculum log.",hour: 1,minutes: 00,
  user_id: user1.id,
  curriculum_id: 1,created_at: Time.zone.today+1)

CurriculumLog.create!(
  title: "Sample Curriculum Log3",
  body: "This is a sample curriculum log.",hour: 1,minutes: 00,
  user_id: user2.id,
  curriculum_id: 1,created_at: Time.zone.today+1)

CurriculumLog.create!(
  title: "Sample Curriculum Log4",
  body: "This is a sample curriculum log.",hour: 1,minutes: 00,
  user_id: user3.id,
  curriculum_id: 1,created_at: Time.zone.today+1)

CurriculumLog.create!(
  title: "Sample Curriculum Log5",
  body: "This is a sample curriculum log.",hour: 1,minutes: 00,
  user_id: user3.id,
  curriculum_id: 1,created_at: Time.zone.today+1)

CurriculumLog.create!(
  title: "Sample Curriculum Log6",
  body: "This is a sample curriculum log.",hour: 1,minutes: 00,
  user_id: user3.id,
  curriculum_id: 1,created_at: Time.zone.today+1)

CurriculumLog.create!(
  title: "Sample Curriculum Log7",
  body: "This is a sample curriculum log.",hour: 1,minutes: 00,
  user_id: user3.id,
  curriculum_id: 1,created_at: Time.zone.today+1)

CurriculumLog.create!(
  title: "Sample Curriculum Log8",
  body: "This is a sample curriculum log.",hour: 1,minutes: 00,
  user_id: user4.id,
  curriculum_id: 1,created_at: Time.zone.today+1)

CurriculumLog.create!(
  title: "Sample Curriculum Log9",
  body: "This is a sample curriculum log.",hour: 1,minutes: 00,
  user_id: user4.id,
  curriculum_id: 1,created_at: Time.zone.today+1)

CurriculumLog.create!(
  title: "Sample Curriculum Log10",
  body: "This is a sample curriculum log.",hour: 1,minutes: 00,
  user_id: user4.id,
  curriculum_id: 1,created_at: Time.zone.today+1)

CurriculumLog.create!(
  title: "Sample Curriculum Log11",
  body: "This is a sample curriculum log.",hour: 1,minutes: 00,
  user_id: user5.id,
  curriculum_id: 1,created_at: Time.zone.today+1)

CurriculumLog.create!(
  title: "Sample Curriculum Log12",
  body: "This is a sample curriculum log.",hour: 1,minutes: 00,
  user_id: user5.id,
  curriculum_id: 1,created_at: Time.zone.today+1)

CurriculumLog.create!(
  title: "Sample Curriculum Log13",
  body: "This is a sample curriculum log.",hour: 1,minutes: 00,
  user_id: user5.id,
  curriculum_id: 1,created_at: Time.zone.today+1)

CurriculumLog.create!(
  title: "Sample Curriculum Log14",
  body: "This is a sample curriculum log.",hour: 1,minutes: 00,
  user_id: user5.id,
  curriculum_id: 1,created_at: Time.zone.today+1)

CurriculumLog.create!(
  title: "Sample Curriculum Log15",
  body: "This is a sample curriculum log.",hour: 1,minutes: 00,
  user_id: user5.id,
  curriculum_id: 1,created_at: Time.zone.today+1)

CurriculumLog.create!(
  title: "Sample Curriculum Log16",
  body: "This is a sample curriculum log.",hour: 1,minutes: 00,
  user_id: user6.id,
  curriculum_id: 1,created_at: Time.zone.today+1)

CurriculumLog.create!(
  title: "Sample Curriculum Log17",
  body: "This is a sample curriculum log.",hour: 1,minutes: 00,
  user_id: user6.id,
  curriculum_id: 1,created_at: Time.zone.today+1)

CurriculumLog.create!(
  title: "Sample Curriculum Log18",
  body: "This is a sample curriculum log.",hour: 1,minutes: 00,
  user_id: user6.id,
  curriculum_id: 1,created_at: Time.zone.today+1)

CurriculumLog.create!(
  title: "Sample Curriculum Log19",
  body: "This is a sample curriculum log.",hour: 1,minutes: 00,
  user_id: user6.id,
  curriculum_id: 1,created_at: Time.zone.today+1)

CurriculumLog.create!(
  title: "Sample Curriculum Log20",
  body: "This is a sample curriculum log.",hour: 1,minutes: 00,
  user_id: user6.id,
  curriculum_id: 1,created_at: Time.zone.today+1)

CurriculumLog.create!(
  title: "Sample Curriculum Log21",
  body: "This is a sample curriculum log.",hour: 1,minutes: 00,
  user_id: user6.id,
  curriculum_id: 1,created_at: Time.zone.today+1)
