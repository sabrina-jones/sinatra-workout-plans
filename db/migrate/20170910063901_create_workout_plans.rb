class CreateWorkoutPlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :name
      t.integer :user_id
    end
  end
end
