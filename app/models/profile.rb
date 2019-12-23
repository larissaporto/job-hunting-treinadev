class Profile < ApplicationRecord
  belongs_to :applicant
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
