# esse arquivo é utilizado pelos servidores de rack para inicializar a aplicação.

require ::File.expand_path('../config/environment', __FILE__)

run Gitlab::Application