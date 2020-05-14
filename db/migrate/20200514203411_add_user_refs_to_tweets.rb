class AddUserRefsToTweets < ActiveRecord::Migration[5.2]
  def change
    add_reference :tweets, :author, references: :users, index: true
    add_foreign_key :tweets, :users, column: :author_id
  end
end
