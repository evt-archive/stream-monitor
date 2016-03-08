require_relative 'bench_init'

context "Settings" do
  settings = StreamMetricsTelemetry::Settings.build

  test "Includes the frequency_milliseconds" do
    assert(settings.get.to_h.has_key? :frequency_milliseconds)
  end

  test "Includes the tolerance_milliseconds" do
    assert(settings.get.to_h.has_key? :frequency_milliseconds)
  end
end
