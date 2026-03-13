class Veiculo < ApplicationRecord

  before_validation do
    self.placa = placa.upcase if placa.present?
  end

  before_save do
    self.placa = placa.upcase
  end


  validates :modelo, presence: true
  validates :marca,  presence: true
  validates :ano,    presence: true

  validates :placa,
            presence: true,
            uniqueness: true,
            format: {
              with: /\A([A-Z]{3}[0-9]{4}|[A-Z]{3}[0-9][A-Z][0-9]{2})\z/,
              message: "formato inválido (ex: ABC1234 ou ABC1D23)"
            }


  def self.ransackable_attributes(auth_object = nil)
    [
      "ano",
      "created_at",
      "id",
      "marca",
      "modelo",
      "placa",
      "updated_at"
    ]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

end