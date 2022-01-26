//
//  NoteDetailView.swift
//  iReceipt
//
//  Created by Federico on 26/01/2022.
//

import SwiftUI

struct NoteDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var imageData : ImageData
    @State var title: String
    @State var desc: String
    let id: UUID
    
    var body: some View {
        Form {
            Section {
                TextField("Give your note a title", text: $title)
                ZStack {
                    TextEditor(text: $desc)
                        .frame(height: 200)
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Text("\(desc.count)/120")
                                .foregroundColor(.gray)
                                .padding()
                        }
                    }
                }
                HStack {
                    Spacer()
                    Button("Confirm changes") {
                        imageData.editNote(id: id, title: title, description: desc)
                        presentationMode.wrappedValue.dismiss()
                    }
                    Spacer()
                }
                
                //Text("\(id)")
            }
        }
    }
}

struct NoteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NoteDetailView(title: "Test", desc: "Test Desc",id: UUID())
            .environmentObject(ImageData())
    }
}
