

```
$ rails g scaffold name:string
$ rails g model profile profilable:references{polymorphic} disription:string
```

```db/migrate/20160621160304_create_profiles.rb
class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :profilable, polymorphic: true, index: true
      t.string :disription

      t.timestamps null: false
    end
  end
end
```

```app/models/profile.rb
class Profile < ActiveRecord::Base
  belongs_to :profilable, polymorphic: true
end
```

```app/models/user.rb
class User < ActiveRecord::Base
  has_one :profile, :as => :profilable
end
```

```
u = User.create(name: 'aaa')
u.profile = Profile.create(disription: 'test')
```

```sql
sqlite> select * from users;
id          name        created_at                  updated_at
----------  ----------  --------------------------  --------------------------
1           aaa         2016-06-21 16:07:03.154460  2016-06-21 16:07:03.154460

sqlite> select * from profiles;
id          profilable_id  profilable_type  disription  created_at                  updated_at
----------  -------------  ---------------  ----------  --------------------------  --------------------------
1           1              User             test        2016-06-21 16:07:45.587894  2016-06-21 16:07:45.593233
```


```
$ rails g model shop name:string
$ rails g model profile profilable:references{polymorphic} disription:string
```
