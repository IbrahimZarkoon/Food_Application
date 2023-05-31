import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_app/Modals/CartProvider.dart';
import 'package:provider/provider.dart';


class addToDialog extends StatefulWidget {
   addToDialog({Key? key,required this.title,required this.price,required this.image,required this.desc}) : super(key: key);

   String title;
   String price;
   String desc;
   String image;

  @override
  State<addToDialog> createState() => _addToDialogState();
}

class _addToDialogState extends State<addToDialog> {

  int productCount = 1;


  @override
  Widget build(BuildContext context) {

    var cartProv = Provider.of<CartProvider>(context,listen: false);


    return GestureDetector(
      onTap: ()
      {
        Navigator.pop(context,true);
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          onTap: ()
          {

          },
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height*0.64,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 15,right: 15),
              padding: EdgeInsets.only(top: 15,bottom: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Material(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    //title and close row
                    Container(
                      padding: EdgeInsets.only(left: 15,right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [

                          Text("${widget.title}",
                            style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold,fontSize: 24),),

                          GestureDetector(
                              onTap: ()
                              {
                                Navigator.pop(context,true);
                              },
                              child: Icon(CupertinoIcons.clear_circled_solid,color: Colors.black.withOpacity(0.6),size: 30,))
                        ],
                      ),
                    ),

                    const SizedBox(height: 10,),

                    //price Container
                    Container(
                      padding: EdgeInsets.only(left: 15,right: 15),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Text("Rs. 999",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.black.withOpacity(0.8),decoration: TextDecoration.lineThrough),),

                          const SizedBox(width: 5,),

                          Text("Rs. ${widget.price}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black.withOpacity(0.8)),)

                        ],
                      ),
                    ),

                    const SizedBox(height: 10,),

                    Container(
                        padding: EdgeInsets.only(left: 15,right: 15),
                        child: Text("Any 1 Fire bird burger with 1 soft drink",style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 16),)),

                    const SizedBox(height: 15,),

                    Container(
                      height: MediaQuery.of(context).size.height*0.4,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(image: NetworkImage("${widget.image}"),filterQuality: FilterQuality.high,
                        fit: BoxFit.cover)
                      ),
                    ),

                    const SizedBox(height: 15,),

                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 15,right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [

                          //+ - Counter Container
                          Container(
                            height: 40,
                            //margin: EdgeInsets.only(right: 15),
                            //width: MediaQuery.of(context).size.width*0.31,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black.withOpacity(0.2),width: 0.5),
                              //color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(5),

                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (productCount > 0) {
                                      setState(() {
                                        productCount--;
                                      });
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      // boxShadow: [
                                      //   BoxShadow(
                                      //       color: Colors.black.withOpacity(0.1),
                                      //       offset: Offset(0,0),
                                      //       blurRadius: 1,
                                      //       spreadRadius: 1
                                      //   )
                                      // ],
                                      color: Colors.white,
                                    ),
                                    padding: EdgeInsets.all(8),
                                    child: Icon(Icons.remove, color: Colors.black),
                                  ),
                                ),

                                const SizedBox(width: 5,),

                                //Product Count Container
                                Container(
                                    alignment: Alignment.center,
                                    //height: 50,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),                                color: Colors.white,
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //       color: Colors.black.withOpacity(0.1),
                                        //       offset: Offset(0,0),
                                        //       blurRadius: 1,
                                        //       spreadRadius: 1
                                        //   )
                                        // ]
                                    ),
                                    padding: EdgeInsets.only(left: 15,right: 15),
                                    child: Text('$productCount')),

                                const SizedBox(width: 5,),

                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      productCount++;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      // boxShadow: [
                                      //   BoxShadow(
                                      //       color: Colors.black.withOpacity(0.1),
                                      //       offset: Offset(0,0),
                                      //       blurRadius: 1,
                                      //       spreadRadius: 1
                                      //   )
                                      // ],
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                    ),
                                    padding: EdgeInsets.all(8),
                                    child: Icon(Icons.add, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 10,),

                          //Add to cart Container
                          Expanded(
                            child: GestureDetector(
                              onTap: ()
                              {

                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        duration: Duration(milliseconds: 1500),
                                        content: Text("x${productCount} ${widget.title} added to Cart")));

                                setState(() {

                                  cartProv.cartLength += productCount;
                                  cartProv.totalPrice += double.parse(widget.price)*productCount;

                                  //widget.updatePopState;
                                });


                                Navigator.pop(context,true);

                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xffffec00)
                                ),
                                child: Text("Add To Cart - Rs. ${int.parse("${widget.price}")*productCount}",style: TextStyle(
                                  color: Colors.black.withOpacity(0.8),fontSize: 12,fontWeight: FontWeight.bold
                                ),),
                              ),
                            ),
                          )

                        ],
                      ),
                    )


                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
