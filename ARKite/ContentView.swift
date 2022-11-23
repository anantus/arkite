//
//  ContentView.swift
//  ARKite
//
//  Created by Maheswara Ananta Argono on 17/10/22.
//

import SwiftUI
import RealityKit
import ARKit

class ViewModel: ObservableObject {
    
    //create closure on object
    var onStartMoveUp: () -> Void = { }
    var onStartMoveDown: () -> Void = { }
    var onStartMoveFront: () -> Void = { }
    var onStartRotate: () -> Void = { }
    var onStartBoost: () -> Void = { }
    var showObstacle: () -> Void = {}
}

//New Comment AHAH
struct ContentView : View {
    
    @State var showContentView: Bool = false
    
    let vm = ViewModel()
    @State var isStartPlay = false
    
    
    var body: some View {
        ZStack {
            ARViewContainer(vm: vm)
            
            // Buttons UI
            if isStartPlay {
                VStack {
                    HStack {
                        LinearGradient(gradient: Gradient(colors: [Color.init(hex: "FF6E51"), Color.init(hex: "FF294C")]), startPoint: .top, endPoint: .bottom)
                            .frame(width: 86, height: 28)
                            .contentShape(RoundedRectangle(cornerRadius: 3, style: .continuous))
                            .cornerRadius(3)
                            .overlay {
                                Text("End Game")
                                    .font(.system(.callout, design: .rounded, weight: .semibold))
                                    .foregroundColor(.white)
                            }
                        
                        Spacer()
                        
                        ZStack {
                            HStack {
                                RoundedRectangle(cornerRadius: 3)
                                    .frame(width: 86, height: 28)
                                    .foregroundColor(.init(hex: "2C2C2C"))
                                    .overlay {
                                        Text("25")
                                            .font(.system(.callout, design: .rounded, weight: .semibold))
                                            .foregroundColor(.white)
                                    }
                            } .frame(width: 103, height: 28, alignment: .trailing)
                            
                            HStack {
                                Image("coinIndicatorIcon")
                                    .frame(width: 34)
                            }.frame(width: 103, height: 28, alignment: .leading)
                            
                        } .frame(width: 103, height: 28, alignment: .center)
                        
                        
                    }
                    
                    Spacer()
                    
                    HStack(alignment: .bottom) {
                        Button {
                            // TODO: rotate kite
                            vm.onStartRotate()
                        } label: {
                            ZStack(alignment: .top) {
                                LinearGradient(gradient: Gradient(colors: [Color.init(hex: "106514"), Color.init(hex: "3C8F49")]), startPoint: .top, endPoint: .bottom)
                                    .frame(width: 88, height: 89)
                                    .contentShape(RoundedRectangle(cornerRadius: 27, style: .continuous))
                                    .cornerRadius(27)
                                
                                
                                LinearGradient(gradient: Gradient(colors: [Color.init(hex: "57BD6A"), Color.init(hex: "39A239")]), startPoint: .top, endPoint: .bottom)
                                    .frame(width: 82, height: 82)
                                    .contentShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                                    .cornerRadius(25)
                                    .overlay {
                                        VStack(spacing: 8) {
                                            Image(systemName: "arrow.clockwise")
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                            
                                            Text("ROTATE")
                                                .font(.system(.subheadline, design: .rounded, weight: .heavy))
                                                .foregroundColor(.white)
                                        }
                                    }
                            }
                        }
                        
                        
                        Spacer()
                        
                        VStack(spacing: 14) {
                            Button {
                                vm.onStartMoveUp()
                                // TODO: stretch kite
                            } label: {
                                ZStack(alignment: .top) {
                                    LinearGradient(gradient: Gradient(colors: [Color.init(hex: "9F6B00"), Color.init(hex: "C98A01")]), startPoint: .top, endPoint: .bottom)
                                        .frame(width: 88, height: 89)
                                        .contentShape(RoundedRectangle(cornerRadius: 27, style: .continuous))
                                        .cornerRadius(27)
                                    
                                    
                                    LinearGradient(gradient: Gradient(colors: [Color.init(hex: "F4DB05"), Color.init(hex: "F4970E")]), startPoint: .top, endPoint: .bottom)
                                        .frame(width: 82, height: 82)
                                        .contentShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                                        .cornerRadius(25)
                                        .overlay {
                                            VStack(spacing: 8) {
                                                Image(systemName: "chevron.up")
                                                    .font(.title)
                                                    .fontWeight(.bold)
                                                    .foregroundColor(.white)
                                                
                                                Text("STRETCH")
                                                    .font(.system(.subheadline, design: .rounded, weight: .heavy))
                                                    .foregroundColor(.white)
                                            }
                                        }
                                }
                            }
                            
                            
                            Button {
                                vm.onStartMoveDown()
                                // TODO: pull kite
                            } label: {
                                ZStack(alignment: .top) {
                                    LinearGradient(gradient: Gradient(colors: [Color.init(hex: "D20936"), Color.init(hex: "EA3242")]), startPoint: .top, endPoint: .bottom)
                                        .frame(width: 88, height: 89)
                                        .contentShape(RoundedRectangle(cornerRadius: 27, style: .continuous))
                                        .cornerRadius(27)
                                    
                                    
                                    LinearGradient(gradient: Gradient(colors: [Color.init(hex: "FF6E51"), Color.init(hex: "FF294C")]), startPoint: .top, endPoint: .bottom)
                                        .frame(width: 82, height: 82)
                                        .contentShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                                        .cornerRadius(25)
                                        .overlay {
                                            VStack(spacing: 8) {
                                                Text("PULL")
                                                    .font(.system(.subheadline, design: .rounded, weight: .heavy))
                                                    .foregroundColor(.white)
                                                
                                                Image(systemName: "chevron.down")
                                                    .font(.title)
                                                    .fontWeight(.bold)
                                                    .foregroundColor(.white)
                                            }
                                        }
                                }
                            }
                            
                            
                        }
                    }
                } .padding()
            } else {
                VStack {
                    Spacer()
                    
                    Button {
                        vm.onStartBoost()
                        
                        withAnimation {
                            isStartPlay.toggle()
                            
                        }
                    } label: {
                        ZStack(alignment: .top) {
                            LinearGradient(gradient: Gradient(colors: [Color.init(hex: "9F6B00"), Color.init(hex: "C98A01")]), startPoint: .top, endPoint: .bottom)
                                .frame(width: 223, height: 65)
                                .contentShape(RoundedRectangle(cornerRadius: 31, style: .continuous))
                                .cornerRadius(31)
                            
                            
                            LinearGradient(gradient: Gradient(colors: [Color.init(hex: "F4DB05"), Color.init(hex: "F4970E")]), startPoint: .top, endPoint: .bottom)
                                .frame(width: 217, height: 58)
                                .contentShape(RoundedRectangle(cornerRadius: 28, style: .continuous))
                                .cornerRadius(28)
                                .overlay {
                                    VStack(spacing: 8) {
                                        Text("FLY")
                                            .font(.system(.title, design: .rounded, weight: .heavy))
                                            .foregroundColor(.white)
                                        
                                    }
                                }
                        }
                    }
                } .padding()
            }
            
            
        }
        
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    let vm: ViewModel
    
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let mainAnchor = try! Experience.loadARKite()
        
        
        // MARK: - MODEL ENTITY
        let kite = mainAnchor.findEntity(named: "kite")
        
        // obstacle entity
        let obstacle = mainAnchor.findEntity(named: "obstacle")
        
        let initialPosition = SIMD3<Float>(0,0,0)
        var distanceBetweenKite = SIMD3<Float>(0,0,0)
        
        vm.onStartMoveUp = {
            mainAnchor.notifications.moveUp.post()
            distanceBetweenKite = kite!.position
        }
        vm.onStartMoveDown = {
            mainAnchor.notifications.moveDown.post()
            distanceBetweenKite = kite!.position
        }
        vm.showObstacle = {
            mainAnchor.notifications.showObstacle.post()
        }
        
        vm.onStartMoveFront = {
            //Find kite Angle
            mainAnchor.notifications.moveFront.post()
            let kiteTravel = kite!.position
            print(simd_distance(kiteTravel, distanceBetweenKite))
            let kiteAngle = findAngle(kiteCoordinates: kite!.position, initialCoordinates: initialPosition, kiteDistance: simd_distance(kiteTravel, distanceBetweenKite))
            
            for _ in 1...Int(kiteAngle){
                mainAnchor.notifications.frontRotate.post()
            }
            
            print("initial distance", simd_distance(kite!.position, initialPosition))
            
        }
        
        vm.onStartRotate = {
            mainAnchor.notifications.moveRotateClockwise.post()
        }
        vm.onStartBoost = {
            mainAnchor.notifications.kiteStart.post()
            
            mainAnchor.actions.kiteStart.onAction = printer
        }
        
        // TODO: - SHOW OBSTACLE
        Timer.scheduledTimer(withTimeInterval: 10, repeats: false) { timer in
            let kitePos = kite?.position
            
            
            // after 10 seconds, show the osbtacle
            obstacle?.position = simd_float3(0, 0, 0)
            
            vm.showObstacle()
            
            // set the initial postition first
            
            Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { secTimer in
               
                
                if let kitePos = kitePos {
//                    obstacle?.transform.translation = kitePos
                    
                    obstacle?.move(to: .init(translation: kitePos), relativeTo: kite, duration: 5)
                    print("================================================")
                    print("Kite Position: \(kitePos)")
                    print("================================================")
                }
                print("Timer 2 work")
            }
            print("Timer 1 Work")
            timer.invalidate()
            
        }
        
        arView.scene.anchors.append(mainAnchor)
        
        return arView
        
    }
    
