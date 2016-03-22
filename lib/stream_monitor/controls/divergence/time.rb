module StreamMonitor
  module Controls
    module Divergence
      module Time
        def self.unit
          Metrics::Stream::Divergence::Controls::Time.unit
        end

        module Reference
          def self.example
            ::Controls::Time::Raw.example
          end

          def self.iso8601
            ::Controls::Time::ISO8601.example
          end
        end

        module Within
          def self.example
            Reference.example + Tolerance.example
          end

          def self.iso8601
            Clock::UTC.iso8601(example)
          end
        end

        module Exceeds
          def self.example
            Within.example + Time.unit
          end

          def self.iso8601
            Clock::UTC.iso8601(example)
          end
        end
      end
    end
  end
end
