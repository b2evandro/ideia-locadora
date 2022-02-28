class Favorite < ActiveRecord::Base
  # BELONGS_TO ==> informa que o Favorite tem um User|Movie, no singular.
  # Assim permitindo acessar o pai, mas não o inverso sem o "has_many"
  belongs_to :user
  belongs_to :movie

  before_validation :seta_data_criacao, on: :create
  before_validation :seta_data_atualizacao, :verfica_unico_registro

  def seta_data_criacao
    self.created_at = Time.now
  end

  def seta_data_atualizacao
    self.updated_at = Time.now
  end

  def verfica_unico_registro
    if Favorite.where(movie_id: self.movie_id, user_id: self.user_id).count > 0
      # error.add :nomeDoAtributo, :mensagemDeErro
      errors.add(:base, "Já existe um registro para este filme e usuário")
    end
  end
end
