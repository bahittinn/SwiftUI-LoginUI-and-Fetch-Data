//
//  vericek2.swift
//  ilkswift
//
//  Created by akdeniz bilgisayar on 5.11.2022.
//

import SwiftUI
struct Course:Hashable,Codable {
    let name: String
    let image: String
    
}
class ViewModel: ObservableObject {
    @Published var courses : [Course] = []
    func fetch() {
        guard let url = URL(string: "https://iosacademy.io/api/v1/courses/index.php") else {
            return;
        }
        
        let task = URLSession.shared.dataTask(with: url) {
            [weak self] data, _, error in
            guard let data = data ,error == nil else {
                return
            }
            // Convert to Json
            do {
                let courses = try JSONDecoder().decode([Course].self,from:data)
                DispatchQueue.main.async {
                    self?.courses = courses
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
}

struct vericek2: View {
    @StateObject var viewModel = ViewModel()
    var body: some View {
        NavigationView{
            List {
                ForEach(viewModel.courses, id:\.self) { course in
                    HStack {
                        Text(course.name)
                            .bold()
                    }
                }
            }
            .navigationTitle("Data")
            .onAppear {
                viewModel.fetch()
            }
        }
    }
}

struct vericek2_Previews: PreviewProvider {
    static var previews: some View {
        vericek2()
    }
}
