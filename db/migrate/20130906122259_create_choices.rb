class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |c|
      c.belongs_to :question

      c.string :text
      c.timestamps
    end
  end
end
