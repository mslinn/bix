# ROM + DRY Showcase

Each branch of this repo addresses a different article in the
[series that Ryan Bigg wrote](https://ryanbigg.com/2020/02/rom-and-dry-showcase-part-1).

I updated the dependencies,
and updated the code according to the
[DRY release notes](https://github.com/dry-rb/dry-system/blob/main/CHANGELOG.md).


## Type Along
The instructions need to tweaked in order for them to work.
Following are updated commands.

 1. To create the PostgreSQL database, run:

        sudo su postgres -c createdb bix_dev

 2. Update `bundler`:

        bundle update --bundler

 3. To generate a migration with ROM, run:

        bundle exec rake "db:create_migration[create_users]"

 4. To run the migration, run:

        bundle exec rake db:migrate

 5. Run the `console` app:
    Auto require doesn't seem to be working.
    Not sure how to fix these errors.

    ```ruby
    $ bin/console

    irb(main):001:0> Bix::Repos::UserRepo.new(Bix::Application['container'])
    (irb):1:in '<main>': uninitialized constant Bix::Repos (NameError)
            from bin/console:8:in '<main>'

    irb(main):002:0> user_repo = Bix::Repos::UserRepo.new(Bix::Application['container'])
    (irb):2:in '<main>': uninitialized constant Bix::Repos (NameError)
            from bin/console:8:in '<main>'

    # This also fails, as reported by {https://github.com/radar/bix/pull/2/commits/705b5d88eca84fafbacf78305c6c227f25098c9e `mapanett`}
    irb(main):003:0> user_repo = Bix::Application['repos.user_repo']
    /mnt/_/work/ruby/bix/lib/bix/repos/user_repo.rb:3:in `<module:Repos>': uninitialized constant Bix::Repos::ROM (NameError)

    # Have not been able to run the following yet:
    irb(main):004:0> user_repo.create(first_name: "Ryan", last_name: "Bigg", age: 32)
    => #<ROM::Struct::User id=1 first_name="Ryan" last_name="Bigg" age=32 ...>

    irb(main):005:0> user_repo.all
    => [#<ROM::Struct::User id=1 first_name="Ryan" last_name="Bigg" age=32 ...>]
    ```
