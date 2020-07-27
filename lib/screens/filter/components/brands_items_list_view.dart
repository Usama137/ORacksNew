import 'package:advika/models/brand.dart';
import 'package:flutter/material.dart';

import 'brands_item.dart';

class BrandsItemsListView extends StatefulWidget {
  const BrandsItemsListView({
    Key key,
  }) : super(key: key);

  @override
  _BrandsItemsListViewState createState() => _BrandsItemsListViewState();
}

class _BrandsItemsListViewState extends State<BrandsItemsListView> {
  List<Brand> brands;

  @override
  void initState() {
    super.initState();
    brands = [
      Brand(brandId: 1, brandName: "ZARA", active: true),
      Brand(brandId: 2, brandName: "NIKE"),
      Brand(brandId: 3, brandName: "BATA"),
      Brand(brandId: 4, brandName: "REEBOK"),
      Brand(brandId: 5, brandName: "ADIDAS"),
      Brand(brandId: 6, brandName: "ARROW")
    ];
  }

  updateBrands(int brandId) {
    setState(() {
      brands.forEach((e) {
        if (e.brandId == brandId) {
          e.active = !e.active;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        primary: false,
        itemCount: brands.length,
        itemBuilder: (BuildContext context, int prIndex) {
          Brand brand = brands[prIndex];
          //dropdownValue =
          return BrandsItemComponent(brand: brand, updateBrands: updateBrands);
        });
  }
}
