class MessageJob
  include Sidekiq::Job

  def perform(wallet, content)
    # Do something
    subscriber = Subscriber.find_by_wallet(wallet)
    puts subscriber.webhook_url

    # send to discord
  end
end
