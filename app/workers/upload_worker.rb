class UploadWorker
  include Sidekiq::Worker

  def perform(file)
  	byebug
    Product.import(file)
  end
end
