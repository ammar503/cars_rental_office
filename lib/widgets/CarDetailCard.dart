import '../models/CarInfo.dart';
import 'package:cars_rental_office/screens/ViewCarDetails.dart';
import 'package:cars_rental_office/utils/utils.dart';
import 'package:flutter/material.dart';

class CarDetailCard extends StatefulWidget {
  const CarDetailCard({
    Key key,
    @required this.carsDetail,
    @required this.index,
  }) : super(key: key);

  final List<CarInfo> carsDetail;
  final int index;

  @override
  _CarDetailCardState createState() => _CarDetailCardState();
}

class _CarDetailCardState extends State<CarDetailCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ViewCarDetails(
              carInfo: widget.carsDetail[widget.index],
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 11),
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: 160,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                color: Colors.black26,
                offset: Offset(0.7, 0.7),
                spreadRadius: 1.3)
          ],
          color: Color(0xffecf0f1),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 110,
              height: 110,
              margin: EdgeInsets.only(
                left: 5,
                top: 5,
                right: 15,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      '${widget.carsDetail[widget.index].urlImage}'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${widget.carsDetail[widget.index].dateOfFactor}'),
                        Icon(Icons.favorite_outline),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      '${widget.carsDetail[widget.index].carModel} ${widget.carsDetail[widget.index].carType}',
                      style: pageTitle,
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          '${widget.carsDetail[widget.index].carColor}',
                          style: smallText,
                        ),
                        Text(
                          '${widget.carsDetail[widget.index].pricePerDay}JD',
                          style: smallText,
                        ),
                        Text(
                          'available',
                          style: smallText,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
