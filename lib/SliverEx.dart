import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SliverEx(),
  ));
}

class SliverEx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            //To make the title pinned, we make it false
            floating: false,
            // Make it true To keep the bottom portion of appbar pinned to the page
            pinned: true,
            title: Text("Sliver App Bar"),
            //We can add any widget
            bottom: AppBar(
              elevation: 0,
              title: Container(
                // We use mediaQuery to adjust it according to the size of the display
                width: MediaQuery.of(context).size.width,
                height: 40,
                color: Colors.white,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search here',
                      prefixIcon: Icon(Icons.search),
                      suffixIcon: Icon(Icons.camera_alt)),
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green),
                          height: 100,
                          child:
                              Center(child: Text("Inside sliver list $index")),
                        ),
                      ),
                  childCount: 20))
        ],
      ),
    );
  }
}
