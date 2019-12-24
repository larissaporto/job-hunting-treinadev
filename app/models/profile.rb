class Profile < ApplicationRecord
  belongs_to :applicant
  has_one_attached :photo
  has_many :applies
  has_many :jobs, through: :applies
  
  enum condition: {
    incomplete: 0,
    done: 10
  }
  
  enum qualification: {
    'Sem Formação': 0,
    'Primeiro Grau': 5,
    'Primeiro Grau Incompleto': 10,
    'Segundo Grau': 15,
    'Segundo Grau Incompleto': 20,
    'Bacharelado': 25,
    'Pós Graduação': 30,
    'Mestrado': 35,
    'Doutorado': 40
  }
end
