require_relative './bench_init'

test "Streams are out of tolerance" do
  stream_name_1 = StreamMetricsTelemetry::Controls::Writer.write 1, 'stream_1'
  stream_name_2 = StreamMetricsTelemetry::Controls::Writer.write 1, 'stream_2'

  detect = Divergence::Detect.(stream_name_1, stream_name_2) do |data, alert|

    test "The difference between timestamps of the last events of each stream" do
      assert(divergence.elapsed_milliseconds > 0)
    end

    context "Index by time" do
      test "First stream is the earliest" do
        assert(divergence.index(stream_name_1) == 0)
      end

      test "Last stream is the latest" do
        assert(divergence.index(stream_name_3) == 2)
      end
    end
  end
end
