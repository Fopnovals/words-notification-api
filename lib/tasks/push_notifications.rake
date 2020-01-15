# frozen_string_literal: true

desc 'Send push notification'
task notify: :environment do
  PushNotificationsService.call
end
