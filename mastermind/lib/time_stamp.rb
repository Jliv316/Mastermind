class TimeStamp
  require 'pry'

  attr_reader :start, :stop, :seconds, :minutes

  def initialize
    @start = nil
    @stop = nil
    @seconds = 0.0
    @minutes = 0.0
  end

  def start
    @start = Time.new
  end

  def stop
    @stop = Time.now
  end

  def elapsed_time
    total = 0
    total = ((stop - start)/60)*(-1)
    total = total.to_i
    # @minutes = total.truncate
    # difference = total - @minutes
    # @seconds = difference*60
    return [0, total]
    # return [minutes.abs.to_i, seconds.abs.to_i]
  end

end
