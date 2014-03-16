class MoodCollectionViewController < UICollectionViewController
  attr_accessor :mood_list

  def init
    initWithCollectionViewLayout UICollectionViewFlowLayout.alloc.init
  end

  def viewDidLoad
    collectionView.registerClass(MoodCell, forCellWithReuseIdentifier:"Mood")
    Mood.list do |mood_list|
      @mood_list = mood_list
      collectionView.reloadData
    end
  end

  # UICollectionView Datasource
  def collectionView(view, numberOfItemsInSection: section)
    mood_list ? mood_list.count : 0
  end

  def numberOfSectionsInCollectionView view
    1
  end

  def collectionView view, cellForItemAtIndexPath: indexPath
    cell = view.dequeueReusableCellWithReuseIdentifier("Mood", forIndexPath:indexPath)
    cell.backgroundColor = UIColor.whiteColor
    cell.mood = mood_list[indexPath.row]
    cell
  end

  # UICollectionViewDelegateFlowLayout
  def collectionView view, layout: layout, sizeForItemAtIndexPath: indexPath
    [318, 75]
  end

  def collectionView view, layout: layout, insetForSectionAtIndex: section
    [1, 1, 1, 1]
  end
end