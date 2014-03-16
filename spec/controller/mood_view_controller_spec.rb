describe "The 'submit mood' view" do
  class Delegate
    attr_accessor :called
    def back
      @called = true
    end
  end

  before do
    controller.delegate = Delegate.new
    Mood.mock!(:submit, :yield => [])
  end

  after do
  end

  tests MoodViewController

  it "Closes window after creation" do
    tap('Submit it!')

    controller.delegate.called.should == true
  end
end