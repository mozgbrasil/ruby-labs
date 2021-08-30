[checkmark]: https://raw.githubusercontent.com/mozgbrasil/mozgbrasil.github.io/master/assets/images/logos/logo_32_32.png 'MOZG'

![valid XHTML][checkmark]

# Ruby

release/1.0.0_2
## 

I resorted to downgrading to Ruby 2.6 because I was experiencing inconsistent and strange behavior by the VS code debugger after upgrading to Ruby 2.7. Not worth it.

```bash


rbenv install -l # list latest stable versions
gem -v
ruby -v
jekyll -v
bundle -v
rvm current
rvm list
rvm info
rbenv which irb

```

## 

```bash

ls -lah $HOME

which bundle
bundle check
bundle env
bundle list # gem install
bundle show --paths

bundle info pg



rm Gemfile.lock

bundle config list

bundle config set path 'vendor/bundle'

# To Install Gem in system wide avoiding path vendor/bundle, just run the following command in project directory
# bundle install --system
bundle config set system 'true'

bundle config set deployment 'false'

bundle config list

bundle install --path="vendor/bundle"



bundle show --paths

which gem

gem env
gem env home
gem list



which ruby

ruby --version

ruby shell.rb

bundle exec ruby shell.rb



which rubocop

bundle info rubocop

rubocop

bundle exec rubocop

bundle exec which rubocop



ruby -e 'puts Gem::Specification.all_names'

gem list | grep "ide"
gem list | grep "debase"

rake --version
bundle exec rake --version

ruby --version

bundle list # gem install

gem list

printf "\n\"env\": {\n  \"PATH\": \"$PATH\",\n  \"GEM_HOME\": \"$GEM_HOME\",\n  \"GEM_PATH\": \"$GEM_PATH\",\n  \"RUBY_VERSION\": \"$RUBY_VERSION\"\n}\n\n"

# /usr/local/rvm/rubies/ruby-2.7.2/lib/ruby/2.7.0/rubygems/core_ext/kernel_require.rb:92:in `require': cannot load such file -- pg (LoadError)


rvm list
rvm info
rvm use 2.6
rvm install "ruby-2.6.6"


```

## 
