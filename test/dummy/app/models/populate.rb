class Populate

  def Populate.populate
    require 'populator'
    require 'faker'

    Account.populate 20 do |account|
      account.name = Faker::Company.name
      account.users_count = rand(100)
    end

    Comment.populate 500 do |comment|
      comment.user_id = rand(100)
      comment.comment = Populator.sentences(2..10)
    end

    Contact.populate 200 do |contact|
      contact.name =  Faker::Name.name
      contact.email = Faker::Internet.email
      contact.message = Populator.sentences(2..10)
    end

    User.populate 100 do |user|
      user.name = Faker::Name.name
      user.age = rand(99)
      user.salary = rand(5000)
      user.bio = Populator.sentences(2..10)
      user.account_id = rand(3)
      user.dob = Date.today - rand(10000).days
    end

    Project.populate 100 do |project|
      project.name = Faker::Company.name
    end

    LegacyAccount.populate 100 do |account|
      account.uuid = rand(1_000_000)
      account.name = Faker::Company.name
    end
  end

end

