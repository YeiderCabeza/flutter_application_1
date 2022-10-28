import 'package:flutter/material.dart';

class frmRegistroDS extends StatefulWidget {
  const frmRegistroDS({Key? key});

  @override
  State<frmRegistroDS> createState() => _frmRegistroDSState();
}

class _frmRegistroDSState extends State<frmRegistroDS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 300,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("imagenes/imgMaster.jpg"),
                        fit: BoxFit.fill)),
                child: Container(
                  padding: const EdgeInsets.only(top: 90, left: 10),
                  color: const Color(0xff3b5999).withOpacity(0.4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: const TextSpan(
                          text: "Bienvenido a",
                          style: TextStyle(
                            color: Colors.yellow,
                            fontSize: 25,
                            letterSpacing: 3,
                          ),
                          children: [
                            TextSpan(
                              text: "Flutter APP",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 112, 142, 23),
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      const Text("Registrate",
                          style: TextStyle(
                              letterSpacing: 1,
                              color: Colors.white,
                              fontSize: 15)),
                    ],
                  ),
                ),
              )),
          Positioned(
              top: 220,
              child: Container(
                height: 400,
                width: MediaQuery.of(context).size.width - 40,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 252, 252, 255),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.8),
                          blurRadius: 10,
                          spreadRadius: 5)
                    ]),
                child: Column(
                  children: [],
                ),
              ))
        ],
      ),
    );
  }
}
