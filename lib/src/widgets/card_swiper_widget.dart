import 'package:cine_app/src/models/pelicula_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class CardSwiper extends StatelessWidget {

  final List<Pelicula> peliculas;
  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context, ) {
  
    final _screenSize = MediaQuery.of(context).size;

    return Container(

      padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
        itemWidth: _screenSize.width * 0.7, 
        itemHeight: _screenSize.height*0.5,
        itemBuilder: (BuildContext context,int index){
          peliculas[index].uniqueID= "${peliculas[index].id}-card";
          return Hero(
            tag: peliculas[index].uniqueID,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: GestureDetector(
                child: FadeInImage(
                  placeholder: AssetImage("asset/img/loading.gif"),
                  image: NetworkImage(peliculas[index].getPosterImg()),
                  fit: BoxFit.cover,
                ),
                onTap: (){
                  Navigator.pushNamed(context,"detalle",arguments: peliculas[index]);
                },
              )
            ),
          );
        },
        //pagination:  SwiperPagination(),
        //control:  SwiperControl(),
        itemCount: peliculas.length,
        layout: SwiperLayout.STACK,
      ),
    );
  }
}