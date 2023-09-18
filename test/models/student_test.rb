# frozen_string_literal: true

# == Schema Information
#
# Table name: students
#
#  id         :bigint           not null, primary key
#  age        :integer
#  avatar     :string(255)
#  delete_dat :datetime
#  deleted_at :datetime
#  name       :string(255)
#  phone      :string(255)
#  song       :string(255)
#  video      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_students_on_deleted_at  (deleted_at)
#
require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
