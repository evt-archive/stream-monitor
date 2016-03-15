module StreamMetricsTelemetry
  module Divergence
    class Settings < StreamMetricsTelemetry::Settings
      def self.build
        instance = super

        data = instance.get(:divergence)
    
        ::Settings.build(data)
      end
    end
  end
end
