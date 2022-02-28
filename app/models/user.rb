class User < ActiveRecord::Base
  # O nome do outro modelo é PLURALIZADO ao declarar uma has_many associação.
  # Quando usado com o belongs_to tem uma relação de um para muitos BIDIRECIONAL.
  has_many :favorites
end
