require 'csv'
require 'time'

module RideShare
  class Trip
    attr_reader :id, :passenger, :driver, :start_time, :end_time, :cost, :rating

    def initialize(input)
      @id = input[:id]
      @driver = input[:driver]
      @passenger = input[:passenger]
      @start_time = input[:start_time]
      @end_time = input[:end_time]
      @cost = input[:cost]
      @rating = input[:rating]

      if @rating != nil && @rating > 5 || @rating != nil && @rating < 1
        raise ArgumentError.new("Invalid rating #{@rating}")
      end

      if @end_time != nil && @start_time - @end_time > 0
        raise ArgumentError.new("Invalid time entries")
      end
    end

    def duration #in seconds
      @end_time - @start_time
    end

    def inspect
      "#<#{self.class.name}:0x#{self.object_id.to_s(16)}>"
    end
  end
end
