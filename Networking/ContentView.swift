//
//  ContentView.swift
//  Networking
//
//  Created by Никита Александров on 08.05.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var user: UserResults.User?
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: (user?.picture.large) ?? "")) { image in
                image
                    .imageScale(.large)
                    .cornerRadius(10)
                    .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.green, lineWidth: 2)
                        )
            } placeholder: {
                ProgressView()
            }
            .padding()
            HStack {
                VStack(alignment: .leading) {
                    Text("Hi, my name is")
                        .foregroundColor(.gray)
                    Text("\(user?.name.first ?? "Имя") \(user?.name.last ?? "Фамилия")")
                        .font(.title2)
                        .bold()
                    Text("My e-mail:")
                        .foregroundColor(.gray)
                    Text("\(user?.email ?? "email")")
                    Text("My gender:")
                        .foregroundColor(.gray)
                    Text("\(user?.gender ?? "Не указан")")
                    Text("I live in")
                        .foregroundColor(.gray)
                    Text(user?.location.country ?? "none")
                    Text("My phone is")
                        .foregroundColor(.gray)
                    Text(user?.phone ?? "none")
                }
            }
            .onAppear {
//                NetworkServiceWithCompletions.shared.fetchData { result in
//                    switch result {
//                    case .success(let usersData):
//                        let user = usersData.results[0]
//                        self.user = user
//                    case .failure(let failure):
//                        print(failure.localizedDescription)
//                    }
//                }
                Task {
                    let result = try await NetworkServiceWithAsync.shared.fetchData()
                    self.user = result.results[0]
                }
            }
        .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
