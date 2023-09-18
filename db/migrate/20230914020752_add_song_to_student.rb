# frozen_string_literal: true

class AddSongToStudent < ActiveRecord::Migration[7.0]
  def change
    add_column :students, :song, :string
  end
end
