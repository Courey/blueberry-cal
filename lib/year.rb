require_relative '../lib/zeller'
require_relative '../lib/month'

class Year
  MONTHS = [nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

  def initialize(year)
    @year = year
  end

  def header
    "#{@year}".center(62).rstrip
  end

  def week_days
    week_days = "Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa  Su Mo Tu We Th Fr Sa\n"
  end

  def month_header(row)
    case row
      when 0 then "\n      January               February               March\n"
      when 1 then "\n       April                  May                   June\n"
      when 2 then "\n        July                 August              September\n"
      else "      October               November              December\n"
    end
  end

  def name
    MONTHS[@month]
  end

  def to_s


    output
  end

  def individual_month
    month_counter = 1
    year_days = []
    12.times do
      month = Month.new(month_counter, @year)
      whole_month = month.month_array
      year_days << whole_month
      month_counter += 1
    end
    year_days
  end

  def formatting(year_array)
    index = 0
    12.times do
      year_array[index].map! do |day|
        day == 0 ? day = "\s\s" : day < 10 && day > 0 ? day = " #{day}" : day
      end
      index += 1
    end
    year_array
  end

  def to_s
    formatted_year = formatting(individual_month)
    n=0

    week_length = 7
    full_year = header << "\n"
    4.times do |row|
      start_week = 0
      full_year << month_header(row) << week_days
      6.times do
        full_year << formatted_year[n].slice(start_week, week_length).join(" ")
        full_year << "  "
        full_year << formatted_year[n+1].slice(start_week, week_length).join(" ")
        full_year << "  "
        full_year << formatted_year[n+2].slice(start_week, week_length).join(" ")
        if full_year.rstrip! == nil
          # puts "YOU FOUND IT!!!!!!! NOW GO FIND WALDO!"
          full_year.rstrip!
          full_year << "\n"
        end
        full_year.rstrip!
        full_year << "\n"
        start_week += 7
      end
      n += 3
    end
    full_year
  end

end
