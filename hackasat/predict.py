from skyfield.api import EarthSatellite, load, Topos, utc
from datetime import datetime, timedelta
import time

line1 = '1 37348U 11002A   20053.50800700  .00010600  00000-0  95354-4 0    09'
line2 = '2 37348  97.9000 166.7120 0540467 271.5258 235.8003 14.76330431    04'

ts = load.timescale()
ts.tai(2020, 4, 22, 0, 0, 0)

satellite = EarthSatellite (line1, line2, 'SAT', ts)

time_fmt = '%Y-%m-%dT%H:%M:%SZ'
initial_ts = datetime.strptime('2020-04-22T00:00:00Z', time_fmt)

for off in range(600):
	dt = initial_ts	+ timedelta(minutes=off)
	dt = dt.replace(tzinfo=utc)
	t = ts.utc(dt)

	#tm = time.mktime((origin + timedelta(minutes=off)).timetuple())
	#ts = load.timescale().utc (tm.tm_year, tm.tm_mon, tm.tm_mday, tm.tm_hour, tm.tm_min, tm.tm_sec + stuff)

	geocentric = satellite.at(t)
	print(geocentric.subpoint())
