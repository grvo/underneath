# carregar a aplicação rails
require File.expand_path('../application', __FILE__)

# inicializar a aplicação rails
Gitlab::Application.initialize!

require File.join(Rails.root, "lib", "gitosis")