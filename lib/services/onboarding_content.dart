class OnboardingContent {
  final String image;
  final String title;
  final String discription;

  OnboardingContent({required this.image, required this.title, required this.discription});
}

List<OnboardingContent> contents = [
  OnboardingContent(
      title: 'Buy, sell, and trade gift cards in a decentralised system',
      image: 'images/img1.png',
      discription: "Enjoy the benefits of a decentralised system while you trade gift cards securely"
  ),

  OnboardingContent(
      title: 'Unbeatable Rates',
      image: 'images/img2.png',
      discription: "We provide you with a wide range of gift cards at amazing rates"
  ),
  OnboardingContent(
      title: 'Connect With Trusted Merchants',
      image: 'images/img3.png',
      discription: "Enjoy trading with our trusted and verified merchants across many countries"
  ),
];