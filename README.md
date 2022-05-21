Coredataでone to manyリレーションシップを構築, 子EntityのCRUD

- fetchした親EntityをForEachで回して親要素に紐付いた子Entityを読み込む。その子要素の値を更新すると、UIがRefreshしない（親要素から子要素を持ってくると、子要素がNSSetというClassになっているため）
- そのため、改めて子Entityをfetchする必要がある。その時、NSPredicateに親要素(親ViewからObservedObjectしてくる等)を指定することで、親要素に紐付いた子要素だけ取得することができる。
- これで子要素を更新したときに、UIがRefreshするようになる

参考↓

https://developer.apple.com/forums/thread/663901

https://stackoverflow.com/questions/65704981/iterate-over-a-nsset-swiftui-2-0



↓ fetchした親Entityにある子Entityをリスト表示して、CRUDした様子

子要素の追加・削除・更新すべてに対してUIがRefreshする

![画面収録 2022-05-21 23 07 17 2](https://user-images.githubusercontent.com/40202387/169655447-eb2425a4-6521-40c3-b82c-8d630204a051.gif)


 * 親要素で子要素をwrapped valueのArrayにして読み込むやり方ではない（子modelの更新が自動的にUIに反映されなくなる）↓link参照
 https://github.com/tsonobe1/OneToManyCoreData2
