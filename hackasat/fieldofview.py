from skyfield import api
from skyfield.positionlib import ICRF, Geocentric
from skyfield.constants import (AU_M, ERAD, DEG2RAD,
                                IERS_2010_INVERSE_EARTH_FLATTENING, tau)
from skyfield.units import Angle

from numpy import einsum, sqrt, arctan2, pi, cos, sin

def reverse_terra(xyz_au, gast, iterations=3):
    """Convert a geocentric (x,y,z) at time `t` to latitude and longitude.
    Returns a tuple of latitude, longitude, and elevation whose units
    are radians and meters.  Based on Dr. T.S. Kelso's quite helpful
    article "Orbital Coordinate Systems, Part III":
    https://www.celestrak.com/columns/v02n03/
    """
    x, y, z = xyz_au
    R = sqrt(x*x + y*y)

    lon = (arctan2(y, x) - 15 * DEG2RAD * gast - pi) % tau - pi
    lat = arctan2(z, R)

    a = ERAD / AU_M
    f = 1.0 / IERS_2010_INVERSE_EARTH_FLATTENING
    e2 = 2.0*f - f*f
    i = 0
    C = 1.0
    while i < iterations:
        i += 1
        C = 1.0 / sqrt(1.0 - e2 * (sin(lat) ** 2.0))
        lat = arctan2(z + a * C * e2 * sin(lat), R)
    elevation_m = ((R / cos(lat)) - a * C) * AU_M
    earth_R = (a*C)*AU_M
    return lat, lon, elevation_m, earth_R

def subpoint(self, iterations):
    """Return the latitude an longitude directly beneath this position.

    Returns a :class:`~skyfield.toposlib.Topos` whose ``longitude``
    and ``latitude`` are those of the point on the Earth's surface
    directly beneath this position (according to the center of the
    earth), and whose ``elevation`` is the height of this position
    above the Earth's center.
    """
    if self.center != 399:  # TODO: should an __init__() check this?
        raise ValueError("you can only ask for the geographic subpoint"
                            " of a position measured from Earth's center")
    t = self.t
    xyz_au = einsum('ij...,j...->i...', t.M, self.position.au)
    lat, lon, elevation_m, self.earth_R = reverse_terra(xyz_au, t.gast, iterations)

    from skyfield.toposlib import Topos
    return Topos(latitude=Angle(radians=lat),
                    longitude=Angle(radians=lon),
                    elevation_m=elevation_m)

def earth_radius(self):
    return self.earth_R

def satellite_visiable_area(earth_radius, satellite_elevation):
    """Returns the visible area from a satellite in square meters.

    Formula is in the form is 2piR^2h/R+h where:
        R = earth radius
        h = satellite elevation from center of earth
    """
    return ((2 * pi * ( earth_radius ** 2 ) *
            ( earth_radius + satellite_elevation)) /
            (earth_radius + earth_radius + satellite_elevation))


line1 = '1 37348U 11002A   20053.50800700  .00010600  00000-0  95354-4 0    09'
line2 = '2 37348  97.9000 166.7120 0540467 271.5258 235.8003 14.76330431    04'
ts = api.load.timescale()
t = ts.now()
satellite = apiEarthSatellite (line1, line2, 'SAT', ts)


geocentric = satellite.at(t)
geocentric.subpoint = subpoint.__get__(geocentric, Geocentric)
geocentric.earth_radius = earth_radius.__get__(geocentric, Geocentric)

geodetic_sub = geocentric.subpoint(3)

print('Geodetic latitude:', geodetic_sub.latitude)
print('Geodetic longitude:', geodetic_sub.longitude)

geocentric_sub = geocentric.subpoint(0)
print('Geocentric latitude:', geocentric_sub.latitude)
print('Geocentric longitude:', geocentric_sub.longitude)
print('------------------------------------------------')
