//
//  ToDoListViewViewModel.swift
//  ToDoList
//
//  Created by Kagan Kuscu on 24.05.23.
//

import FirebaseFirestore
import Foundation

class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private var userId: String
    init(userId: String) {
        self.userId = userId
    }
    
    /// Delete tot do list item
    /// - Parameter id: item id to delete
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
