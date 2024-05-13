//
//  ContentView.swift
//
//  Created by Berke Ayar on 11/05/2024
//
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView{
            
            VStack(spacing: 15){
                
                ZStack{
                    
                    Text("Ayar Giyim").font(.title).foregroundColor(.purple)
                    
                    HStack(spacing: 18){
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("Menu").renderingMode(.original)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("search").renderingMode(.original)
                        }
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("noti").renderingMode(.original)
                        }
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("shop").renderingMode(.original)
                        }
                        
                    }
                }.background(Color.white)
                    .padding([.leading,.trailing,.top], 15)
                
                MainView()
            }.navigationBarBackButtonHidden(true)
                .navigationBarTitle("")
                .navigationBarHidden(true)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MainView : View {
    
    @State var selected = "Dress"
    
    var body : some View{
        
        VStack(spacing: 15){
            
            HStack{
                
                HStack{
                    
                    Button(action: {
                        
                    }) {
                        
                        HStack{
                            
                            Text("Yeni Sezon Ürünleri")
                            
                            Spacer()
                            
                            Image("down")
                            
                        }.padding()
                        
                    }.foregroundColor(.black)
                        .background(Color.white)
                    
                    
                    Button(action: {
                        
                        
                    }) {
                        
                        Image("filter").renderingMode(.original).padding()
                        
                    }.background(Color.white)
                }
            }
            

                
                HStack{
                    
                    ForEach(types,id: \.self){ i in
                        
                        HStack{
                            
                            Button(action: {
                                
                                self.selected = i
                                
                            }) {
                                
                                Text(i).padding().font(.headline)
                            }
                            .foregroundColor(self.selected == i ? .white : .black)
                            .background(self.selected == i ? Color.black : Color.clear)
                            .cornerRadius(10)
                            
                            Spacer(minLength: 0)
                            
                        }
                    }
                }
            
            
            
            DetailsScroll()
            
        }.padding()
            .background(Color("Color"))
            .animation(.spring())
        
    }
}

struct DetailsScroll : View {
    
    @State var show = false
    
    var body : some View{
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 12){
                
                ForEach(datas){i in
                    
                    HStack{
                        
                        ForEach(i.rows){j in
                            
                            Cards(row: j)
                        }
                    }
                }
            }
        }
    }
}

struct Cards : View {
    
    var row : row
    @State var show  = false
    
    
    var body : some View{
        
        VStack(spacing: 8){
            
            NavigationLink(destination: DetailView(show: $show), isActive: $show) {
                
                Image(row.image).renderingMode(.original).resizable().frame(width: UIScreen.main.bounds.width / 2 - 25, height: 240)
            }
            
            
            
            HStack{
                
                VStack(alignment: .leading, spacing: 10){
                    
                    Text(row.name)
                    Text(row.price).fontWeight(.heavy)
                    
                }
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Image("option").renderingMode(.original)
                    
                }.padding(.trailing, 15)
            }
        }
    }
}

struct DetailView : View {
    
    @Binding var show : Bool
    @State var size = ""
    
    var body : some View{
        
        VStack(spacing : 0){
            
            HStack(spacing: 18){
                
                Button(action: {
                    
                    self.show.toggle()
                    
                }) {
                    
                    Image("Back").renderingMode(.original)
                }
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Image("search").renderingMode(.original)
                }
                
                Button(action: {
                    
                }) {
                    
                    Image("shop").renderingMode(.original)
                }
                
            }.navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .padding(15)
            
            
            Image("glasses (1)").resizable()
            
            VStack(alignment: .leading ,spacing: 15){
                
                HStack{
                    
                    VStack(alignment: .leading, spacing: 8){
                        
                        Text("Unisex Gözlük").font(.largeTitle)
                        Text("290 TL").fontWeight(.heavy)
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 10){
                        
                        Circle().fill(Color.green).frame(width: 20, height: 20)
                        Circle().fill(Color.blue).frame(width: 20, height: 20)
                        Circle().fill(Color.red).frame(width: 20, height: 20)
                    }
                }
                
                
                Text("Penye kumaştan üretilmiştir. Pamuk karışımlı esnek kumaşı sayesinde oldukça rahattır. Düz deseni de onu sade ve şık bir seçim yapar.")
                
                
                
                Text("Beden Seçimi")
                
                HStack{
                    
                    ForEach(sizes,id: \.self){i in
                        
                        Button(action: {
                            
                            self.size = i
                            
                        }) {
                            
                            Text(i).padding().border(Color.black, width: self.size == i ? 1.5 : 0)
                            
                        }.foregroundColor(.black)
                    }
                }
                
                
                HStack{
                    
                    Button(action: {
                        
                    }) {
                        
                        Text("Sepet'e Ekle").padding().border(Color.black, width: 1.4)
                        
                    }.foregroundColor(.black)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        
                        Text("Satın Al").padding()
                        
                    }.foregroundColor(.white)
                        .background(Color.black)
                        .cornerRadius(10)
                    
                }.padding([.leading,.trailing], 15)
                    .padding(.top, 15)
                
            }.padding()
                .background(rounded().fill(Color.white))
                .padding(.top, -50)
            
        }
    }
}

struct rounded : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
    }
}
struct type : Identifiable{
    
    var id : Int
    var rows : [row]
}

struct row : Identifiable {
    
    var id : Int
    var name : String
    var price : String
    var image : String
    
}

// i already made a sample data.....

var sizes = ["S","M","X","XLq"]

var types = ["Ayakkabılar","Çantalar","Üst Giyim","Alt Giyim"]

var datas = [
    
    
    type(id: 0,rows: [row(id:0,name: "Unisex Gözlük", price: "290 TL", image: "glasses (1)"),row(id:1,name: "Kadın Elbise", price: "250 TL", image: "Clothing (12)")]),
    
    type(id: 2,rows: [row(id:0,name: "Spor Şort Beli Bağcıklı Şerit Detaylı Cepli", price: "380 TL", image: "Clothing (16)"),row(id:1,name: "Spor Tişört Arkası Baskılı Bisiklet Yaka Kısa Kollu", price: "500 TL", image: "Clothing (17)")]),
    
    type(id: 4,rows: [row(id:0,name: "Oversize Sporcu Atleti", price: "320 TL", image: "Clothing (3)"),row(id:1,name: "Sporcu Atleti", price: "750 TL", image: "Clothing (9)")]),
    
]
