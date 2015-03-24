include <../mo/mo.scad>

gearOffset = 0.2835 * in;
gearDepth = 0.40*in;
gearMateDepth = 0.658*in;
gearMateDistance = gearMateDepth - gearDepth;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, gearDepth, 0 ], [ 0, 0, 1 ], 180 ],
  [ [ gearMateDistance, gearMateDepth, 0 ], [ 0, 0, 1 ], 90 ],
  [ [ -gearMateDistance, gearMateDepth, 0 ], [ 0, 0, 1 ], -90 ],
  [ [ 0, gearMateDepth, gearMateDistance ], [ 1, 0, 0 ], -90 ],
  [ [ 0, gearMateDepth, -gearMateDistance ], [ 1, 0, 0 ], 90 ],
];

module actBevelGear32Pitch32Tooth0_25( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( Brass )
      translate( [ 0, gearOffset, 0 ] )
        import("./stl/actobotics_32_pitch_32_tooth_bevel_gear_1_4.stl");
}

function actBevelGear32Pitch32Tooth0_25Position( p = 0 ) = positions[ p ];

moMoveOriginTo( actBevelGear32Pitch32Tooth0_25Position( 1 ) )
  actBevelGear32Pitch32Tooth0_25( 0, info = true, $name = true );



