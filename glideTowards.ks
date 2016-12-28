PARAMETER landingpad.
DECLARE PARAMETER intensity IS 10.
LOCK STEERING TO - SHIP:VELOCITY:SURFACE:NORMALIZED * landingpad:POSITION:MAG - VXCL(SHIP:VELOCITY:SURFACE, VXCL(SHIP:UP:FOREVECTOR, landingpad:POSITION * 1.42 - impactPoint(5.5)))*intensity. 

FUNCTION impactPoint {
    DECLARE PARAMETER k.
    DECLARE PARAMETER dv IS V(0,0,0).

    SET ps TO V(0,0,0).
    SET vs TO SHIP:VELOCITY:SURFACE + dV.
    SET as TO V(0,0,0).
    SET t TO 0.
    UNTIL ps:Z < -ALT:RADAR {
        SET t TO t + 1.
        SET as TO (- vs:NORMALIZED * (vs:MAG ^ 2 * k * (0.99997 ^ SHIP:ALTITUDE)) / (SHIP:MASS * 1000)) - SHIP:UP:FOREVECTOR:NORMALIZED * 9.81.
        SET vs TO VS + as.
        SET ps TO ps + vs.
    }
    RETURN ps.
}

