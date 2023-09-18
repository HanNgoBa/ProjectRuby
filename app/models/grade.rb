# frozen_string_literal: true

# == Schema Information
#
# Table name: grades
#
#  id         :bigint           not null, primary key
#  score      :integer
#  semester   :string(255)
#  subject    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  student_id :bigint           default(0), not null
#
# Indexes
#
#  index_grades_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (student_id => students.id)
#
class Grade < ApplicationRecord
  belongs_to :student
  enum subject: {
    match: 0,
    english: 1,
    history: 2,
    physical: 3
  }
  enum semester: {
    'Hoc ki 1': 0,
    'Hoc ki 2': 1
  }
  validates :score, presence: true
  validates :subject, presence: true
end
