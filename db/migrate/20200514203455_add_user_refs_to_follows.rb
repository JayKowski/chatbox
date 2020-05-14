class AddUserRefsToFollows < ActiveRecord::Migration[5.2]
  def change
    add_reference :follows, :follower, references: :users, index: true
    add_reference :follows, :followee, references: :users, index: true
    add_foreign_key :follows, :users, column: :follower_id
    add_foreign_key :follows, :users, column: :followee_id
  end
end
