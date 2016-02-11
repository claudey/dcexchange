class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string :title
      t.date :date
      t.time :time
      t.text :description
      t.string :youtube
      t.string :event_url
      t.string :questions_url
      t.boolean :next_in_line

      t.timestamps null: false
    end
  end
end
