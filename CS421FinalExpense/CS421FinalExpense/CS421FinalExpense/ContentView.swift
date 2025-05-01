//
//  ContentView.swift
//  CS421FinalExpense
//
//  Created by Student on 4/10/25.
//
//Personal reference
//Categories = data entity
//category = fetchedresults


import SwiftUI

struct ContentView: View {
    
    @FetchRequest(fetchRequest: Categories.all) private var categoriesResults: FetchedResults<Categories>
    @State private var isPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            List(categoriesResults) { category in
                NavigationLink (value: category){
                    HStack{
                        Text(category.name ?? "")
                        Spacer()
                        Text(category.amount as NSNumber,formatter:NumberFormatter.currency)
                    }//Hstack
                }//navlink
            }.navigationDestination(for: Categories.self, destination: {category in detailsPage(category: category)
            })//results
            .toolbar {//nav stack
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Add New Category"){
                        isPresented = true
                    } //button
                } //toolbar item
            }.sheet(isPresented: $isPresented){
                AddCategoryView()
            }//sheet
        }//var body
    }//struct
    
    struct detailsPage_Previews: PreviewProvider {
        static var previews: some View{
            NavigationStack{
                ContentView().environment(\.managedObjectContext, CoreDataManager.shared.persistentContainer.viewContext)
            }
        }
    }
}
