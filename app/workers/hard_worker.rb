class HardWorker
  include Sidekiq::Worker
  sidekiq_options retry: true, max_retries: 1

  def perform(csv_text)
    Customer.import_data(csv_text)
  end
end
