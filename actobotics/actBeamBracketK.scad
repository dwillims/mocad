include <../mo/mo.scad>

BeamHoleDistance = 1.54 * in / 4;
BeamDepth = 0.125 * in;

positions = [
  [ [ 0, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BeamDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ BeamHoleDistance, 0, 0 ], [ 0, 0, 1 ], 0 ],
  [ [ BeamHoleDistance, BeamDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ BeamHoleDistance, 0, -BeamHoleDistance ], [ 0, 0, 1 ], 0 ],
  [ [ BeamHoleDistance, BeamDepth, -BeamHoleDistance ], [ 0, 0, 1 ], 180 ],

  [ [ 0, 0, -BeamHoleDistance,  ], [ 0, 0, 1 ], 0 ],
  [ [ 0, BeamDepth, -BeamHoleDistance ], [ 0, 0, 1 ], 180 ],

  [ [ -BeamHoleDistance, 0, -BeamHoleDistance ], [ 0, 0, 1 ], 0 ],
  [ [ -BeamHoleDistance, BeamDepth, -BeamHoleDistance ], [ 0, 0, 1 ], 180 ],

  [ [ -BeamHoleDistance, 0, 0], [ 0, 0, 1 ], 0 ],
  [ [ -BeamHoleDistance, BeamDepth, 0 ], [ 0, 0, 1 ], 180 ],

  [ [ -BeamHoleDistance, 0, BeamHoleDistance], [ 0, 0, 1 ], 0 ],
  [ [ -BeamHoleDistance, BeamDepth, BeamHoleDistance ], [ 0, 0, 1 ], 180 ],

  [ [ 0, 0, BeamHoleDistance], [ 0, 0, 1 ], 0 ],
  [ [ 0, BeamDepth, BeamHoleDistance ], [ 0, 0, 1 ], 180 ],

  [ [ BeamHoleDistance, 0, BeamHoleDistance], [ 0, 0, 1 ], 0 ],
  [ [ BeamHoleDistance, BeamDepth, BeamHoleDistance ], [ 0, 0, 1 ], 180 ],
];

module actBeamBracketK( p = 0, info = false ) {
  moPresent( positions, p, info )
    color( BlackDelrin )
      import("./stl/actobotics_beam_bracket_k.stl");
}

function actBeamBracketKPosition( p = 0 ) = positions[ p ];

moMoveOriginTo( actBeamBracketKPosition( 3 ) )
  actBeamBracketK( 0, info = true );
