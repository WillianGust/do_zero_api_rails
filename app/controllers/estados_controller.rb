class EstadosController < ApplicationController

  
  def proxy 
    estados = RestClient.get("http://localhost:4000/estados.json")
    render json: estados.body, status: 200
  end

  def index 
    estados = [
      {nome:"Sao Paulo", uf: "SP"},
      {nome:"Rio de Janeiro", uf: "RJ"},
      {nome:"Minas Gerais", uf: "MG"},
      {nome:"Goias", uf: "GO"},
      {nome:"Espirito Santo", uf: "ES"} 
    ]
    if params["uf"].present?
      estados = estados.select{ks|e| e[:uf].downcase == params["uf"].downcase}
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

  def lista_bairros 
    bairros = [
      {nome:"Jardim America", uf: "SP"},
      {nome:"Bairro Fundo", uf: "SP"},
      {nome:"Barra Funda", uf: "RJ"},
      {nome:"Rocinha", uf: "RJ"},
      {nome:"Bairro Mineiro", uf: "MG"},
      {nome:"Pantanal", uf: "GO"},
      {nome:"Bairro sem fim", uf: "ES"} 
    ]
    if params["uf"].present?
      bairros = bairros.select{|e| e[:uf].downcase == params["uf"].downcase}
    end
    render json: bairros, status: 200
  end
end
