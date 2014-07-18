require_relative '../lib/zeller'

class Month
  MONTHS = [nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

  def initialize(month, year)
    @month = month
    @year = year
  end

  def header
    "#{name} #{@year}".center(20).rstrip
  end

  def name
    MONTHS[@month]
  end

  def to_s
    output = header
    output << "\nSu Mo Tu We Th Fr Sa"

    whole_month = month_array
    #month_array could go here
    row1 = add_proper_spacing(whole_month.slice(0, 7))
    output << row1
    row2 = add_proper_spacing(whole_month.slice(7, 7))
    output << row2
    row3 = add_proper_spacing(whole_month.slice(14, 7))
    output << row3
    row4 = add_proper_spacing(whole_month.slice(21, 7))
    output << row4
    row5 = add_proper_spacing(whole_month.slice(28, 7))
    output << row5
    row6 = add_proper_spacing(whole_month.slice(35, 7))
    output << row6

    output
  end

  def find_first_day
    day = 1
    start = Zeller.calculate(@month, day, @year)
    if start == 0
      start = 6
    else
      start - 1
    end
  end

  def month_length
    if @month == 4 || @month == 6 || @month == 9 || @month == 11
      30
    elsif @month == 1 || @month == 3 || @month == 5 || @month == 7 || @month == 8 || @month == 12
      31
    else
      if (@year % 4 == 0 && @year % 100 != 0|| @year % 400 == 0)
        29
      else
        28
      end
    end
  end

  def month_array
    start = find_first_day
    finish = month_length
    full_calendar_array = Array.new
    start.times do
      full_calendar_array << 0
    end
    full_calendar_array[start] = 1
    n = 2
    (finish - 1).times do
      full_calendar_array << n
      n += 1
    end
    remaining_space = 42 - full_calendar_array.size
    remaining_space.times do
      full_calendar_array << 0
    end
    full_calendar_array
  end

  def add_proper_spacing(week_array)
    week = ""
    week_array.each {|day|
      if day <10 && day > 0
        week << " #{day} "
      elsif day == 0
        week << "   "
      else
        week << "#{day} "
      end
    }
    week = week.chop
    # week = week.strip
    week = "\n#{week}"


    week

  end




end
