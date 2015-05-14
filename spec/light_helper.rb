require 'active_model'
require 'arch_presenter'

folders = ['models', 'services', 'forms', 'presenters']

Dir[__dir__ + '/../lib/**/*.rb'].each {|file| require file }

folders.each do |folder_name|
  Dir[__dir__ + "/../app/#{folder_name}/*.rb"].each {|file| require file }
end
