//
//  ChildOnly.swift
//  OneToManyCoreData
//
//  Created by 薗部拓人 on 2022/05/20.
//

import SwiftUI

struct ChildOnly: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \ChildModel.createdAt, ascending: true)],
        animation: .default)
    private var children: FetchedResults<ChildModel>
    var body: some View {
        VStack{
            Text("\(children.count)")
            List{
                ForEach(children){ child in
                    Text("\(child.child!)")
                }
            }
        }
    }
}

struct ChildOnly_Previews: PreviewProvider {
    static var previews: some View {
        ChildOnly()
    }
}
