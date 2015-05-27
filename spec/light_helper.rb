require 'active_model'
require 'active_support/all'
require 'arch_presenter'
require 'factory_girl'

## Fake active record
module ActiveRecord
  class Base
    def self.devise(*args)
    end
    def self.before_save(*args)
    end
  end
end


## Additional folders

folders = ['models', 'services', 'forms', 'presenters']

Dir[__dir__ + '/../lib/**/*.rb'].each {|file| require file }

folders.each do |folder_name|
  Dir[__dir__ + "/../app/#{folder_name}/*.rb"].each {|file| require file }
end

Dir[__dir__ + '/factories/**/*.rb'].each {|file| require file }

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

