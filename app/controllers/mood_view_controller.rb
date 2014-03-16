class MoodViewController < UIViewController
  stylesheet :mood
  attr_accessor :delegate

  layout do
    self.title = "Register your mood"
    self.view.stylename = :main

    subview(UILabel, :title)
    @level = subview(UISlider, :level)
    submit_button = subview(UIButton, :submit)
    submit_button.setTitle('Submit it!', forState: UIControlStateNormal)
    submit_button.when(UIControlEventTouchUpInside) do
      Mood.submit(@level.value) do
        delegate.back
      end
    end
  end
end