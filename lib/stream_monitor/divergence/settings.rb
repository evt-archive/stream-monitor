module StreamMonitor
  module Divergence
    class Settings < StreamMonitor::Settings
      def self.build
        instance = super

        data = instance.get(:divergence)
    
        ::Settings.build(data)
      end
    end
  end
end
