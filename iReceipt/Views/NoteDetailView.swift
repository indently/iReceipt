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
    var image: Image
    let id: UUID
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Spacer()
                    image
                        .resizable()
                        .frame(width: 300, height: 300, alignment: .center)
                    
                    Spacer()
                }
                TextField("Edit me!", text: $title)
                    .textSelection(.enabled)
                    .onTapGesture {
                        self.title = ""
                    }
    
                ZStack {
                    TextEditor(text: $desc)
                        .textSelection(.enabled)
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
        NoteDetailView(title: "Test", desc: "Test Desc",image: Image(systemName: "map"), id: UUID())
            .environmentObject(ImageData())
    }
}
