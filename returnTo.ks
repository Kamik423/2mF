PARAMETER lp.
PARAMETER k.
PARAMETER dh.

RUN boostback(lp, k).
RUN glideTowards(lp).
RUN brake(lp).
RUN glideTowards(lp, 20).
RUN touchdown(lp, dh).
SET SHIP:CONTROL:PILOTMAINTHROTTLE TO 0.
LOCK THROTTLE TO 0.
