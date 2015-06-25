include <../mo/mo.scad>

module moHExtrusion( spec, p = 0, info = false ) {
  color( Yellow ) {
    moPitch( 3 ) {
      linear_extrude( height = spec[ 0 ] ) {   
        polygon( [ [ -spec[1]/2, -spec[3]/2 ], [ -spec[1]/2, -spec[2]/2 ], [ -spec[1]/2+spec[3], -spec[2]/2 ], [ -spec[1]/2+spec[3], -spec[3]/2 ], [ spec[1]/2-spec[3], -spec[3]/2 ], [ spec[1]/2-spec[3], -spec[2]/2 ],
                   [ spec[1]/2, -spec[2]/2 ],
                   [ spec[1]/2, -spec[3]/2 ], [ spec[1]/2,spec[2]/2 ], [ spec[1]/2-spec[3],spec[2]/2 ], [ spec[1]/2-spec[3],spec[3]/2 ], 
                   [ -spec[1]/2+spec[3],spec[3]/2 ], [ -spec[1]/2+spec[3],spec[2]/2 ], [-spec[1]/2,spec[2]/2 ] ] );       
      }
    }
  }
  
  if ( info ) {
    moPartOrigin();
    //echo( "SPEC:", spec );
    for ( i = [ 0 : 1 ] )
      moMoveTo( moHExtrusionPosition( i, spec ) )
        moPosition( i );
  }
  if ( $name )
    moPartLabel( parent_module( 1 ) );

}

function moHExtrusionPosition( p = 0, spec ) =
  ( p == 0 ) ?  [ [0, 0, 0], [0,0,1],0 ] : [ [0, spec[ 0 ], 0], [ 0,0,1],180 ];

demoSpec = [ 5 * in, 1 * in, 0.5 * in, 0.06 * in ];

moMoveOriginTo( moHExtrusionPosition( 0, demoSpec ) )
  moHExtrusion( demoSpec, 0, info = true, $name=true );

echo( moHExtrusionPosition( 0, demoSpec ) );
echo( moHExtrusionPosition( 1, demoSpec ) );

