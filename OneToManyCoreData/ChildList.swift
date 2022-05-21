//
//  ChildList.swift
//  OneToManyCoreData
//
//  Created by 薗部拓人 on 2022/05/19.
//

import SwiftUI

struct ChildList: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var parent : ParentModel
    @FetchRequest var children: FetchedResults<ChildModel>
    
    init(withChild parent: ParentModel) {
        self.parent = parent
        _children = FetchRequest(
            entity: ChildModel.entity(),
            sortDescriptors: [
                NSSortDescriptor(keyPath: \ChildModel.createdAt, ascending: true)
            ],
            predicate: NSPredicate(format: "parent == %@", parent)
        )
    }

    
    var body: some View {
            VStack{
                Text(parent.parent != nil ? parent.parent! : "nil").font(.title).bold()
                List{
                    ForEach(children){ child in
                        HStack{
                            Text(child.child!).font(.caption)
                            Spacer()
                            Button(action: {
                                editChild(child: child)
                            }) {
                                Text("Edit")
                                    .foregroundColor(.blue)
                            }

                        }
                    }
                    .onDelete(perform: deleteChild)
                    .listStyle(.sidebar)
                }.toolbar {
                    ToolbarItem {
                        Button(action: addChild) {
                            Label("Add child", systemImage: "plus")
                        }
                    }
                }
            }
    }
    private func editChild(child: ChildModel){
        withAnimation{
        child.child = "\(Date())"
        try? viewContext.save()
    }
    }
    
    private func addChild() {
        withAnimation {
            let newItem = ChildModel(context: viewContext)
            newItem.id = UUID()
            newItem.child = "\(Date())"
            newItem.createdAt = Date()
            
            parent.addToChildren(newItem)
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    private func deleteChild(offsets: IndexSet) {
        withAnimation {
            offsets.map { children[$0] }.forEach(viewContext.delete)
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
//
//struct ChildList_Previews: PreviewProvider {
//    static var previews: some View {
//        ChildList(parent: <#T##ParentModel#>, tasks: <#T##FetchedResults<ChildModel>#>)
//    }
//}
