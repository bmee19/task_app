import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct LoginView: View {
    let onLoggedIn: () -> Void
    
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage: String?
    @State private var isLoading = false
    
    var body: some View {
        VStack(spacing: 16) {
            Text("ログイン")
                .font(.largeTitle)
                .bold()
            
            TextField("ID（メール）", text: $email)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .keyboardType(.emailAddress)
                .textFieldStyle(.roundedBorder)
            
            SecureField("パスワード", text: $password)
                .textFieldStyle(.roundedBorder)
            
            if let errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.caption)
            }
            
            Button {
                login()
            } label: {
                if isLoading {
                    ProgressView()
                } else {
                    Text("ログイン")
                        .frame(maxWidth: .infinity)
                }
            }
            .buttonStyle(.borderedProminent)
            .disabled(email.isEmpty || password.isEmpty || isLoading)
            
            Spacer()
        }
        .padding()
    }
    
    func login() {
        errorMessage = nil
        isLoading = true
        
        Auth.auth().signIn(withEmail: email, password: password) { _, error in
            isLoading = false
            
            if let error {
                errorMessage = error.localizedDescription
                return
            }
            
            if let user = Auth.auth().currentUser {
                let ref = Firestore.firestore().collection("users").document(user.uid)
                
                ref.getDocument { doc, _ in
                    if doc?.exists == true {
                        // name維持
                    } else {
                        // 初回だけ作る
                        ref.setData([
                            "name": "未設定",
                            "email": user.email ?? email,
                            "createdAt": Timestamp()
                        ])
                    }
                    
                    UserDefaults.standard.set(Date(), forKey: "lastLoginDate")
                    onLoggedIn()
                }
            }
        }
    }
}
