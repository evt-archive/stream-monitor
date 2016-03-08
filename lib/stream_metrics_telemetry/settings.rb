module StreamMetricsTelemetry
  class Settings < ::Settings
    def self.instance
      @instance ||= build
    end

    def self.data_source
      'settings/stream_metrics_telemetry.json'
    end

    def self.set(receiver)
      instance.set(receiver)
    end
  end
end
