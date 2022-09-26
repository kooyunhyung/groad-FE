class QMenu1 {
  final String text;
  final String icon;

  QMenu1({this.text, this.icon});
}

List<QMenu1> QMenuList1 = [
  QMenu1(text: "회원 가입은 어떻게 하나요?"),
  QMenu1(text: "탈퇴는 어떻게 하나요?"),
  QMenu1(text: "회원 수정은 어떻게 하나요?"),
  QMenu1(text: "회원가입하면 어떤 혜택이 있나요?"),
];

class QMenu2 {
  final String text;
  final String icon;

  QMenu2({this.text, this.icon});
}

List<QMenu2> QMenuList2 = [
  QMenu2(text: "디지털 패스포트는 어떤 기능인가요?"),
  QMenu2(text: "디지털 패스포트는 어떻게 사용하나요?"),
  QMenu2(text: "디지털 패스포트의 혜택이 무엇인가요?"),
];

class QMenu3 {
  final String text;
  final String icon;

  QMenu3({this.text, this.icon});
}

List<QMenu3> QMenuList3 = [
  QMenu3(text: "포인트를 어디에 쓸 수 있나요?"),
  QMenu3(text: "포인트는 어떻게 얻을 수 있나요?"),
  QMenu3(text: "포인트를 사용할 수 없다고 합니다."),
];

class QMenu4 {
  final String text;
  final String icon;

  QMenu4({this.text, this.icon});
}

List<QMenu4> QMenuList4 = [
  QMenu4(text: "회원이 아닌데도 이용할 수 있나요?"),
  QMenu4(text: "관광 코스별로 좋은 점이 무엇이 있나요?"),
];

class AMenu1 {
  final String text;

  AMenu1({this.text});
}

List<AMenu1> AMenuList1 = [
  AMenu1(text: '상단 메뉴 버튼을 누르시고 로그인 버튼을 누르시면 회원가입 버튼이 나옵니다. 그 버튼을 누르시면 됩니다.'),
  AMenu1(text: '설정으로 들어가셔서 회원 탈퇴 버튼을 누르시면 됩니다.'),
  AMenu1(text: '설정으로 들어가셔서 회원 수정 버튼을 누르시면 됩니다.'),
  AMenu1(text: '코스 완주 시 포인트 적립을 해드립니다.')
];

class AMenu2 {
  final String text;

  AMenu2({this.text});
}

List<AMenu2> AMenuList2 = [
  AMenu2(text: '관광 코스 거점 방문을 인증할 수 있도록 qr 코드를 통해 구현한 기능입니다. 관광객은 해당 코스에 나와있는 거점을 방문했을 시 '
      '해당 장소에 설치된 qrcode를 찍으면 디지털 패스포트를 통해 포인트를 적립할 수 있습니다.'),
  AMenu2(text: '하단의 + 버튼을 누르시면 qr코드 아이콘이 뜹니다. 그 아이콘을 누르시고 qr코드를 찍으시면 됩니다.'),
  AMenu2(text: '포인트를 적립할 수 있게 되며, 이 포인트를 통해 여러 이벤트 행사에서 상품을 받아 가실 수 있습니다.'),
];

class AMenu3 {
  final String text;

  AMenu3({this.text});
}

List<AMenu3> AMenuList3 = [
  AMenu3(text: '목표치 이상 포인트를 모으시면 소정의 상품을 모바일로 보내드립니다.'),
  AMenu3(text: '디지털 패스포트 기능을 통해 거점을 방문해야 얻을 수 있습니다.'),
  AMenu3(text: '유효기간이 지났는지 확인해 보시기 바랍니다. 유효기간이 지난 포인트는 사용할 수 없습니다.'),
];

class AMenu4 {
  final String text;

  AMenu4({this.text});
}

List<AMenu4> AMenuList4 = [
  AMenu4(text: '회원이 아니시면 디지털 패스포트 기능을 사용하실 수 없음으로 각종 이벤트 행사를 통한 상품을 얻어가실 수 없습니다.'),
  AMenu4(text: '코스 종류별로 디지털 패스포트를 통해 얻어가는 포인트 수량이 달라질 수 있습니다. 장거리 코스를 수행하신다면 그만큼 디지털 패스포트를'
      '인증할 때마다 얻어가는 포인트 수량은 높아집니다. 단, 만보기 기능을 통한 걸음 수 측정을 통해 교통편을 이용했는지 보도를 통해 이용했는지 판별하여 지급하게 됩니다.'),
];