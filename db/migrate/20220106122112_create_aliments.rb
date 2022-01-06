class CreateAliments < ActiveRecord::Migration[6.0]
  def change
    create_table :aliments do |t|

      t.timestamps
    end
  end
end
