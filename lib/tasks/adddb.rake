# frozen_string_literal: true

namespace :adddb do
  desc 'TODO'
  task addstudent: :environment do
    arr = ('A'..'Z').to_a
    100.times do
      student = Student.new(name: "Nguyen Van #{arr.sample}", age: rand(15..22),
                            grades_attributes: [
                              { subject: 2, score: rand(1..9), semester: rand(0..1) },
                              { subject: 1, score: rand(1..9), semester: rand(0..1) }
                            ])
      if student.save
        puts 'Data imported successfully.'
      else
        puts "Error importing data: #{student.errors.full_messages.join(', ')}"
      end
    end
  end
end
