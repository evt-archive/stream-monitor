module StreamMonitor
  module Divergence
    class Monitor
      setting :frequency_milliseconds
      setting :tolerance_milliseconds

      def self.call(*stream_names)
      end

      def call()
      end
    end
  end
end
