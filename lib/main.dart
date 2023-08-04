import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'Apark.dart';
import 'Bpark.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget{
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late GoogleMapController mapController; //contrller for Google map
  final Set<Marker> markers = new Set(); //markers for google map
  static const LatLng showLocation = const LatLng(9.9252, 78.1198); //location to show in map
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: AppBar( 
             title: Text("Multiple Markers in Google Map"),
             backgroundColor: Colors.deepOrangeAccent,
          ),
          body: GoogleMap( //Map widget from google_maps_flutter package
                    zoomGesturesEnabled: true, //enable Zoom in, out on map
                    initialCameraPosition: CameraPosition( //innital position in map
                      target: showLocation, //initial position
                      zoom: 15.0, //initial zoom level
                    ),
                    markers: getmarkers(), //markers to show on map
                    mapType: MapType.normal,
                    onTap: (LatLng latLng){
                      if(latLng==LatLng(9.9252, 78.1198)){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>park1()));
                      }
                      else if(latLng==LatLng(9.9195, 78.1193)){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>park2()));
                      }
                    },
                     //map type
                    onMapCreated: (controller) { //method called when map is created
                      setState(() {
                        mapController = controller; 
                      });
                    },
                  ),
       );
  }

  Set<Marker> getmarkers() { //markers to place on map
    setState(() {
      markers.add(Marker( //add first marker
        markerId: MarkerId(showLocation.toString()),
        position: showLocation, //position of marker
        infoWindow: InfoWindow( //popup info 
          title: 'A Park ',
          snippet: 'Bike Park: 20 per hr \n Car Park:30 per hr',
          
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>park1())),
        ),
        
        icon: BitmapDescriptor.defaultMarker, 
        onTap:  () => Navigator.push(context, MaterialPageRoute(builder: (context)=>park1())),
        
        //Icon for Marker
      ));

      markers.add(Marker( //add second marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(9.9195, 78.1193),
         //position of marker
        infoWindow: InfoWindow( //popup info 
          title: 'B Park ',
          snippet: 'Bike Park: 20 per hr \n Car Park:30 per hr',
         onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>park2())),
        ),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>park2())),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker( //add third marker
        markerId: MarkerId(showLocation.toString()),
        position: LatLng(9.9151, 78.1237), //position of marker
        infoWindow: InfoWindow( //popup info 
          title: 'C park ',
          snippet: ,
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

       //add more markers here 
    });

    return markers;
  }
}