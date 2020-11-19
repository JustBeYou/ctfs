from skyfield.api import EarthSatellite, load, Topos
import time, math

line1 = "1 37348U 11002A   20053.50800700  .00010600  00000-0  95354-4 0    09"
line2 = "2 37348  97.9000 166.7120 0540467 271.5258 235.8003 14.76330431    04"

satellite = EarthSatellite (line1, line2, 'SAT')
t = load.timescale ().utc (2020, 4, 22, 0, 0, 0)
subpoint = satellite.at (t).subpoint ()

print('Latitude:', subpoint.latitude)
print('Longitude:', subpoint.longitude)
