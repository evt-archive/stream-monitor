module StreamMetricsTelemetry
  module Divergence
    class Monitor
      def self.call(*stream_names)
      end

      def call()
        # call detect, with opsgenie post in block action
        # StreamDivergence::Detect.() do |data|
        #   alert = Convert.(data)
        #   OpsGenie::Client::HTTP::Post.(alert)
        # end
      end
    end
  end
end
