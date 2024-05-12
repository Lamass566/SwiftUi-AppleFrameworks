import SwiftUI
//init
struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    
    let columns: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible())]
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns: columns){
                    ForEach(MockData.frameworks){ framework in
                        FrameworkTitleView(framework: framework)
                            .padding(.top, 20)
                            .onTapGesture {
                                viewModel.selectedFramework = framework
                            }
                    }
                    
                }
            }
            .navigationTitle("🍎 Frameworks")
            .sheet(isPresented: $viewModel.isShowingDetailView){
                FrameworkDetailView(framework: viewModel.selectedFramework!,
                                    isShowingDetailView: $viewModel.isShowingDetailView)
            }
        }
    }
}

#Preview {  
    FrameworkGridView()
}

struct FrameworkTitleView: View{
    let framework: Framework
    
    var body: some View{
        VStack{
            Image(framework.imageName)
                    .resizable()
                    .frame(width: 90, height: 90)
            Text(framework.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .scaledToFit()
                    .minimumScaleFactor(0.6)
            }
    }
    
}
