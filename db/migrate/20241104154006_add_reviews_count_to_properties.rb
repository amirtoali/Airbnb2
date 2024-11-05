class AddReviewsCountToProperties < ActiveRecord::Migration[7.0]
  def change
    add_column :properties, :reviews_count, :integer,  default: 0, null: false
  end
end
