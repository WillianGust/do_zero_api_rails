class ApplicationController < ActionController::Base
  before_action :valida_token_api

  def valida_token_api
    if request.path_parameters[:format] == 'json'
      token = request.headers["Authentic-Token"]
      tokens = Token.where(valor: token).where("data_inicial <= ? and data_final >= ?", Time.zone.now.beginning_of_day, Time.zone.now.end_of_day)
      # token = Base64.decode64(token)
      if tokens.count == 0
         render json: { mensagem: "Token invalido ou vazio" }, status: 401
      else
        AcessosApi.create(token: token, url: request.original_url)
        tokens.destroy_all
      end
    end
  end
end
