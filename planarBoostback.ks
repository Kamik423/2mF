PARAMETER landingpad.
PARAMETER overshoot.

LOCK impact TO -landingpad:POSITION.

SET k TO 9.

UNTIL (VANG(VXCL(SHIP:UP:FOREVECTOR, landingpad:POSITION), VXCL(SHIP:UP:FOREVECTOR, impact)) < 45) AND (VXCL(SHIP:UP:FOREVECTOR, impact):MAG - overshoot > VXCL(SHIP:UP:FOREVECTOR, landingpad:POSITION):MAG){ //Less than 45º off of the launchpad to ensure right direction, and distance to impact > distance to launchpad
    LOCK STEERING TO VXCL(SHIP:UP:FOREVECTOR, landingpad:POSITION):NORMALIZED * 2 - SHIP:VELOCITY:SURFACE:NORMALIZED.
    LOCK THROTTLE TO 1.
    SET ps TO V(0,0,0).
    SET vs TO SHIP:VELOCITY:SURFACE.
    SET as TO V(0,0,0).
    SET t TO 0.
    UNTIL ps:Z < -ALT:RADAR {
        SET t TO t + 1.
        SET as TO (- as:NORMALIZED * (as:MAG ^ 2 * k * (0.99997 ^ ALT:RADAR)) / (SHIP:MASS * 1000)) - SHIP:UP:FOREVECTOR:NORMALIZED * 9.81.
        SET vs TO VS + as.
        SET ps TO ps + vs.
    }
    SET impact TO ps.
}
LOCK THROTTLE TO 0.
LOCK STEERING TO RETROGRADE.
