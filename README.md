# party_mover
Move your content uploaded by CarrierWave from one server to another

# Usage
Imagine you have `User` class with `avatar`:

```ruby
class User < ActiveRecord::Base
  # ...
  mount_uploader :avatar, AvatarUploader 
end
```
And the next `AvatarUploader` configured for Amazon S3:

```ruby
class AvatarUploader < CarrierWave::Uploader::Base
  storage :aws
  # ...
end
```

Create another `AnotherAvatarUploader` configured for another server:

```ruby
class AnotherAvatarUploader < CarrierWave::Uploader::Base
  storage :fog

  def initialize(*)
    super
    self.fog_credentials = {
      :provider               => "YOUR_PROVIDER",
      :openstack_auth_url     => "YOUR_AUTH_URL",
      :openstack_username      => "YOUR_USERNAME",
      :openstack_api_key  => "YOUR_API_KEY",
    }
    self.fog_directory = "YOUR_DIRECTORY"
  end
end
```

And move your avatars with `PartyMover`:

```ruby
PartyMover.move!(AnotherAvatarUploader, :avatar, User.all)
```

After that just reconfigure your `AvatarUploader` for new server or change your `User` model in this way:
```ruby
class User < ActiveRecord::Base
  # ...
  mount_uploader :avatar, AnotherAvatarUploader 
end
```
