# groad_app

A new Flutter project.

한림대학교 캡스톤 디자인 춘천 관광앱 flutter 이용한 프론트 코드

1. 프로젝트 요약

▶ 춘천시 관광을 소재로 하는 앱을 개발하였고, 춘천시의 주요 관광 명소를 소개하고 관광 명소들을 묶어 놓은 코스를 주행할 수 있는 시스템을 제공한다. 또한 관광 명소들 주변의 카페, 음식점, 숙소 등을 소개하여 춘천시의 경제 활성화에 기여하도록 하였으며 여행자들 사이에 후기를 공유할 수 있도록 커뮤니티 장을 마련하였다.

2. 오픈소스 사용 내역

▶ 안드로이드 스튜디오 (플러터 프레임워크(Dart))

▶ 파이참 (장고 프레임워크(Python))

▶ 피그마(Figma)

▶ MariaDB

▶ imgbb(이미지 저장소)

▶ AWS EC2 server

3. 프로젝트 목적

▶ 관광과 관련된 소재를 벤치마킹 하던 중 기존 강원도 관광 앱이 얼마전 서비스 종료를 하였고 아직 운영되고 있는 웹 사이트를 살펴보았는데 디자인, 기능, 시스템 체계 면에서 부실한 면을 보여준 것 같았다. 관광앱에 있어서 단순한 코스 정보 설명만으로는 관광객들을 끌어들여 수익을 창출할 수 없는 것을 보게 됐다. 반면에 제주도 올레 길을 코스로 짠 어플에서는 디자인, 기능, 제도 등이 모두 깔끔하고 체계적이었으며 관광객들로 하여금 이 앱을 사용하게끔 할 수 있는 동기부여 요소들이 있었다. 그래서 강원도 춘천시를 대상으로 하여 춘천시의 대표 관광 명소들을 소개하고 알리는데 있어서 이 장점을 활용하면 좋을 것 같다는 필요성을 느꼈다. 저희 팀 관광 앱은 좀 더 동적이고 실시간적인 요소를 넣어 관광객들로 하여금 적극적인 참여를 할 수 있도록 개발하는데 목적을 두었다.

4. 프로젝트 어플 화면 설명서

▶ 인트로 화면 : 어플 로고와 캐릭터를 띄워주며 3초간 보여주게 됨.

