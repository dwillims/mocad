include <../mo/mo.scad>

MiniChannelHoleDistance = 1.54 * in / 4;
MiniChannelWidth = 0.37 * in;
MiniChannelWidth_2 = MiniChannelWidth/2;
MiniChannelThickness = 0.12 * in / 2;
MiniChannelMountDistance = 0.3975 * in;

MiniChannelOffsetY = -0.375 * in / 2;
MiniChannelOffsetZ = -MiniChannelThickness;

HolesPerSet = 3;
HoleSets = 9;

module actMiniChannel3_08( sp, info = false ) {

  moMoveOriginTo( actMiniChannel3_08Position( sp ) )
  {
    color( Aluminum )
      rotate( [ 90, 0, 0 ] )
        translate( [ 0, MiniChannelOffsetY, MiniChannelOffsetZ ] )
          import("./stl/actobotics_mini_channel_3.08.stl");

    if ( info == true ) {
      for ( si = [ 0 : HoleSets - 1 ] ) {
        for ( hi = [ 0 : HolesPerSet - 1 ] ) {
          moMoveTo( actMiniChannel3_08Position( [ si, hi ]) ) {
            moPosition2( [ si, hi ] );
          }
        }
      }
    }
  }
  if ( info == true )
    moPartOrigin();
  if ( $name == true )
    moPartLabel( parent_module(1) );
}

function actMiniChannel3_08Position( sp ) = [ 
  [ ( sp[ 1 ] == 0 ) ? 0 : ( ( ( sp[ 1 ] == 1 ) ? 1 : -1 ) * MiniChannelWidth / 2) , 
    ( sp[ 1 ] == 0 ) ? 0 : MiniChannelMountDistance, 
    sp[0] * MiniChannelHoleDistance ], 
  [ 0, 0, 1 ], 
  ( sp[ 1 ] == 0 ) ? 0 : ( sp[ 1 ] == 1 ) ? 90 : -90 ];

moMoveOriginTo( actMiniChannel3_08Position( [ 0, 0 ] ) )
  actMiniChannel3_08( [0,0], info = true, $name = true );

