import SwiftUI

struct Contact: Identifiable {
    let id = UUID()
    let name: String
    let phone: String
}

struct ContentView: View {
    let contacts = [
        Contact(name: "Alice", phone: "555-1234"),
        Contact(name: "Bob", phone: "555-5678"),
        Contact(name: "Charlie", phone: "555-9012")
    ]

    var body: some View {
        NavigationStack {
            List(contacts) { contact in
                NavigationLink(destination: ContactDetail(contact: contact)) {
                    Text(contact.name)
                }
            }
            .navigationTitle("Contacts")
        }
    }
}

struct ContactDetail: View {
    let contact: Contact

    var body: some View {
        VStack(spacing: 20) {
            Text(contact.name)
                .font(.largeTitle)
                .bold()
            Text("Phone: \(contact.phone)")
                .font(.title2)
            Spacer()
        }
        .padding()
        .navigationTitle("Details")
    }
}

#Preview {
    ContentView()
}
