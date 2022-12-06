import 'package:flutter/material.dart';
import 'package:orders/pages/cart/cart_screen.dart';
import 'package:orders/service/provider/appData.dart';
import 'package:provider/provider.dart';

class TopBar extends StatefulWidget {
  const TopBar({Key? key, required this.onTap}) : super(key: key);

  final Function() onTap;

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  void initState() {
    widget.onTap;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: InkWell(
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_back_ios_new),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: InkWell(
              child: Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.shopping_cart_outlined),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                        child: Text(
                          "${context.read<AppData>().products.length}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Cart(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
