[![Swift Version][swift-image]][swift-url]
[![License][license-image]][license-url]

# RUAlone-iOS: 혼자왔디?
iOS repository for RUAlone @ Techeer: Team Bootios

<br />
<p align="center">
  <a href="https://github.com/alexanderritik/Best-README-Template">

  </a>
  
  ![ezgif com-video-to-gif](https://user-images.githubusercontent.com/35219323/223493742-0774b913-8e43-4003-8fa8-8a9f270cebb9.gif)
  ![ezgif com-video-to-gif (1)](https://user-images.githubusercontent.com/35219323/223493869-4fce26a9-e373-4793-b453-d5fca4ddf7e9.gif)
  ![ezgif com-video-to-gif (2)](https://user-images.githubusercontent.com/35219323/223493899-64d64c94-5901-46c9-bc84-b94b64fbb136.gif)
  ![ezgif com-video-to-gif (3)](https://user-images.githubusercontent.com/35219323/223493924-9e154765-ee7f-4b22-84c1-1b595fa54cca.gif)

  <p align="center">
    혼밥러들을 함께 밥 먹을 친구와 이어주는 앱
  </p>
</p>

## 기능

- [x] 함께 밥 먹을 친구를 찾을 수 있어요.
- [x] 함께 밥 먹을 친구를 구할 수 있어요.
- [x] 원하는 친구들과 채팅을 통해 연락해요.
- [x] 간편한 소셜 로그인으로 이용해요.
- [x] 오직 주변에 있는 친구들만 찾아봐요.

## 요구사항

- iOS 16.0+
- Xcode 14.2

## 기술스택

- SwiftUI
- Combine
- Alamofire
- KeyChain
- MapKit
- Core Data
- Core Location
- KakaoSDK
- SendbirdSDK
- LottieSDK

## 고민한 내용

- 개발 스케일이 커지고 있는데 기존 MVVM에서 확장 가능한 방안이 없을까?
  - [Clean Architecture + MVVM](https://tech.olx.com/clean-architecture-and-mvvm-on-ios-c9d167d9f5b3)
- 추후 테스트 및 배포 자동화 계획이 있는데, 모바일 자동화를 위한 툴은 뭐가 있을까? 
  - Fastlane
- 협업을 위해 Swift 다운 코드, 가독성 좋은 코드를 규칙을 강제하고 싶은데 Linter는 뭐가 있지?
  - SwiftLint
- JWT, Kakao Access Token 같은 민감 정보는 어떻게 관리해야되지? 앱의 상태 값을 안전하게 저장하는 방법은 무엇이 있을까? 
  - KeyChain + Persistence(Core Data)
- 하나 이상의 언어를 적용하려면 어떻게 해야되지?
  - Localization

## 기여자

| 멤버   | 연락처  |
|--------|---------|
| 홍성민 | [KKodiac](https://github.com/KKodiac/) |
| 정혜린 | [HAERYN](https://github.com/HAERYN/)  |

[swift-image]:https://img.shields.io/badge/swift-5.7-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: MIT
