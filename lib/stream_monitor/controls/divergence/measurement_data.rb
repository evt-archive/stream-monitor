module StreamMonitor
  module Controls
    module Divergence
      module MeasurementData
        module Tolerance
          module Exceeded
            def self.example
              reference = Time::Reference.iso8601
              exceeds = Time::Exceeds.iso8601

              Metrics::Stream::Divergence::Controls::Data.example(earlier: reference, later: exceeds)
            end
          end
        end
      end
    end
  end
end