![image](https://user-images.githubusercontent.com/77048218/222997914-32de434f-4f9c-49a3-a2b0-ef3a697854db.png)

▶ 메인 화면 : 공지 배너창(포스터, 날씨 알림창), 여행 코스 둘러보기, 코스 주변 포토스팟&카페 리스트, 코스 주변 맛집&숙소 리스트, 여행자들의 후기 리스트 등 목록 나열

![image](https://user-images.githubusercontent.com/77048218/222997975-4d740060-5058-4d7f-b079-df08ace2c91e.png)
![image](https://user-images.githubusercontent.com/77048218/222998033-154b2538-9b45-4914-804c-7f1fccfac5e2.png)

▶ 메뉴 리스트: (로그인 전) 여행 정보, 여행 도우미, 자주 묻는 질문, 이용 약관, (로그인 후) 이벤트, 문의하기, 설정, 로그아웃 목록 추가 

![image](https://user-images.githubusercontent.com/77048218/222998084-197d35a2-0959-4ab6-8d83-1bacd90491e0.png)

▶ 회원가입&로그인 창: 회원 가입, 로그인 정보들은 모두 DB에 저장 후 서버를 통해 불러와 기능 작동함.

![image](https://user-images.githubusercontent.com/77048218/222998251-82b06441-1cdb-477d-abb5-af6c89c523ce.png)

▶ 총 9개의 코스 구현 : 메인 화면의 여행 코스 둘러보기에 소개된 리스트를 선택할 시 해당 코스 화면으로 넘어감. 코스 주행을 시작하면 실시간으로 여행자의 위치정보가 GPS로 기록되며 해당 거점에서의 방문 인증을 스탬프 QR 코드를 통해 할 수 있다. 

![image](https://user-images.githubusercontent.com/77048218/222998399-dee85429-3f98-4e12-a619-e80cf33846f6.png)
![image](https://user-images.githubusercontent.com/77048218/222998477-b75a263b-c60b-45fd-a57a-50103182d77f.png)
![image](https://user-images.githubusercontent.com/77048218/222998534-70964407-6eb5-4d99-a779-58f209aa4308.png)

▶ 여행 정보: 9개의 코스를 종류별로 나눈 정보를 제공해준다.

![image](https://user-images.githubusercontent.com/77048218/222998725-09c125ac-5874-4662-8402-df55ec85e40d.png)

▶ 여행도우미: 여행도우미 메뉴를 클릭하면 여행에 도움이 되는 정보들을 제공해준다. (이용수칙, 준비물, 패스포트)

![image](https://user-images.githubusercontent.com/77048218/222998912-feafd303-4d57-4b0e-bba0-5d50b902f376.png)
![image](https://user-images.githubusercontent.com/77048218/222998984-84536625-77a9-4873-8e5a-4eebb9cce0b8.png)

▶ 여행자들의 후기 : 후기 작성 탭에서 장소, 텍스트, 사진, 평점을 입력하고 작성 완료 버튼을 누르면 후기 리스트에 등록이 된다.

![image](https://user-images.githubusercontent.com/77048218/222999305-a2f7f816-c372-4db7-acbc-dcede9640e31.png)

▶ FAQ & 문의하기 : 자주 묻는 질문 사항들과 여행객들이 문의 사항을 접수할 수 있도록 하였다.

![image](https://user-images.githubusercontent.com/77048218/222999430-1b26ddcd-09bc-443f-8ca4-6edffe6ec1a3.png)

▶ 설정 : 지도 종류, 테마 색상 종류를 선택하는 페이지

![image](https://user-images.githubusercontent.com/77048218/222999479-335d424a-8f79-49f4-8f48-42d2d80e5d7d.png)
![image](https://user-images.githubusercontent.com/77048218/222999568-631aa214-8f1d-42ef-999c-102f6dbb7f33.png)

▶ 포토스팟 & 카페 & 맛집 & 숙소 리스트 : 코스 해당 거점 주변에 있는 지점들을 선별하여 관광객들에게 정보 제공

![image](https://user-images.githubusercontent.com/77048218/222999735-429a64ac-def4-4ad2-aeb5-225639081d8b.png)

▶ 이렇게 기존의 부실했던 앱이 가질 수 있는 디자인과 기능, 제도면에서 관광객들을 적극 참여할 수 있도록 코스 완주 포인트 지급 기능과 다양한 디자인 설정 기능들을 추가하여 문제점을 보완하였다. 다음과 같이 코스를 완주하였을 때 지급받은 포인트가 적립되는 것을 통해 이후 다양한 이벤트 혜택을 받을 수 있다.

![image](https://user-images.githubusercontent.com/77048218/223000069-0d92f9e0-2d3b-41ce-ad76-6d747b91bef8.png)
![image](https://user-images.githubusercontent.com/77048218/223000081-b8db239a-71fa-40b1-afc8-5bb6acb1394a.png)

▶ 개발 과정 요약 :  2022.9월(피그마 이용한 앱 UI 뼈대 제작 + AWS 서버 구축)
                    2022.10월(현장 탐사, 코스 종류, 코스 기능 구현)
                    2022.11월(기타 메뉴 기능, 기능 테스트)
                    
▶ 앱 작동 과정 : AndroidStudio에서 Dart 언어로 개발된 플러터를 통해 프론트계열에서 개발을 하였고, Pycharm에서 python 언어로 짜여진 django를 통해 백엔드 계열에서 DB model 작성, API 작성하여 AWS 서버를 통해 통신하도록 하였다. 사용자 후기 작성에서 이미지 데이터는 imgbb 사이트에서의 API를 호출하여 업로드하고 불러올 수 있도록 하였다.

5. 활용 방안 및 기대효과

▶ 시중에 존재하는 관광의 기능을 하는 앱은 많고 시장성과 경쟁력에서도 우수하지만 강원도 지역을 대상으로 한 관광 앱은 그 기능이 부실했고 서비스 중단을 한 경우도 존재했다. 우리 팀은 이 관광 앱을 통해 춘천시의 주요 관광 명소들을 차례로 가이드 해주어 관광객들로 하여금 적극적인 참여 자세와 즐거움을 유도해주어 시장성과 경쟁력에 있어서 압도할 것을 예상한다. 뿐만 아니라 관광 명소마다 설치된 QR코드에 기재된 앱 디자인 로고를 통해 광고 효과를 줄 수 있고, 앱을 통해 알려지는 관광 명소 주변 카페, 음식점, 숙소 등 또한 인지도가 증가하여 춘천시의 경제 활성화에 기여될 것으로 기대된다.

6. 데모 영상

https://www.youtube.com/watch?v=glKBWd-kSEU
