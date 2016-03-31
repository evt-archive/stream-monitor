require_relative '../../bench_init'

context "Generating Ops Genie alert data" do
  measurement_data = StreamMonitor::Controls::Divergence::MeasurementData::Tolerance::Exceeded.example
  source = StreamMonitor::Controls::Source.example
  tolerance = StreamMonitor::Controls::Divergence::Tolerance.example

  context do
    convert_data = StreamMonitor::Divergence::Alert::OpsGenie::Data.new measurement_data, tolerance, source

    ops_genie_data = convert_data.()

    test "Message is set" do
      control_message = StreamMonitor::Controls::Divergence::OpsGenieData::Message.example
      assert ops_genie_data.message == control_message
    end

    test "Description is set" do
      control_description = StreamMonitor::Controls::Divergence::OpsGenieData::Description.example
      assert ops_genie_data.description == control_description
    end

    test "Source is set" do
      assert ops_genie_data.source = source
    end
  end

  context "Configuration" do
    test "Localized clock is used" do
      convert_data = StreamMonitor::Divergence::Alert::OpsGenie::Data.build measurement_data, tolerance, source

      assert convert_data.clock.is_a?(Clock::Localized)
    end
  end
end
