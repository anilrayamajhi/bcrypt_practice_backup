module UsersHelper
  def formated_time(time)
    time.strftime("%I:%M %p")
  end
end
