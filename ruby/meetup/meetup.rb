require 'date'

class Meetup
  def initialize(month, year)
    @first_of_month = Date.new(year, month)
  end

  def day(weekday, week)
    send(week, weekday)
  end

  private

  attr_reader :first_of_month

  def first(weekday)
    first_of_month + (wday(weekday) - first_of_month.wday) % 7
  end

  def second(weekday)
    first(weekday) + 7
  end

  def teenth(weekday)
    first_weekday = first(weekday)
    first_weekday + (first_weekday.mday < 6 ? 14 : 7)
  end

  def third(weekday)
    first(weekday) + 14
  end

  def fourth(weekday)
    first(weekday) + 21
  end

  def last(weekday)
    last_of_month = first_of_month.next_month.prev_day
    last_of_month - (last_of_month.wday - wday(weekday)) % 7
  end

  def wday(weekday)
    Date::DAYNAMES.index(weekday.to_s.capitalize)
  end
end
