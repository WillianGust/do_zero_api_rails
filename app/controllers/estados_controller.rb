class EstadosController < ApplicationController
  
  def proxy 
    estados = RestClient.get("http://localhost:4000/estados.json")
    render json: estados.body, status: 200
  end
  
  def index
    release_cross_domain 
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
    release_cross_domain
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
    release_cross_domain
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

  private 
  def release_cross_domain 
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'GET'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = 'Origin, X-Requested-With, Content-Type, Accept'
  end
end
