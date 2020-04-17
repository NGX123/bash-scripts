import pyowm
import sys
from colorama import init, Fore, Back, Style

#Variables
owm = pyowm.OWM('627820e1bc90cd5639633e844e294cc4', language = "eng")
information = ''

def weather_input():
    global extra  
    print("\nIndicate a city \nTo quit enter 'quit' \nTo see more information add a at after the city name\nFor example London, UK : ")
    place = input("")
    place = place.split(' ')

    if place[0] == 'quit':
        sys.exit()

    return place

    
    
    
def get_weather(inpt):
    advanced = False

    place = inpt[0]

    if len(inpt) >= 2:
        if inpt[1] == 'a':
            advanced = True


    #Weather Data
    observation = owm.weather_at_place(place)
    weather = observation.get_weather()
    
    #Weather
    temp = weather.get_temperature('celsius')["temp"]
    detailed = weather.get_detailed_status() 

    #Advanced
    date = observation.get_reception_time(timeformat='iso')
    cloud_coverege = weather.get_clouds()
    rain_volume = weather.get_rain()
    snow_volume = weather.get_snow()
    wind_speed = weather.get_wind()['speed']
    pressure = weather.get_pressure()['press']

    #Output
    if advanced == True:
        print('''
Advanced
Date {}
Cloud_coverege {}
Rain {}
Snow {}
Wind speed {}
Pressure {}
        '''.format(date, cloud_coverege, rain_volume, snow_volume, wind_speed, pressure))

    print("In {} there is {}".format(place, detailed))
    print("Temperature is {}°C".format(round(temp)))


def weather_phrases(temp):
    if temp < 0:
        print("It's freezing, gad a full set of winter clothes")
    elif temp < 10:
        print("Oh water nearly freezed")
    elif temp < 20:
        print("Pretty cold, wear something warm")
    elif temp < 30:
        print("Temp is good, you can go walk outside")
    elif temp > 30:
        print("Oh it so hot!!!!!")


while True:
    try :
        print(Fore.BLUE) 
        inpt = weather_input()

        print(Fore.YELLOW)
        get_weather(inpt)
    except:
        print("Try again")
    #weather_phrases()



    





    
