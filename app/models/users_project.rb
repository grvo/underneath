class UsersProject < ActiveRecord::Base
    belongs_to :user
    belongs_to :project

    attr_protected :project_id, :project

    after_commit :update_gitosis_project

    validates_uniqueness_of :user_id, :scope => [:project_id]

    validates_presence_of :user_id
    validates_presence_of :project_id

    delegate :name, :email, :to => :user, :prefix => true

    def update_gitosis_project
        Gitosis.new.configure do |c|
            c.update_project(project.path, project.gitosis_writers)
        end
    end
end

# == informação de schema
#
# nome da tabela: users_projects
#
# id         :integer   não nulo, chave primária
# user_id    :integer   não nulo
# project_id :integer   não nulo
#
# read       :boolean   padrão(false)
# write      :boolean   padrão(false)
# admin      :boolean   padrão(false)
#
# created_at :datetime
# updated_at :datetime