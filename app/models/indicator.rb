class Indicator < ApplicationRecord
  has_one :score

  def trusted?
    return false if content == "null"

    return false if content == "true" if title == "ouvert"

    if title == "origine"
      list_country_eu = ["AT", "BE", "BG", "HR", "CY", "CZ", "DK", "EE", "FI", "FR", "DE", "GR", "HU", "IE", "IT", "LV", "LT", "LU", "MT", "NL", "PL", "PT", "RO", "SK", "SI", "ES", "SE", "GB"]
      return list_country_eu.include?(content) 
    end

    return true 
  end
end
