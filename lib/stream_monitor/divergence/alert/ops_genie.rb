module StreamMonitor
  module Divergence
    class Alert
      module OpsGenie
        class Data
          attr_reader :measurement_data
          attr_reader :source
          attr_reader :tolerance

          dependency :clock, Clock::Localized

          def initialize(measurement_data, tolerance, source)
            @measurement_data = measurement_data
            @source = source
            @tolerance = tolerance
          end

          def self.call(*arguments)
            instance = build(*arguments)
            instance.()
          end

          def self.build(measurement_data, tolerance, source)
            instance = new measurement_data, tolerance, source
            Clock::Localized.configure instance
            instance
          end

          def call
            ops_genie_data = OpsGenieClient::Alert::Data.new
            ops_genie_data.message = message
            ops_genie_data.description = description
            ops_genie_data.source = source
            ops_genie_data
          end

          def description
            streams = measurement_data.streams.map do |point|
              time = clock.canonize point.time
              formatted_time = time.strftime "%a, %b %-e %Y %l:%M:%S.%L%p %z"

              "    `#{point.stream_name}': Last written at #{formatted_time}"
            end

            <<-TEXT
The following streams have diverged by #{measurement_data.elapsed_milliseconds}ms, exceeding the tolerance of #{tolerance_milliseconds}ms:

#{streams * "\n"}

            TEXT
          end

          def message
            stream_names = measurement_data.streams.map do |point|
              stream_name = point.stream_name
              "'#{stream_name}'"
            end

            "Streams have diverged: #{stream_names * ' and '}"
          end

          def tolerance_milliseconds
            Integer(tolerance * 1000)
          end
        end
      end
    end
  end
end
