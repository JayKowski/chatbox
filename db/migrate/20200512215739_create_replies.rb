class CreateReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :replies do |t|
      t.string :reply_body

      t.timestamps
    end
  end
end
