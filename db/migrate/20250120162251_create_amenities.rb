class CreateAmenities < ActiveRecord::Migration[7.0]
  def change
    create_table :amenities do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
