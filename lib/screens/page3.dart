

import 'package:flutter/material.dart';
import 'package:hotel_booking_app/screens/check_rooms.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  var _rangeSliderCount = const RangeValues(0, 3000);
  bool _checkboxboolean1 = false;
  bool _checkboxboolean2 = false;
  bool _checkboxboolean3 = false;
  int _userRatingID = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Column(
        children: [
          _rangeSliderContainer(),
          const SizedBox(height: 20.0),
          _checkListTile(),
          _userRatings(),
          _otherFacilities(),
          Divider(
            color: Colors.grey[300],
            thickness: 10.0,
          ),
          _applyButton(),
        ],
      ),
    );
  }

  AppBar _appbar() => AppBar(
        backgroundColor: Colors.white,
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text(
          "Filter",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {});
              _rangeSliderCount = const RangeValues(0, 3000);
              _checkboxboolean1 = false;
              _checkboxboolean2 = false;
              _checkboxboolean3 = false;
              _userRatingID = 4;
            },
            child: const Text(
              "CLEAR",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      );

  Text _betweenPrice() => Text(
        "${_rangeSliderCount.start.toStringAsFixed(1)}" +
            "\t-\t" +
            "${_rangeSliderCount.end.toStringAsFixed(1)}" +
            "\t\$" +
            "\tPrice",
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w800,
        ),
      );

  Container _rangeSliderContainer() => Container(
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            _betweenPrice(),
            _rangeSlider(),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[300],
                    fixedSize: const Size(
                      160.0,
                      40.0,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _rangeSliderCount =
                          RangeValues(1000, _rangeSliderCount.end);
                    });
                  },
                  child: const Text(
                    "\$1000",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[300],
                    fixedSize: const Size(
                      160.0,
                      40.0,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _rangeSliderCount =
                          RangeValues(_rangeSliderCount.start, 2000);
                    });
                  },
                  child: const Text(
                    "\$2000",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  RangeSlider _rangeSlider() => RangeSlider(
        values: _rangeSliderCount,
        max: 3000,
        min: 0,
        activeColor: Colors.orange[900],
        inactiveColor: Colors.grey[300],
        onChanged: (v) {
          _rangeSliderCount = v;
          setState(() {});
        },
        labels: RangeLabels(
          "${_rangeSliderCount.start}",
          "${_rangeSliderCount.end}",
        ),
      );

  Column _checkListTile() => Column(
        children: [
          Divider(
            color: Colors.grey[300],
            thickness: 10.0,
          ),
          CheckboxListTile(
            value: _checkboxboolean1,
            title: const Text("Free Break Fast"),
            activeColor: Colors.transparent,
            tristate: true,
            checkColor: Colors.green,
            onChanged: (v) {
              setState(() {});
              _checkboxboolean1 = !_checkboxboolean1;
            },
          ),
          Divider(
            color: Colors.grey[300],
            thickness: 2.0,
          ),
          CheckboxListTile(
            value: _checkboxboolean2,
            title: const Text("Free Wifi"),
            activeColor: Colors.transparent,
            tristate: true,
            checkColor: Colors.green,
            onChanged: (v) {
              setState(() {});
              _checkboxboolean2 = !_checkboxboolean2;
            },
          ),
          Divider(
            color: Colors.grey[300],
            thickness: 10.0,
          ),
          CheckboxListTile(
            value: _checkboxboolean3,
            title: const Text("Sunrise check-in"),
            activeColor: Colors.transparent,
            tristate: true,
            checkColor: Colors.green,
            onChanged: (v) {
              setState(() {});
              _checkboxboolean3 = !_checkboxboolean3;
            },
          ),
          Divider(
            color: Colors.grey[300],
            thickness: 10.0,
          ),
        ],
      );

  Column _userRatings() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "USER RATINGS",
              style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey[500],
                  fontWeight: FontWeight.w600),
            ),
          ),
          Row(
            children: [
              const SizedBox(width: 20.0),
              ElevatedButton(
                onPressed: () {
                  setState(
                    () {
                      _userRatingID = 1;
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary:
                      _userRatingID == 1 ? Colors.orange[900] : Colors.white,
                  side: BorderSide(
                    color:
                        _userRatingID == 1 ? Colors.transparent : Colors.grey,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color:
                          _userRatingID == 1 ? Colors.white : Colors.grey[300],
                    ),
                    Text(
                      "3",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: _userRatingID == 1
                            ? Colors.white
                            : Colors.grey[500],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 30.0),
              ElevatedButton(
                onPressed: () {
                  setState(
                    () {
                      _userRatingID = 2;
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary:
                      _userRatingID == 2 ? Colors.orange[900] : Colors.white,
                  side: BorderSide(
                    color:
                        _userRatingID == 2 ? Colors.transparent : Colors.grey,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color:
                          _userRatingID == 2 ? Colors.white : Colors.grey[300],
                    ),
                    Text(
                      "4",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: _userRatingID == 2
                            ? Colors.white
                            : Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 30.0),
              ElevatedButton(
                onPressed: () {
                  setState(
                    () {
                      _userRatingID = 3;
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary:
                      _userRatingID == 3 ? Colors.orange[900] : Colors.white,
                  side: BorderSide(
                    color:
                        _userRatingID == 3 ? Colors.transparent : Colors.grey,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color:
                          _userRatingID == 3 ? Colors.white : Colors.grey[300],
                    ),
                    Text(
                      "5",
                      style: TextStyle(
                        fontSize: 18.0,
                        color: _userRatingID == 3
                            ? Colors.white
                            : Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Divider(
            color: Colors.grey[300],
            thickness: 10.0,
          ),
        ],
      );

  ListTile _otherFacilities() => const ListTile(
        title: Text(
          "Other Facilities",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          "Parking, Pool, Bar",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey,
        ),
      );

  Padding _applyButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 50.0,
        vertical: 20.0,
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CheckRooms(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          primary: Colors.orange[900],
          fixedSize: const Size(
            220.0,
            60.0,
          ),
        ),
        child: const Text(
          "APPLY",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
