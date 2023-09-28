# == Schema Information
#
# Table name: classrooms
#
#  id         :bigint           not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  teacher_id :bigint
#
# Indexes
#
#  index_classrooms_on_teacher_id  (teacher_id)
#
class Classroom < ApplicationRecord
    belongs_to :teacher

    paginates_per 5

end
