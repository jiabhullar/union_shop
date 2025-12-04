## Flutter Coursework - Union Shop

**Module:** 
PROGRAMMING APPLICATIONS AND PROGRAMMING LANGUAGES

**Project Overview:**
A Flutter recreation of the University of Portsmouth Student Union Shop. The app implements product collections, product pages, a shopping cart, personalisation, and a responsive UI focused on mobile layout.

## Prerequisites
Before running the project, ensure you have:
- Flutter SDK 3.0+
- A working Android Emulator, iOS Simulator, or Chrome browser
- Git installed
- (Optional) VS Code or Android Studio with Flutter extensions

## Setup 
1. Clone the repository - git clone https://github.com/jiabhullar/union_shop.git
cd union_shop

2. Install dependencies - flutter pub get

3. Run the project (on Web) - flutter run (-d chrome)

## Usage
Home Page: 
- Displays hero banner with call-to-action
- Popular product previews

Collections Page:
- Responsive grid (no overflow)
- Each item opens a Product page

Product Page:
- Displays product image, description, price, and Add to Cart button

Cart:
- Shows items, quantity, and totals
- Remove or adjust items

Account:
- Placeholder authorisation

## Project Structure: 
lib/
 ┣ widgets/
 ┃ ┣ nav_bar.dart
 ┃ ┣ product_card.dart
 ┃ ┗ footer.dart
 ┣ pages/
 ┃ ┣ about_us.dart
 ┃ ┣ auth_page.dart
 ┃ ┣ cart_page.dart
 ┃ ┣ collection_page.dart
 ┃ ┣ collections_page.dart
 ┃ ┣ personalisation_page.dart
 ┃ ┣ personalisation_about_page.dart
 ┃ ┣ product_page.dart
 ┃ ┗ sale_page.dart
 ┣ services/
 ┃ ┣ collection_service.dart
 ┃ ┣ product_service.dart
 ┃ ┗ cart_service.dart
 ┣ models/
 ┃ ┣ cart_item.dart
 ┃ ┣ collection.dart
 ┃ ┣ product.dart
 ┃ ┗ sale_product.dart
 ┣ data/
 ┃ ┗ sample_products.dart
 ┣ main.dart

 