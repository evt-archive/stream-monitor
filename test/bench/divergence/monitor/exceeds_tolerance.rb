require_relative '../../bench_init'

context "Stream divergence exceeds tolerance" do
  source = StreamMonitor::Controls::Source.example
  tolerance = StreamMonitor::Controls::Divergence::Tolerance.example

  monitor = StreamMonitor::Divergence::Monitor.new source
  monitor.tolerance_milliseconds = Rational(tolerance, 1000)
  monitor.measure.data = StreamMonitor::Controls::Divergence::MeasurementData::Tolerance::Exceeded.example

  monitor.()

  test "Alert is sent" do
    control_data = StreamMonitor::Controls::Divergence::OpsGenieData.example
    substitute_post = monitor.ops_genie_post
    sink = substitute_post.sink

    __logger.focus JSON.pretty_generate(Serialize::Write.raw_data(control_data))

    assert sink do
      posted? do |data|
        __logger.focus JSON.pretty_generate(Serialize::Write.raw_data(data))
        data == control_data
      end
    end
  end
end
