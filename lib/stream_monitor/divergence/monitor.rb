module StreamMonitor
  module Divergence
    class Monitor
      attr_reader :source

      setting :frequency_milliseconds
      setting :tolerance_milliseconds

      dependency :measure, Metrics::Stream::Divergence::Measure
      dependency :ops_genie_post, OpsGenieClient::Alert::HTTP::Post

      def initialize(source)
        @source = source
      end

      def self.build(source, *stream_names)
        instance = new source
        Metrics::Stream::Divergence::Measure.configure instance, *stream_names
        OpsGenieClient::Alert::HTTP::Post.configure instance
        Settings.set instance
        instance
      end

      def self.call(*arguments)
        instance = build *arguments
        instance.()
      end

      def call
        measurement_data = measure.()
        tolerance = tolerance_milliseconds * 1000

        ops_genie_data = Alert::OpsGenie::Data.(
          measurement_data,
          tolerance,
          source
        )

        ops_genie_post.(ops_genie_data)
      end
    end
  end
end
