class Movie < ActiveRecord::Base
  def self.all_ratings
    return self.pluck(:rating).uniq.sort
  end

  def self.with_ratings(ratings)
    if ratings.blank?
      return self.all
    else
      return self.where('UPPER(rating) IN (?)', ratings.map(&:upcase))
    end
  end

end
