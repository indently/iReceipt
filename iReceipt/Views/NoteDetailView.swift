//
//  NoteDetailView.swift
//  iReceipt
//
//  Created by Federico on 26/01/2022.
//

import SwiftUI

struct NoteDetailView: View {
    @State private var title = ""
    @State private var content = ""
    let id: UUID
    
    var body: some View {
        Form {
            Section {
                TextField("Give your note a title", text: $title)
                ZStack {
                    TextEditor(text: $content)
                        .frame(height: 200)
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Text("\(content.count)/120")
                                .foregroundColor(.gray)
                                .padding()
                        }
                    }
                }
                HStack {
                    Spacer()
                    Button("Add note!") {
                        // add note
                    }
                    Spacer()
                }
                Text("\(id)")
            }
        }
    }
}

struct NoteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NoteDetailView(id: UUID())
    }
}
