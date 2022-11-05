//
//  vericek.swift
//  ilkswift
//
//  Created by akdeniz bilgisayar on 5.11.2022.
//

import SwiftUI

struct Quote : Codable {
    var quote_id: Int
    var quote: String
    var author: String
    var series: String
}

struct vericek: View {
    @State private var quotes = [Quote]()
    var body: some View {
        NavigationView {
            List(quotes,id:\.quote_id) { quote in
                VStack(alignment:.leading) {
                    Text(quote.author)
                        .font(.headline)
                        .foregroundColor(Color("skyBlue"))
                    Text(quote.quote)
                        .font(.body)
                    HStack {
                        Text("Author = ")
                            .fontWeight(.bold)
                        Text(quote.author)
                    }
                }
            }
            .navigationTitle("Quotes")
            .task{
                await fetchData()
            }
        }
    }
    func fetchData() async{
        guard let url = URL(string:"https://breakingbadapi.com/api/quotes") else {
            print("url not exist")
            return
        }
        
        do {
            let (data, _)  = try await URLSession.shared.data(from:url)
            
            if let decodedResponse = try? JSONDecoder().decode([Quote].self,from:data){
                quotes = decodedResponse
            }
        }catch {
            print(error)
        }
    }
}

struct vericek_Previews: PreviewProvider {
    static var previews: some View {
        vericek()
    }
}
