class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.json :data

      t.timestamps
    end
  end
end
