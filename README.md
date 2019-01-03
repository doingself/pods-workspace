# pods-workspace

使用 Cocoapod 整合第三方库

### Demo1

##### [TextureGroup/Texture](https://github.com/TextureGroup/Texture)

Texture 是建立在UIKit之上的iOS框架，可以保持最复杂的用户界面的流畅和响应。

+ https://juejin.im/post/5a16acf56fb9a04509092ce5
+ https://juejin.im/post/5a1be41351882561a20a32e9#heading-17

##### [Instagram/IGListKit](https://github.com/Instagram/IGListKit)

Instagram在2016年年底发布了基于数据驱动的UICollectionView框架IGListKit。使用数据驱动去创造更为快速灵活的列表控件。

##### [mindz-eye/MYTableViewIndex](https://github.com/mindz-eye/MYTableViewIndex)

自定义索引

```
extension TabIndexViewController: TableViewIndexDelegate{
    func tableViewIndex(_ tableViewIndex: TableViewIndex, didSelect item: UIView, at index: Int) -> Bool {
        
        let indexPath = IndexPath(item: 0, section: index)
        collectView.scrollToItem(at: indexPath, at: .top, animated: true)
        
        return true
    }
}
extension TabIndexViewController: TableViewIndexDataSource{
    func indexItems(for tableViewIndex: TableViewIndex) -> [UIView] {
        let result = ["1","2","3","4","5"]
        return result.map{ StringItem(text: $0) }
    }
}
```