describe "Mood" do
  extend WebStub::SpecHelpers

  before do
    disable_network_access!
  end
  after do
    enable_network_access!
  end

  describe 'retrieving mood list' do
    before do
      reset_stubs
    end

    it "retrieves moods" do
      stub = stub_request(:get, "http://localhost:3000/moods").
        to_return(json: [ { "created_at" => "2013-07-11T12:09:03+10:00", "level" => "1" },
          { "created_at" => "2013-07-11T12:09:12+10:00", "level" => "5" } ])

      Mood.list do |results|
        results.size.should == 2
        resume
      end

      wait_max 1.0 do
        stub.should.be.requested
      end
    end
  end

end
