# frozen_string_literal: true

class PushNotifications
  def self.call(**args)
    new(args).call
  end

  def initialize(args)
    # @company = args.dig(:company)
    # @errors = {}
  end

  def call
    puts 'HELLO MY FRIEND!!!'
    self
  end
end
