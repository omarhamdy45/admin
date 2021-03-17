import 'package:ecommerce/models/movie_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';



class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String title = "";
  String description = "";
  String movietime = "";
  String imageUrl = "";
  String numberofseats = "";
  

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  TextField(
                    decoration: InputDecoration(
                        labelText: "Title", hintText: "Add title"),
                    onChanged: (val) => setState(() => title = val),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "Description", hintText: "Add description"),
                    onChanged: (val) => setState(() => description = val),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "Datetime", hintText: "Add datetime"),
                    onChanged: (val) => setState(() =>  movietime= val),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "Number of seats", hintText: "Number of seats"),
                    onChanged: (val) => setState(() => numberofseats = val),
                  ),
                  
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                        labelText: "Image Url",
                        hintText: "Paste your image url here"),
                    onChanged: (val) => setState(() => imageUrl = val),
                  ),
                  SizedBox(height: 30),
                  Consumer<Products>(
                    builder: (ctx, value, _) => RaisedButton(
                        color: Colors.blue,
                        textColor: Colors.black,
                        child: Text("Add movie"),
                        onPressed: () {
                        
                          setState(() {
                            _isLoading = false;
                          });

                          if (title == "" ||
                              description == "" ||
                              movietime == "" ||
                              imageUrl == "") {
                            Toast.show("Please enter all field", context,
                                duration: Toast.LENGTH_LONG);
                          } 
                           else {
                            setState(() {
                              _isLoading = false;
                            });
                            
                            
                            value
                                .add(

                              id: DateTime.now().toString(),
                              title: title,
                              description: description,
                              movietime:  movietime,
                              imageUrl: imageUrl,
                              nubmberofseats: numberofseats,

                            )
                            
                                .catchError((_) {
                              return showDialog<Null>(
                                context: context,
                                builder: (innerContext) => AlertDialog(
                                  title: Text("An error occurred!"),
                                  content: Text('Something went wrong.'),
                                  actions: [
                                    FlatButton(
                                        child: Text("Okay"),
                                        onPressed: () =>
                                            Navigator.of(innerContext).pop())
                                  ],
                                ),
                              );
                            }).then((_) {
                              setState(() {
                                _isLoading = false;
                              });
                              Navigator.pop(context);
                            });
                          }
                        }),
                  ),
                ],
              ),
            ),
    );
  }
}
