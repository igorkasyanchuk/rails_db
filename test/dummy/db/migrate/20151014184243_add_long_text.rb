class AddLongText < ActiveRecord::Migration[4.2]
  def change
    text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ligula arcu, commodo et mauris ut, efficitur aliquet ex. Aliquam iaculis justo maximus, dapibus nibh a, tincidunt enim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque hendrerit pharetra nulla, ac euismod tellus rutrum non. Ut tortor enim, tincidunt vitae pharetra quis, tincidunt sit amet felis. Sed convallis nulla sed urna finibus aliquet. Aliquam a molestie orci. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum in finibus sem, ut sagittis enim.
Sed nulla sem, suscipit sit amet lobortis eget, gravida in lectus. In sagittis urna sit amet commodo egestas. Donec vulputate, orci ac gravida congue, orci arcu facilisis ante, sed blandit quam lacus ullamcorper eros. Duis vitae sem et eros luctus tempor et ut neque. Donec at molestie quam, vel gravida velit. Etiam eu consectetur massa, sit amet vehicula risus. Nullam elementum, neque non dignissim dignissim, arcu erat lobortis orci, quis venenatis eros nibh ac risus."
    User.last.update_attribute :bio, text
  end
end
