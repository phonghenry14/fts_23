module Filterable
  extend ActiveSupport::Concern

  module ClassMethods
    def filter(filter_parmas)
      results = self.all
      filter_parmas.each do |key, value|
        results = results.public_send(key, value) if value.present?
      end
      results
    end
  end
end
