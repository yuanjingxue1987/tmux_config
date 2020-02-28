# vim:fileencoding=utf-8:noet
from __future__ import (unicode_literals, division, absolute_import, print_function)

import os
import json
import time
from powerline.lib.url import urllib_read, urllib_urlencode
from powerline.lib.threaded import KwThreadedSegment
from powerline.segments import with_docstring
from datetime import datetime

PATH_CONFIG = os.path.expanduser('~/.tmux.weather.cache')
INTERVAL_CONFIG = 1800

weather_conditions_mapping = {
        'tornado': 'stormy',
        'tropical_storm': 'stormy',
        'hurricane': 'stormy',
        'severe_thunderstorms': 'stormy',
        'thunderstorms': 'stormy',
        'mixed_rain_and_snow': 'rainy',
        'mixed_rain_and_sleet': 'rainy',
        'mixed_snow_and_sleet': 'snowy',
        'freezing_drizzle': 'rainy',
        'drizzle': 'rainy',
        'freezing_rain': 'rainy',
        'showers': 'rainy',
        'snow_flurries': 'snowy',
        'light_snow_showers': 'snowy',
        'blowing_snow': 'snowy',
        'snow': 'snowy',
        'hail': 'snowy',
        'sleet': 'snowy',
        'dust': 'foggy',
        'fog': 'foggy',
        'haze': 'foggy',
        'smoky': 'foggy',
        'blustery': 'windy',
        'cold': 'day',
        'clouds': 'cloudy',
        'mostly_sunny': 'mostly_sunny',
        'mostly_cloudy': 'cloudy',
        'partly_cloudy': 'cloudy',
        'mostly_clear': 'clear',
        'sun': 'sunny',
        'fair_night': 'night',
        'fair_day': 'day',
        'mixed_rain_and_hail': 'rainy',
        'hot': 'sunny',
        'isolated_thunderstorms': 'stormy',
        'scattered_thunderstorms': 'stormy',
        'scattered_showers': 'rainy',
        'heavy_snow': 'snowy',
        'scattered_snow_showers': 'snowy',
        'partly_cloudy': 'cloudy',
        'thundershowers': 'rainy',
        'snow_showers': 'snowy',
        'isolated_thundershowers': 'rainy',
}
# ('day',    (25, 34)),
# ('rainy',  (5, 6, 8, 9, 10, 11, 12, 35, 40, 45, 47)),
# ('cloudy', (26, 27, 28, 29, 30, 44)),
# ('snowy',  (7, 13, 14, 15, 16, 17, 18, 41, 42, 43, 46)),
# ('stormy', (0, 1, 2, 3, 4, 37, 38, 39)),
# ('foggy',  (19, 20, 21, 22, 23)),
# ('sunny',  (32, 36)),
# ('night',  (31, 33))):
weather_conditions_icons = {
    'day': {
        'rainy': '',
        'cloudy': '',
        'snowy': '',
        'stormy': '',
        'foggy': '',
        'sunny': '',
        'windy': '',
        'mostly_sunny': '',
        'not_available': 'NA',
        'unknown': 'UKN'
    },
    'night': {
        'rainy': '',
        'cloudy': '',
        'snowy': '',
        'stormy': '',
        'foggy': '',
        'clear': '',
        'windy': '',
        'not_available': 'NA',
        'unknown': 'UKN'
    },
}

temp_conversions = {
        'C': lambda temp: temp,
        'F': lambda temp: (temp * 9 / 5) + 32,
        'K': lambda temp: temp + 273.15,
}

# Note: there are also unicode characters for units: ℃, ℉ and  K
temp_units = {
        'C': '°C',
        'F': '°F',
        'K': 'K',
}

def check_day_or_night (time_sunrise, time_sunset):
    t_sunrise = time.strptime(time_sunrise, '%I:%M %p')
    t_sunset = time.strptime(time_sunset, '%I:%M %p')
    h_sunrise = t_sunrise.tm_hour
    m_sunrise = t_sunrise.tm_min
    h_sunset = t_sunset.tm_hour
    m_sunset = t_sunset.tm_min
    t_now = datetime.now()
    h_now = t_now.hour
    m_now = t_now.minute
    if(
        (h_now * 60 + m_now > h_sunrise * 60 + m_sunrise) and
        (h_now * 60 + m_now < h_sunset * 60 + m_sunset)
    ):
        return 'day'
    else:
        return 'night'

def weather(
    pl, 
    city='bellevue',
    state='wa'
):
    if(
        os.path.exists(PATH_CONFIG) and
        time.time() - os.path.getmtime(PATH_CONFIG) < 1800
    ):
        with open(PATH_CONFIG, 'r') as r:
            contents = r.read()
    else:
        location_data = json.loads(urllib_read('https://vocabulary-master-1987.appspot.com/weather/' + city + '/' + state))
        weather_condition = location_data['current_observation']['condition']
        weather_astronomy = location_data['current_observation']['astronomy']
        day_or_night = check_day_or_night(weather_astronomy['sunrise'], weather_astronomy['sunset'])
        weather_location = location_data['location']
        condition = weather_condition['text'].lower().replace(' ', '_')
        if condition in weather_conditions_mapping:
            condition = weather_conditions_mapping[condition]
        contents = weather_conditions_icons[day_or_night][condition] + ' ' + str(weather_condition['temperature']) + '°F ' \
        + weather_location['city'] + '/' \
        + weather_location['region'].replace(' ', '') + " "
        with open(PATH_CONFIG, 'w') as w:
            w.write(contents)
    return [{
            'contents': contents,
            'highlight_groups': ['weather'],
            'divider_highlight_group': None
    }]
