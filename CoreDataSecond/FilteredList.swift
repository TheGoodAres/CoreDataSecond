//
//  FilteredList.swift
//  CoreDataSecond
//
//  Created by Robert-Dumitru Oprea on 15/04/2023.
//
// used to create a dynamic filter in CoreData
import SwiftUI
import CoreData

struct FilteredList<T: NSManagedObject, Content: View>: View {
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content

    enum Predicates: String {
        case beginsWith = "BEGINSWITH"
        case like = "LIKE"
        case equals = "=="
        case containsCaseSensitive = "contains"
        case containsCaseInsensitive = "contains[cd]"
    }
    
    var body: some View {
        List(fetchRequest, id: \.self) { item in
            self.content(item)
        }
    }
    ///%K in the following is used to insert a key(ex. lastName, firstName)
    ///%@ in the following is used to insert the required filter
    init(filterKey: String, filterValue: String, predicate: Predicates, sortDescriptor: [SortDescriptor<T>], @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: sortDescriptor, predicate: NSPredicate(format: "%K \(predicate.rawValue) %@", filterKey, filterValue))
        self.content = content
    }

}