    func printer(_ entity: Entity?) -> Void {
        print("Entity from printer: \(entity!)")
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func findDistance(kiteCoordinates: SIMD3<Float>, initialCoordinates: SIMD3<Float>) -> Float {
        let simdDistance = simd_distance(kiteCoordinates, initialCoordinates)
        print("the distance:\(simdDistance)")
        return simdDistance
    }
    
    func findAngle(kiteCoordinates: SIMD3<Float>, initialCoordinates: SIMD3<Float>, kiteDistance: Float) -> Float{
        
        let radius = simd_distance(kiteCoordinates, initialCoordinates)
        print("kite distance :",kiteDistance)
        
        let cos = 1.00405 / (2 * radius)
        
        let acos = acos(cos) * 180 / Float.pi
        
        let angle : Float = 90 - acos
        
        print("the angle:\(angle)")
        
        return angle
    }
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif



//        Timer.scheduledTimer(withTimeInterval: 8, repeats: true) { firstTimer in
//            if !obstacleShowed {
//                let kitePos = kite?.position
//                @State var repeatObstacleTimer = true
////
////                let posX = Float.random(in: 0...1)
////                let posY = Float.random(in: 0...1)
////                let posZ = Float.random(in: 0.5...1)
////                obstacle?.position = kitePos ?? [posX, posY, posZ * -1]
////
////
////
////                vm.showObstacle()
//
//            // move obstacle to the kite
//
//                Timer.scheduledTimer(withTimeInterval: 0.1, repeats: repeatObstacleTimer) { timer in
//
//                    guard let obstacle = obstacle else {
//                        timer.invalidate()
//                        return
//                    }
//                    if obstacle.position.y >= 2.0 {
//                        print("Obstacle stop: \(obstacle.position.x) - \(obstacle.position.y) - \(obstacle.position.z)")
//                        timer.invalidate()
//                    } else {
//                        obstacle.position.z -= 0.1
//                        obstacle.position.y += 0.1
//                        print("loop running: \(obstacle.position.x) - \(obstacle.position.y) - \(obstacle.position.z)")
//                    }
//                }
//
//        }
//
//
//            firstTimer.invalidate()
//        }



