class ApiScore
  def initialize(siren)
    @siren = siren
  end

  def company_valid?(url)
    valid_url = URI.parse(url)
    req = Net::HTTP.new(valid_url.host, valid_url.port)
    req.use_ssl = true
    res = req.request_head(valid_url.path)
    res.code == "200"
  end

  def call
    url = "https://api.pappers.fr/v2/entreprise?api_token=#{ENV["PAPPERS_URL"]}&siren=#{@siren}"
    if company_valid?(url)
      company_serialized = URI.open(url).read
      company = JSON.parse(company_serialized)
      company_info = {
        nom: company['denomination'],
        siren: company['siren'],
        activité: company['libelle_code_naf'],
        création: company['date_creation'],
        pays: company['siege']['code_pays'],
        ville: company['siege']['ville'],
        ouvert: "cet établissement est ouvert"
      }
    else 
      {
        nom: "Aucune entreprise trouvée",
        siren: "Aucune entreprise trouvée",
        activité: "Aucune entreprise trouvée",
        création: "Aucune entreprise trouvée",
        pays: "Aucune entreprise trouvée",
        ville: "Aucune entreprise trouvée",
        ouvert: "Aucune entreprise trouvée"
      }
    end
  end
end

#company['siege']['etablissement_cesse']

#faire un hash clé valeur / indicateur et le résultat