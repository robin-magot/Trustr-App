class ApiScore
  def initialize(siren)
    @siren = siren
  end

  def call
    url = "https://api.pappers.fr/v2/entreprise?api_token=#{ENV["PAPPERS_URL"]}&siren=#{@siren}"
    company_serialized = URI.open(url).read
    company = JSON.parse(company_serialized)
    company_info = {
      name: company['nom_entreprise'],
      siren: company['siren'],
      activité: company['libelle_code_naf'],
      création: company['date_creation'],
      localisation: company['siege']['ville']
    }
  end
end

#faire un hash clé valeur / indicateur et le résultat