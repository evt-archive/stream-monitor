module StreamMonitor
  module Divergence
    module ConvertData
      class OpsGenie
        initializer :data

        def self.call(measurement_data)
          instance = build(measurement_data)
          instance.()
        end

        def self.build(measurement_data)
        end

        def call
        end
      end
    end
  end
end
