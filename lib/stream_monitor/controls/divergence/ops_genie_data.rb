module StreamMonitor
  module Controls
    module Divergence
      module OpsGenieData
        def self.example
          data = OpsGenieClient::Alert::Data.build
          data.message = Message.example
          data.description = Description.example
          data.source = Source.example
          data
        end

        module Description
          def self.example
            <<-TEXT
The following streams have diverged by 2ms, exceeding the tolerance of 1ms:

    `stream_1': Last written at Sat, Jan 1 2000 12:00:00.000AM +0000
    `stream_2': Last written at Sat, Jan 1 2000 12:00:00.002AM +0000

            TEXT
          end
        end

        module Message
          def self.example
            stream_1, stream_2 = StreamNames.example
            "Streams have diverged: '#{stream_1}' and '#{stream_2}'"
          end
        end
      end
    end
  end
end
