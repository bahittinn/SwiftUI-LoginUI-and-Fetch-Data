//
//  sayfa1.swift
//  ilkswift
//
//  Created by akdeniz bilgisayar on 4.11.2022.
//

import SwiftUI

struct sayfa1: View {
    @State private var showDetails = false
    @State private var textField = "";
    @State var clr = Color("red");
    var body: some View {
        Form {
            Section {
                Text("KullanıcıAdı")
                .fontWeight(.bold)
                .foregroundColor(Color.brown)
                .padding()
                 
            }
            Section {
                TextField("Şifre",text:$textField)
                    
                    .foregroundColor(Color.green)
                    .padding()
            }
             
            VStack(alignment:.center){
                Button {
                    showDetails.toggle()
                    if showDetails {
                        self.textField = "TIKLANDI"
                    }else{
                        self.textField = "IPTAL"
                    }
                }label: {
                    Text("LOGIN")
                }
                .padding(.top,20)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.roundedRectangle)
                .frame(width:300)
                Text(textField)
                    .fontWeight(.bold)
            }
          
        }
    }
}

struct sayfa1_Previews: PreviewProvider {
    static var previews: some View {
        sayfa1()
        Text("deneme")
    }
}
