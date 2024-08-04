//
//  AccountView.swift
//  NewsApp
//
//  Created by Lev Vlasov on 31.07.2024.
//

import SwiftUI
import UIKit

struct AccountView: View {
    @FetchRequest(entity: Autorization.entity(), sortDescriptors: []) var autorization: FetchedResults<Autorization>
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var managedObjectContext
    @ObservedObject var autorizationVM = AutorizationViewModel()
   
    
    var body: some View {
        if autorizationVM.leaveAlert {
            AutorizationView()
                .navigationBarBackButtonHidden(true)
        } else  {
            account
        }
    }
    
    var account: some View {
        NavigationStack {
            Form {
                 
                if let selectedAvatar = autorizationVM.selectedAvatar {
                    Image(uiImage: selectedAvatar)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .clipShape(Circle())
                    
                }
                
                // Add Avatar User
                Button {
                    autorizationVM.isAvatarPickerPresented.toggle()
                } label: {
                    Text("Add Avatar")
                }
                .sheet(isPresented: $autorizationVM.isAvatarPickerPresented) {
                    ImagePicker(image: $autorizationVM.selectedAvatar)
                        .onDisappear {
                            if let selectedAvatar = autorizationVM.selectedAvatar {
                                autorizationVM.userAvatar = selectedAvatar.jpegData(compressionQuality: 0.8)
                            }
                        }
                }
                
                
                
                
                
                Section("User name") {
           
                    // Name User
                    TextField("", text: $autorizationVM.userName)
                    
                }
                
                // About
                Section("About") {
                    TextField("", text: $autorizationVM.userDescription)
                }
            }
            
            Button {
                autorizationVM.leaveAccount()
                
                if autorizationVM.errorAlert == false {
                    autorizationVM.leaveAlert = true
                    
                    let autorization = Autorization(context: managedObjectContext)
                    autorization.userDescription = nil
                    autorization.userName = nil
                    autorization.userAvatar = nil
                    autorizationVM.userAvatar = nil
                    autorizationVM.selectedAvatar = nil
                    
                    do {
                        try managedObjectContext.save()
                    } catch {
                        print("Failed managedObjectContext.save() \(error)")
                    }
                    
                }
            } label: {
                Text("leave account")
                    .foregroundStyle(.red)
            }
            .alert("You are logged out of account", isPresented: $autorizationVM.leaveAlert) {}
            .alert("Error Login", isPresented: $autorizationVM.errorAlert) {
                
            } message: {
                Text(autorizationVM.errorLeave)
            }
        }
        .toolbar {
            ToolbarItem {
                Button {
                    let autorization = Autorization(context: managedObjectContext)
                    autorization.userDescription = autorizationVM.userDescription
                    autorization.userName = autorizationVM.userName
                    autorization.userAvatar = autorizationVM.userAvatar
                    
                    do {
                        try managedObjectContext.save()
                    } catch {
                        print("Failed managedObjectContext.save() \(error)")
                    }
                    
                    
                    print(  autorization.userDescription ?? "No Description",
                            autorization.userName ?? "No Name",
                            autorization.userAvatar ?? "No Avatar"
                    )
                    
                    dismiss()
                    
                } label: {
                    Text("Save")
                }
            }
        }
        
    }
}


#Preview {
    AccountView()
}
