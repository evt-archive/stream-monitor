require_relative '../bench_init'

context "Configured Monitor" do
  source = StreamMonitor::Controls::Source.example

  settings = StreamMonitor::Divergence::Settings.build
  data = settings.get

  monitor = StreamMonitor::Divergence::Monitor.new source

  settings.set monitor

  test "The frequency_milliseconds is configured" do
    assert(!monitor.frequency_milliseconds.nil?)
    assert(monitor.frequency_milliseconds == data.frequency_milliseconds)
  end

  test "The tolerance_milliseconds is configured" do
    assert(!monitor.tolerance_milliseconds.nil?)
    assert(monitor.tolerance_milliseconds == data.tolerance_milliseconds)
  end
end
