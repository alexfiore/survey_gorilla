class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |r|
      r.belongs_to :user
      r.belongs_to :survey
      r.belongs_to :question
      r.belongs_to :choice
      r.timestamps
    end
  end
end
