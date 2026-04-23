** start of main.py **

distance_mi = 5
is_raining = True
has_bike = True
has_car = False
has_ride_share_app = True

if not distance_mi:
    print(False)

elif distance_mi <= 1:
    if is_raining is False:
        print(True)
    else:
        print(False)

elif distance_mi > 1 and distance_mi <= 6:
    if has_bike and is_raining is False:
        print(True)
    else:
        print(False)

elif distance_mi > 6:
    if has_car or has_ride_share_app:
        print(True)
    else:
        print(False)        




** end of main.py **

