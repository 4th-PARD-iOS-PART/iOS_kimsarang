https://github.com/user-attachments/assets/b900a8f2-6c69-43c2-8411-18f085779b51

과제 6 서버 연결하기~ 서버에 연결을 해보았습니다. 어렵네요 이때 주의 해야하는 점의 띄어쓰기 인데요!
extension MemberAddViewController { func postData(mem : MemberData ,vc : ViewController)
{ guard let url = URL(string:"http://ec2-13-209-3-68.ap-northeast-2.compute.amazonaws.com:8080/user")
else { print("🚨''')

여기서 http부분에 띄어쓰기가 들어가서 오류 구문이 생겼습니다. 여러분들은 다들, 전공자이시니 저같은 실수는 하지 않지만! 혹시나 하는 부분에 올려 봅니다. 감사힙니다.
