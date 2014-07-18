class Zeller
  def self.calculate(month, day=1, year)
    if month < 3
      month = month + 12
      year = year - 1
    end
    century_year = year % 100
    century = (year/100).ceil
    weekday =((day + (26 * (month + 1))/10).floor + century_year + (century_year/4).floor + century/4 + 5* century) % 7
    weekday

  end


end
