import 'package:flutter/material.dart';
import 'package:mgl_app/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 18,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromRGBO(229, 229, 229, 0.5),
          ),
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6.0),
          height: 80,
          child: Row(
            children: [
              Text(
                (index + 1).toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 8.0),
              Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.pink,
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Row(
                  children: [
                    const Flexible(
                      child: Text(
                        'Үсгийн үндсэн зурлага, эгшиг үсэг',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 8.0),
                        height: 40.0,
                        width: 40.0,
                        child: const Center(child: const Text('13:04'))),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}