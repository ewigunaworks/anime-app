class HistoryLogsWorker
  include Sidekiq::Worker
  sidekiq_options retry:false

  def perform(params)
      puts "==================================HISTORY LOG START================================"
      history_logs = HistoryLog.new
      history_logs.url = params["url"]
      history_logs.method = params["method"]
      history_logs.response_status = params["status"]
      history_logs.access_at = Time.now
      history_logs.save!

      puts "==================================HISTORY LOG SUCCESS================================"
      puts "==================================HISTORY LOG END================================"
  end
end
