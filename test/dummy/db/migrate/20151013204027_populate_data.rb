class PopulateData < ActiveRecord::Migration[4.2]
  def change
    # name:string age:integer salary:decimal bio:text
    user_1 = User.create(:name => "John Smith", :age => 30, :salary => 123.45, :bio => 'This is text')
    user_2 = User.create(:name => "Bob Jones", :age => 22, :salary => nil, :bio =>'This is BIO')
    user_3 = User.create(:name => "Anna Smith", :age => 28, :salary => 100, :bio =>'This is another text')
    Comment.create(:user_id => user_1.id, :comment => 'This is comment #1')
    Comment.create(:user_id => user_1.id, :comment => 'This is comment #2')
    Comment.create(:user_id => user_2.id, :comment => 'This is comment #3')
    Comment.create(:user_id => user_3.id, :comment => 'This is comment #4')
    Comment.create(:user_id => user_3.id, :comment => 'This is comment #5')
  end
end
