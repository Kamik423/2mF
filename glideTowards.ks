PARAMETER landingpad.

LOCK STEERING TO - ( landingpad:POSITION * 2 - impactPoint(6)). 

FUNCTION impactPoint {
    DECLARE PARAMETER k.
    DECLARE PARAMETER dv IS V(0,0,0).

    SET ps TO V(0,0,0).
    SET vs TO SHIP:VELOCITY:SURFACE + dV.
    SET as TO V(0,0,0).
    SET t TO 0.
    UNTIL ps:Z < -ALT:RADAR {
        SET t TO t + 1.
        SET as TO (- as:NORMALIZED * (as:MAG ^ 2 * k * (0.99997 ^ ALT:RADAR)) / (SHIP:MASS * 1000)) - SHIP:UP:FOREVECTOR:NORMALIZED * 9.81.
        SET vs TO VS + as.
        SET ps TO ps + vs.
    }
    RETURN ps.
}

