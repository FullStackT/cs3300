class Project < ApplicationRecord
    #requiring a title and description for each project
    validates_presence_of :title, :description
end
