import SwiftUI
struct Contact: Identifiable {
    let id = UUID()
    let name: String
    let phone: String
    let color: Color
    let image: Image
    let status: String
    let massege: String
    let email: String
}

struct ContactDetailView: View {
    let contact: Contact
    var body: some View {
        VStack (spacing: 10 ) {
            VStack (spacing: 20){
                contact.image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.brown, lineWidth: 2))
                Text(contact.name)
                    .font(.largeTitle)
                    .bold()
                List {
                    Section (header: Text("Contact Information")) {
                        HStack {
                            Label("Phone Number", systemImage: "phone")
                            Spacer()
                            Text(contact.phone)
                                .font(.callout)
                                .foregroundColor(.blue)
                        }
                        HStack {
                            Label("Email", systemImage: "envelope")
                            Spacer()
                            Text(contact.email)
                                .font(.footnote)
                                .foregroundColor(.red)
                        }
                        HStack {
                            Label("Status", systemImage: "person")
                            Spacer()
                            Text(contact.status)
                        }
                        HStack {
                            Label("Massege", systemImage: "ellipsis.bubble")
                            Spacer()
                            Text(contact.massege)
                        }
                    }
                }
                    
            }
        }
        .navigationTitle(contact.name)
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

struct ContentView: View {
    
    @State private var contacts = [
        Contact(name: "Naruto Uzamaki", phone: "01234567899", color: .blue, image: Image ("naruto uzamaki"), status: "7th Hokage", massege: "You're The Best", email: "narutouzamaki123@gmail.com"),
        Contact(name: "Sasuke Uchiha", phone: "01324567890", color: .orange, image: Image ("sasuke uchiha"), status: "Shadow Hokage", massege: "The last Uchiha", email: "sasukeuchiha123@gmail.com"),
        Contact(name: "Kakashi Hatake", phone: "01839203874", color: .accentColor, image: Image ("kakashi"), status: "6th Hokage", massege: "The copy Ninja",email: "kakashi123@gmail.com"),
        Contact(name: "Kurama", phone: "01892028733", color: .brown, image: Image ("kurama"), status: "Tails Beast", massege: "Best Friend", email: "kurama123@gmail.com")
    ]
    var body: some View {
        
        NavigationStack {
            List {
                ForEach(contacts) { person in
                    NavigationLink(destination: ContactDetailView(contact: person)) {
                        HStack (spacing: 15) {
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color.gray)
                            VStack(alignment: .leading, spacing: 10 ) {
                                Text(person.name)
                                    .font(.headline)
                                Text(person.phone)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            Text(person.status)
                                .font(.caption)
                                .foregroundColor(.brown)
                                .padding(.bottom, 40)
                            
                        }
                        .padding(.vertical, 4)
                    }
                    
                }
                .onDelete { indexSet in
                    contacts.remove(atOffsets: indexSet)
                }
                .onMove { indices, newOffset in
                    contacts.move(fromOffsets: indices, toOffset: newOffset)
                }
            }
            .navigationTitle("Contacts")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
