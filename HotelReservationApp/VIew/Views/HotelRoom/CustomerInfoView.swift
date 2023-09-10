import SwiftUI
import Combine


struct NumberPhoneMaskVIew: View {
    
    @State private var number = ""
    @State var email = ""
    
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
    
    var body: some View {
        
        Section(header:
                    Text("Информация о покупателе")
            .font(.system(size: 25, weight: .semibold))
            .padding(.bottom)
            .padding(.trailing, 45)
                ,
                footer:
                    Text("Эти данные никому не передаются.После оплаты мы пришлем вам чем на указанный вами номер и почту.")
            .foregroundColor(.secondary)
            .font(.footnote)
            .padding(.top, 5)
            .padding(.trailing)
        ){
            VStack(alignment: .leading) {
                if !number.isEmpty {
                    Text("Номер телефона")
                        .foregroundColor(.secondary)
                        .padding(.bottom, -10)
                        .transition(AnyTransition.opacity.animation(.easeIn(duration: 0.1)))
                }
                
                
                TextField("Номер телефона", text: $number)
                    .frame(height: 40)
                    .onReceive(Just(number)){_ in
                        number = formater(number)
                    }
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.secondary)
                
                
                if !email.isEmpty{
                    Text("Почта")
                        .foregroundColor(.secondary)
                        .padding(.bottom, -10)
                        .transition(AnyTransition.opacity.animation(.easeIn(duration: 0.1)))
                }
                
                TextField("Почта", text: $email)
                    .frame(height: 40)
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(email.isEmpty ? .secondary : (emailPredicate.evaluate(with: email) ? .secondary : Color("ErrorColor")))
                
                if !emailPredicate.evaluate(with: email) && !email.isEmpty {
                    Text("Почта введена некорректно")
                        .font(.footnote)
                        .foregroundColor(Color("ErrorColor"))
                        .transition(AnyTransition.opacity.animation(.easeIn(duration: 0.3)))
                }
            }
            .padding(.horizontal)
        }
    }
    
   private func formater(_ phoneNumber: String) -> String {
        let number = phoneNumber.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
        var result: String = ""
        var index = number.startIndex
        
       let mask = "+X (XXX) XXX-XX-XX"
       
        for character in mask where index < number.endIndex {
            if character == "X" {
                result.append(number[index])
                index = number.index(after: index)
            }else{
                result.append(character)
            }
        }
        return result
    }

}

struct NumberPhoneMaskView_Previews: PreviewProvider {
    static var previews: some View {
        RoomBookingView()
    }
}
