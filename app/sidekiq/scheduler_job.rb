class SchedulerJob
  include Sidekiq::Job

  def perform(post_id)
    # Do something
    puts "Job!"
    post = Post.find(post_id)

    # loop through subscribers
    Subscriber.all.each do |subscriber|
      puts "!!! #{subscriber.id}"
      # return if subscriber.expires_at.nil? || subscriber.expires_at < DateTime.now
      # return unless subscriber.active?
      # return if subscriber.webhook.nil?

      MessageJob.perform_async(subscriber.wallet, post.content)
    end

    post.update(sent_at: DateTime.now)
      # check if they are active
      # check if their unexpired
      # schedule MessageJob.perform_async(wallet: subscriber.wallet)
  end
end
