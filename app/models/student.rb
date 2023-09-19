# frozen_string_literal: true

# == Schema Information
#
# Table name: students
#
#  id         :bigint           not null, primary key
#  age        :integer
#  avatar     :string(255)
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
class Student < ApplicationRecord
  acts_as_paranoid

  mount_uploader :avatar, AvatarUploader
  mount_uploader :video, MediaUploader
  mount_uploader :song, MediaUploader

  has_many :grades, dependent: :destroy
  accepts_nested_attributes_for :grades, update_only: true

  validates :name, presence: true
  validates :age, presence: true

  paginates_per 5
end
