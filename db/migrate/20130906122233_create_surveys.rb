class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |s|
      s.belongs_to :user
      s.string :name

      s.timestamps
    end
  end
end
