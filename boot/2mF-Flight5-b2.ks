WAIT 5.
RUNPATH("0:getScripts").
SET lp TO LATLNG(-0.096753370962939, -74.6200507014086).

WAIT UNTIL AG5.
WAIT 0.05.
IF NOT RCS {TOGGLE RCS.}
LOCK THROTTLE TO 0.
FOR eng IN SHIP:PARTSDUBBED("BE") {
    eng:ACTIVATE().
}
SET SHIP:NAME TO "BB".
LOCK STEERING TO SHIP:VELOCITY:SURFACE.
WAIT 1.
LOCK STEERING TO SHIP:VELOCITY:SURFACE - VESSEL("BA"):POSITION.
WAIT 2.
RUN returnTo(lp, 5.5, 0).
