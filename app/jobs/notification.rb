class NotificationJob < Struct.new(:text, :emails)

  # Gotta figure out how to use this
  # https://github.com/collectiveidea/delayed_job

  def perform
    #TODO
  end
end