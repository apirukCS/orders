import 'package:orders/model/product_model.dart';

class ApiProduct {
  static Future<List<ProductModel>> fetchListAllProduct() async {
    const String textExample =
        "**** สินค้าของเราเป็นผลผลิตจากสวนเอง การจัดเก็บหรือจัดส่งในบางครั้งอาจล่าช้ากว่าปกติไป 2-3 วัน "
        "เนื่องด้วยสภาพอากาศที่ไม่อาจจัดเก็บได้และสินค้าที่จัดส่งไปหากมีการเสียอาจเนื่องจากสาเหตุการจัดส่งหรือสินค้าเน่าเสียจากสาเหตุอื่นทางร้านยินดีเคลมให้ทุกกรณี "
        "เพราะผลผลิตทางการเกษตรบางครั้งก็ดูยากมากๆ ดูภายนอกสวยงามแต่ข้างในกลับเสีย ลูกค้าสามารถทักข้อความได้นะคะ ทางร้านยินดีเคลมให้ทุกกรณีนะคะ*****";

    const String textExampleEn =
        "*** Our products are produced from our own gardens. "
        "Sometimes storage or delivery may be delayed by a few days.Due to the weather conditions that cannot be stored and "
        "the delivered goods, if there is a breakdown, it may be due to delivery reasons or spoiled goods from other causes, "
        "the shop is happy to claim in any case. ***";

    return [
      ProductModel(
          productId: 1,
          productNameTh: "เสื้อกันหนาวไหมพรม",
          productNameEn: "silk sweater",
          price: 200,
          detailTh: "ผ้านุ่ม ใส่สบาย \n\n$textExample",
          detailEn: "soft and comfortable fabric \n\n$textExampleEn",
          image:
              "https://obs.line-scdn.net/0h1Ovs9BsbbmBLCkePaGIRN3FcbQ94Zn1jLzw_YxdkMFQxMyA1I252VWcDZFVgOCk-ImwjBWcDdVE0aCwyc292/w644"),
      ProductModel(
          productId: 2,
          productNameTh: "กางเกงขาสั้น สไตล์วินเทจ",
          productNameEn: "vintage style shorts",
          price: 300,
          detailTh: "ผ้านุ่ม ใส่สบาย \n\n$textExample",
          detailEn: "soft and comfortable fabric \n\n$textExampleEn",
          image: "https://pbs.twimg.com/media/D99thxEUwAAJ0-h.jpg"),
      ProductModel(
          productId: 3,
          productNameTh: "ผ้าปูที่นอน",
          productNameEn: "bedsheet",
          price: 250,
          detailTh:
              "ผ้าปูที่นอนขนาด 5 ฟุต เนื้อผ้านุ่ม ไม่ขาดง่าย \n\n$textExample",
          detailEn:
              "Bed sheet size 5 feet, soft fabric, not easily torn \n\n$textExampleEn",
          image: "https://inwfile.com/s-cl/6dba2t.jpg"),
      ProductModel(
          productId: 4,
          productNameTh: "แว่นตากันแดด",
          productNameEn: "sunglasses",
          price: 100,
          detailTh: "แว่นแข็งแรง ทนทาน เก๋ไก๋\n\n$textExample",
          detailEn: "Strong and durable eyeglasses  \n\n$textExampleEn",
          image:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9q8s0kQoxFTaZ90L9sP1md-b1ntSQMZQ1WaS-1xq3t9iCdwxYXZ_SI9GwZO97iEjFwMY&usqp=CAU"),
      ProductModel(
          productId: 5,
          productNameTh: "แก้วน้ำ",
          productNameEn: "glass",
          price: 129,
          detailTh: "แก้วน้ำอเนกประสงค์ แข็งแรง ทนทาน \n\n$textExample",
          detailEn: "Versatile glass, strong and durable \n\n$textExampleEn",
          image: "https://inwfile.com/s-ch/al5uo1.jpg"),
      ProductModel(
          productId: 6,
          productNameTh: "โทรศัพท์ Iphone 14",
          productNameEn: "Iphone XR",
          price: 7000,
          detailTh: "Iphone XR สวยม๊วกกกก \n\n$textExample",
          detailEn: "Iphone XR it's so bueatiful \n\n$textExampleEn",
          image:
              "https://www.flashfly.net/wp/wp-content/uploads/2022/07/Its-not-a-one-off-thing-future-non-Pro-iPhones-will-no-longer-have-the-latest-Apple-processors.jpg"),
      ProductModel(
          productId: 7,
          productNameTh: "กีตาร์ f310",
          productNameEn: "guitar f310",
          price: 4500,
          detailTh: "กีตาร์โปร่ง yamaha f310 \n\n$textExample",
          detailEn: "guitar yamaha f310 \n\n$textExampleEn",
          image: "https://inwfile.com/s-fm/xtsk5d.png"),
      ProductModel(
          productId: 8,
          productNameTh: "กระเป๋าสะพายข้าง",
          productNameEn: "shoulder bag",
          price: 100,
          detailTh: "เก๋ไก๋ ฝุดๆ \n\n$textExample",
          detailEn: "very coolllll\n\n$textExampleEn",
          image:
              "https://img10.jd.co.th/n0/jfs/t49/261/197695592/117091/88fc598e/62cfb861Nb1ecb750.jpg!q70.jpg"),
    ];
  }
}
