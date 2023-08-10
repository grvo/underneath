require File.expand_path('../boot', __FILE__)
require 'rails/all'

if defined?(Bundler)
    # usar essa linha para casos de pre-compilação dos assets antes de lançar em produção
    Bundler.require *Rails.groups(:assets => %w(development test))

    # usar essa linha para casos de assets compilados em produção
    # Bundle.require(:default, :assets, Rails.env)
end

module Gitlab
    class Application < Rails::Application
        # configurações em config/environments/* toma precedência dos especificados aqui.
        #
        # configuração de aplicação deve ir para os arquivos de config/initializers
        # -- todos os arquivos .rb desse diretório são automaticamente carregados.

        # diretórios customizados com classes e módulos que serão auto-carregados.
        # config.autoload_paths += %W(#{config.root}/extras)

        # apenas carregar os plugins nomeados aqui, em outra ordem recebida (padrão é alfabeto).
        # :all pode ser utilizado como placeholder para todos os plugins sem nome explícito.
        #
        # config.plugins = [ :exception_notification, :sll_requirement, :all ]

        # ativar observadores que deverão estar sempre rodando.
        #
        # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

        # determinar Time.zone padrão para zona específica e auto-conversão de active record para essa zona.
        # rodar "rake -D time" para uma lista de tarefas para encontrar nomes de time zones. padrão é utc.
        #
        # config.time_zone = 'central time (us & canada)'

        # o locale padrão é :en e todas as traduções de config/locales/*.rb,yml são auto-carregados.
        #
        # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
        # config.i18n.default_locale = :de

        # configurar o encoding padrão usado em templates para o ruby 1.9
        config.encoding = "utf-8"

        # configurar parâmetros sensitivos que serão filtrados para o arquivo log.
        config.filter_parameters += [:password]

        # habilitar a pipeline de asset
        config.assets.enabled = true

        # versão dos seus assets, mudar isso para expirar todos os seus assets
        config.assets.version = '1.0'
    end
end