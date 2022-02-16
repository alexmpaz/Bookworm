//
//  ContentView.swift
//  Bookworm
//
//  Created by Alex Paz on 09/02/2022.
//

import SwiftUI


struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title),
        SortDescriptor(\.author, order: .reverse)
    ]) var books: FetchedResults<Book>
    
    @State private var showingAddBook = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(books) { book in
                    NavigationLink {
                        DetailView(book: book)
                    } label: {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                Text(book.title ?? "Unknown title")
                                    .font(.headline)
                                // Challenge 2: highlight badly reviewed books
//                                    .foregroundColor(book.rating == 1 ? Color.red : Color.primary)
                                    .strikethrough(book.rating == 1 ? true : false)
                                
                                Text(book.author ?? "Unknown author")
                                    .foregroundColor(.secondary)
                            }
                        }
                    } // another option for challenge 2
                    .opacity(book.rating == 1 ? 0.6 : 1)
                }
                // enabling deletion, see deleteBooks function
                .onDelete(perform: deleteBooks)
            }
                .navigationTitle("Bookworm")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading, content: {
                        EditButton()
                    })
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            showingAddBook.toggle()
                        } label: {
                            Label("Add Book", systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddBook) {
                    AddBookView()
                }
        }
    }
    
    // enabling Deletion of books
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            // find book on Fetch request
            let book = books[offset]
            
            // delete from context
            moc.delete(book)
        }
        // save the context
//        try? moc.save()  // commented for testing purposes
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
