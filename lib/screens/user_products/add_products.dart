import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:a1_1_20/models/product.dart';
import '/provider/product_provider.dart';
import 'package:image_picker/image_picker.dart';

class AddUserProduct extends StatefulWidget {
  const AddUserProduct({Key? key}) : super(key: key);

  @override
  State<AddUserProduct> createState() => _AddUserProductState();
}

class _AddUserProductState extends State<AddUserProduct> {
  final TextEditingController _productName = TextEditingController();
  final TextEditingController _productPrice = TextEditingController();
  final TextEditingController _productDescription = TextEditingController();
  final TextEditingController _productImage = TextEditingController();
  final _form = GlobalKey<FormState>();

  @override
  void dispose() {
    _productName.dispose();
    _productPrice.dispose();
    _productDescription.dispose();
    _productImage.dispose();
    super.dispose();
  }

  void _submitForm() {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    final addNewProduct = Provider.of<ProductProvider>(context, listen: false);
    final newProductModel = Product(
      id: DateTime.now().toString(),
      productName: _productName.text,
      price: double.parse(_productPrice.text),
      imageUrl: _productImage.text,
    );

    addNewProduct.add(newProductModel);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          "Produk berhasil di tambahkan",
          style: TextStyle(fontSize: 16),
        ),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 1),
      ),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tambahkan produk baru",
          style: TextStyle(fontSize: 22),
        ),
        actions: [
          TextButton(
            onPressed: () {
              _submitForm();
            },
            child: const Icon(
              Icons.save,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: _screenSize.width * 0.03,
          right: _screenSize.width * 0.03,
        ),
        child: Form(
          key: _form,
          child: ListView(
            children: [
              SizedBox(
                height: _screenSize.height * 0.05,
              ),
              TextFormField(
                controller: _productName,
                decoration: const InputDecoration(
                  labelText: "Nama Produk",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigo),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                textInputAction: TextInputAction.next,
                validator: (inputValue) {
                  if (inputValue == "") {
                    return "Tolong isi nama produk.";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: _screenSize.height * 0.04,
              ),
              TextFormField(
                controller: _productPrice,
                decoration: const InputDecoration(
                  labelText: "Harga",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigo),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                textInputAction: TextInputAction.next,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                validator: (inputValue) {
                  if (inputValue == "") {
                    return "Harga Produk kosong.";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: _screenSize.height * 0.04,
              ),
              TextFormField(
                controller: _productDescription,
                decoration: const InputDecoration(
                  labelText: "Deskripsi",
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigo),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                maxLines: 4,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.multiline,
                validator: (inputValue) {
                  if (inputValue == "") {
                    return "Deskripsi produk kosong.";
                  }
                  if (inputValue!.length < 15) {
                    return "Deskripsi produk harus lebih dari 15 huruf.";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(
                height: _screenSize.height * 0.04,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: _screenSize.height * 0.13,
                    width: _screenSize.width * 0.2,
                    child: _productImage.text.isEmpty
                        ? const Center(
                            child: Text(
                              "Menunggu URL Gambar",
                              textAlign: TextAlign.center,
                            ),
                          )
                        : Image.network(
                            _productImage.text,
                            fit: BoxFit.contain,
                          ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                          color: Colors.indigo, style: BorderStyle.solid),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: _productImage,
                      decoration: const InputDecoration(
                        label: Text("Masukkan URL Gambar dari internet"),
                      ),
                      textInputAction: TextInputAction.done,
                      validator: (inputValue) {
                        if (inputValue == "") {
                          return "Image Url is empty.";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
