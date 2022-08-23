class EstadosController < ApplicationController
  def index 
    estados = [
      {nome:"Sao Paulo", uf: "SP"},
      {nome:"Rio de Janeiro", uf: "RJ"},
      {nome:"Minas Gerais", uf: "MG"},
      {nome:"Goias", uf: "GO"},
      {nome:"Espirito Santo", uf: "ES"} 
    ]
    if params["uf"].present?
      estados = estados.select{|e| e[:uf].downcase == params["uf"].downcase}
    end
    render json: estados, status: 200
  end

  def lista_cidades 
    cidades = [
      {nome:"Jundiai", uf: "SP"},
      {nome:"Campinas", uf: "SP"},
      {nome:"Niteroi", uf: "RJ"},
      {nome:"Cabo Frio", uf: "RJ"},
      {nome:"Tres Coracoes", uf: "MG"},
      {nome:"Formosa", uf: "GO"},
      {nome:"Vila Velha", uf: "ES"} 
    ]
    if params["uf"].present?
      cidades = cidades.select{|e| e[:uf].downcase == params["uf"].downcase}
    end
    render json: cidades, status: 200
  end
end