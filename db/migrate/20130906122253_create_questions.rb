class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |q|
      q.belongs_to :survey

      q.string :text
      q.timestamps
    end
  end
end
