class RootViewController < UIViewController
  attr_accessor :button, :nav_controller

  def viewDidLoad
    super
    self.title = "Moodios"

    @mood_view_controller = MoodCollectionViewController.alloc.init
    @nav_controller = UINavigationController.alloc.initWithRootViewController @mood_view_controller
    @moodButton = UIBarButtonItem.alloc.initWithTitle("Record", style:UIBarButtonItemStylePlain, target:self, action: :record_mood)
    @mood_view_controller.navigationItem.rightBarButtonItem = @moodButton
  end

  def viewDidAppear animated
    super animated
    self.presentViewController(@nav_controller, animated:true, completion:nil)
  end

  def record_mood
    record_mood_controller = MoodViewController.alloc.init
    record_mood_controller.delegate = self;
    @nav_controller.pushViewController(record_mood_controller, animated: true)
  end

  def back
    @nav_controller.popViewControllerAnimated true
  end
end