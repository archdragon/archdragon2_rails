require 'active_model'
require 'active_support/all'
require 'arch_presenter'
require 'factory_girl'

folders = ['models', 'services', 'forms', 'presenters']

Dir[__dir__ + '/../lib/**/*.rb'].each {|file| require file }

folders.each do |folder_name|
  Dir[__dir__ + "/../app/#{folder_name}/*.rb"].each {|file| require file }
end

Dir[__dir__ + '/factories/**/*.rb'].each {|file| require file }

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

