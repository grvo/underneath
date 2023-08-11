# encoding: UTF-8
#
# esse arquivo é auto-gerado a partir do estado atual do banco de dados.
# para casos de edição de arquivo, usar feature de migrações de active record para modificar a database e assim regenerar uma definição de schema.
#
# note que essa definição schema.rb é a fonte do schema do banco de dados.
# para casos de uma criação de uma database do aplicativo ou outro sistema,
# usar então db:schema:load, não rodando todas as migrações do scratch.
#
# altamente recomendado checar o arquivo por meio do sistema de controle de versão.

ActiveRecord::Schema.define(:version => 20111005193700) do
    create_table "issues", :force => true do |t|
        t.string   "title"
        t.text     "content"

        t.integer  "assignee_id"
        t.integer  "author_id"
        t.integer  "project_id"

        t.datetime "created_at"
        t.datetime "updated_at"

        t.boolean  "closed",    :default => false, :null => false
    end

    create_table "keys", :force => true do |t|
        t.integer  "user_id",   :null => false

        t.datetime "created_at"
        t.datetime "updated_at"

        t.text     "key"

        t.string   "title"
        t.string   "identifier"
    end

    create_table "notes", :force => true do |t|
        t.string   "note"
        t.string   "noteable_id"
        t.string   "noteable_type"

        t.integer  "author_id"

        t.datetime "created_at"
        t.datetime "updated_at"

        t.integer  "project_id"
        t.string   "attachment"
    end

    create_table "projects", :force => true do |t|
        t.string   "name"
        t.string   "path"

        t.text     "description"

        t.datetime "created_at"
        t.datetime "updated_at"

        t.boolean  "private_flag", :default => true, :null => false
        t.string   "code"
    end

    create_table "users", :force => true do |t|
        t.string   "email",                                :default => "", :null => false
        t.string   "encrypted_password",    :limit => 128, :default => "", :null => false
        t.string   "reset_password_token"

        t.datetime "reset_password_sent_at"
        t.datetime "remember_created_at"

        t.integer  "sign_in_count",                        :default => 0
        
        t.datetime "current_sign_in_at"
        t.datetime "last_sign_in_at"
        
        t.string   "current_sign_in_ip"
        t.string   "last_sign_in_ip"
        
        t.datetime "created_at"
        t.datetime "updated_at"
        
        t.string   "name"
        
        t.boolean  "admin",                                :default => false, :null => false
        t.boolean  "allowed_create_repo",                  :default => true, :null => false
    end

    add_index "users", ["email"], :name => "index_users_on_email", unique => true
    add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

    create_table "users_projects", :force => true do |t|
        t.integer  "user_id",                       :null => false
        t.integer  "project_id",                    :null => false
        
        t.boolean  "read",        :default => false
        t.boolean  "write",       :default => false
        t.boolean  "admin",       :default => false

        t.datetime "created_at"
        t.datetime "updated_at"
    end
end