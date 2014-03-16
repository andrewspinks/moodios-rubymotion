Teacup::Stylesheet.new :mood do
  padding = 15
  property_height = 30

  style :main,
    backgroundColor: UIColor.whiteColor

  style :title,
    text: 'Register Your Mood',
    constraints: [
      constrain_height(property_height),
      constrain_left(padding),
      constrain(:width).equals(:superview, :width).minus(padding * 2),
      constrain_top(padding+100)
    ]

  style :level,
    minimumValue: 0,
    maximumValue: 10,
    constraints: [
      constrain_height(property_height),
      constrain_left(padding),
      constrain(:width).equals(:superview, :width).minus(padding * 2),
      constrain(:top).equals(:title, :bottom).plus(padding)
    ]

  style :submit,
    backgroundColor: UIColor.blueColor,
    constraints: [
      constrain_height(property_height),
      constrain_left(padding),
      constrain(:width).equals(:superview, :width).minus(padding * 2),
      constrain(:top).equals(:level, :bottom).plus(padding)
    ]

  style :activity,
    constraints: [
      constrain_height(property_height),
      constrain_left(padding),
      constrain(:width).equals(:superview, :width).minus(padding * 2),
      constrain(:top).equals(:submit, :bottom).plus(padding)
    ]

end