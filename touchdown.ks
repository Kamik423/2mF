PARAMETER landingpad.
PARAMETER throttleMultiplier.

IF NOT BRAKES { TOGGLE BRAKES. }
LOCK twr TO SHIP:MASS * 9.81 / SHIP:MAXTHRUST.
LOCK vTarget_vertical TO (SHIP:ALTITUDE - landingpad:TERRAINHEIGHT) / 5 - 1.
LOCK vTarget_horizontal TO landingpad:ALTITUDEPOSITION(SHIP:ALTITUDE):MAG / 8.
LOCK steeringVector TO landingpad:ALTITUDEPOSITION(SHIP:ALTITUDE):NORMALIZED * vTarget_horizontal - VECTOREXCLUDE(SHIP:UP:FOREVECTOR, SHIP:VELOCITY:SURFACE).
LOCK STEERING TO LOOKDIRUP( steeringVector + SHIP:UP:FOREVECTOR:NORMALIZED * 20, HEADING(90,0):FOREVECTOR).
LOCK THROTTLE TO - throttleMultiplier * twr * SHIP:VERTICALSPEED / vTarget_vertical.
WAIT UNTIL ALT:RADAR < 35.
IF NOT GEAR { TOGGLE GEAR.}
WAIT UNTIL SHIP:VERTICALSPEED > -0.1.
TOGGLE BRAKES.
