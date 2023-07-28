import 'package:flutter/material.dart';
import '../models/country_model.dart';
import '../services/country_service.dart';
import '../services/state_service.dart';

class CountryState extends StatefulWidget {
  @override
  _CountryStateState createState() => _CountryStateState();
}

class _CountryStateState extends State<CountryState> {
  List<Datum> _countriesData = [];
  String? _selectedCountry;
  List<String> _states = [];
  String? _selectedState;

  @override
  void initState() {
    super.initState();
    getAllCountries().then((countries) {
      setState(() {
        _countriesData = countries;
        _selectedCountry = null;
        _states = [];
        _selectedState = null;
      });
    }).catchError((error) {
      print('Error getting countries: $error');
    });
  }

  Future<void> _onCountryChanged(String? newValue) async {
    setState(() {
      _selectedCountry = newValue;
      _selectedState = null;
      _states = [];
    });

    if (newValue != null) {
      final states = await getStateByCountryId(getIdByName(newValue));
      setState(() {
        _states = states;
      });
    }
  }

  String getIdByName(String name) {
    for (var country in _countriesData) {
      if (country.countryName == name) {
        return country.idCountry;
      }
    }
    return "";
  }

  Widget buildDropdownButton(
      String? value, List<String> items, Function(String?) onChanged) {
    return DropdownButton<String>(
      value: value,
      items: [
        DropdownMenuItem<String>(
          value: null,
          child:
              Text('Select ${value == _selectedCountry ? "country" : "state"}'),
        ),
        ...items.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
      ],
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Country and State')),
      body: Center(
        child: Column(
          children: [
            buildDropdownButton(
                _selectedCountry,
                _countriesData.map((e) => e.countryName).toList(),
                _onCountryChanged),
            buildDropdownButton(_selectedState, _states, (newValue) {
              setState(() {
                _selectedState = newValue;
              });
            }),
          ],
        ),
      ),
    );
  }
}
