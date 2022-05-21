Coredataでone to manyリレーションシップを構築, 子EntityのCRUD


↓ fetchした親Entityにある子Entityをリスト表示して、CRUDした様子

子要素の追加・削除・更新すべてに対してUIがRefreshする

![画面収録 2022-05-21 23 07 17 2](https://user-images.githubusercontent.com/40202387/169655447-eb2425a4-6521-40c3-b82c-8d630204a051.gif)


 * 親要素で子要素をwrapped valueのArrayにして読み込むやり方ではない（子modelの更新が自動的にUIに反映されなくなる）↓link参照
 https://github.com/tsonobe1/OneToManyCoreData2
