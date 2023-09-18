# frozen_string_literal: true

class CreateGrades < ActiveRecord::Migration[7.0]
  def change
    create_table :grades do |t|
      t.string :subject
      t.integer :score
      t.string :semester
      t.references :student, null: false, default: 0, foreign_key: true

      t.timestamps
    end
  end
end
