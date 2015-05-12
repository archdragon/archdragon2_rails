require 'active_model'
Dir[__dir__ + '/../lib/**/*.rb'].each {|file| require file }
Dir[__dir__ + '/../app/models/*.rb'].each {|file| require file }
Dir[__dir__ + '/../app/services/*.rb'].each {|file| require file }
Dir[__dir__ + '/../app/forms/*.rb'].each {|file| require file }
