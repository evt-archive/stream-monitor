require_relative '../bench_init'

context "Stream divergence exceeds tolerance" do
  control_data = Controls::Divergence::OpsGenieData.example

  sink = substitute_post.sink

  monitor = Monitor.new

  monitor.measure.data = Controls::Divergence::MeasurementData::Tolerance::Exceeded.example

  test "Alert is sent" do
    assert sink do
      posted? { |data| data == control_data }
    end
  end  
end
