
import AuthenticationServices
import CryptoKit
import Foundation
class AppleLoginHelper: NSObject {
    static let shared = AppleLoginHelper()
    fileprivate var currentNonce: String?
    private var completion : ((SocialSignInModel?) -> ())?
    private var model : SocialSignInModel?
    private var presentationController : UIViewController!
    func AppleSignIn(with view: UIViewController,completion : @escaping (SocialSignInModel?) -> ()){
        if #available(iOS 13.0, *) {
            self.presentationController = view
            self.completion = completion
            let appleIDProvider = ASAuthorizationAppleIDProvider()
            let request = appleIDProvider.createRequest()
            let nonce = randomNonceString()
            currentNonce = nonce
            request.requestedScopes = [.fullName, .email]
            request.requestedOperation = .operationImplicit
            request.nonce = sha256(nonce)
            let authorizationController = ASAuthorizationController(authorizationRequests: [request])
            authorizationController.delegate = self
            authorizationController.presentationContextProvider = self
            authorizationController.performRequests()
        }
    }

    @available(iOS 13, *)
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            return String(format: "%02x", $0)
        }.joined()
        return hashString
    }
    
    
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: Array<Character> =
            Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length
        
        while remainingLength > 0 {
            let randoms: [UInt8] = (0 ..< 16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                }
                return random
            }
            
            randoms.forEach { random in
                if remainingLength == 0 {
                    return
                }
                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }
        
        return result
    }
}


extension AppleLoginHelper: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding
{
    @available(iOS 13.0, *)
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("\(error.localizedDescription)")
        self.completion?(nil)
    }
    @available(iOS 13.0, *)
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return presentationController.view.window!
    }
    @available(iOS 13.0, *)
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            
                let model = SocialSignInModel()
                model.id = appleIDCredential.user
                model.firstName = appleIDCredential.fullName?.givenName ?? ""
                model.lastName = appleIDCredential.fullName?.familyName ?? ""
                model.email = appleIDCredential.email
                model.name = (model.firstName ?? "") + " " + (model.lastName ?? "")
            
            self.completion?(model)
            
        }
    }
}
