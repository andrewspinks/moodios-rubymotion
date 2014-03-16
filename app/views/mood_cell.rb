class MoodCell < UICollectionViewCell
  attr_accessor :mood

  def initWithFrame frame
    if super
      buildView
    end
    self
  end

  def mood= mood
    @mood = mood
    @date_label.text = mood.date
    @level_label.text = mood.level
    @mood
  end

  def buildView
    layout(contentView) do
      @date_label = subview(UILabel, :date)
      @level_label = subview(UILabel, :level)

      auto(contentView) do
        vertical "|-[date]-|"
        vertical "|-[level]-|"
        horizontal "|-[date]-[level]-|"
      end
    end
  end

end