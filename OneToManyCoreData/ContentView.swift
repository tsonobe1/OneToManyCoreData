//
//  ContentView.swift
//  OneToManyCoreData
//
//  Created by 薗部拓人 on 2022/05/18.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \ParentModel.createdAt, ascending: true)],
        animation: .default)
    private var parents: FetchedResults<ParentModel>
    
    var body: some View {
        NavigationView {
            VStack{
            List {
                ForEach(parents) { parent in
                    NavigationLink {
                        ChildList(withChild: parent)
                    } label: {
                        HStack{
                            Text(parent.parent!)
                            Spacer()
                            VStack(alignment: .leading){
                                Text(parent.createdAt!, formatter: parentFormatter).font(.caption)
                                Text("children are \(parent.children!.count)").font(.caption)
                            }
                        }
                    }
                }.onDelete(perform: deleteParent)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addParent) {
                        Label("Add parent", systemImage: "plus")
                    }
                }
            }
            .navigationTitle("Parents \(parents.count)")
                ChildOnly()
        }
        }
    }
    
    private func addParent() {
        withAnimation {
            let newItem = ParentModel(context: viewContext)
            newItem.id = UUID()
            newItem.parent = "It is Parent"
            newItem.createdAt = Date()
            
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
    
    private func deleteParent(offsets: IndexSet) {
        print(offsets)
        
        withAnimation {
            offsets.map { parents[$0] }.forEach(viewContext.delete)
            
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

private let parentFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}

