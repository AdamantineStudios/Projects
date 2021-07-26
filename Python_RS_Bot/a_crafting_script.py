import cv2 as cv
from random_generator import Random_Generator
from user_interface import User_Interface 
from functions import MS_Gold_Ringer
import time
from pyclick import HumanClicker, HumanCurve
import pyautogui
from a_crafting_logic import Crafting_Logic
from functions import MS_Gold_Ringer

running = True
counter = 0

# Gold rings
# try:    
#     while (True):
#         counter = counter + 1 
#         if (counter == 1):
#             Crafting_Logic.smelt_gold_rings()
#             MS_Gold_Ringer.switch_screen_2()
#             Random_Generator.switch_screen_wait()
#             Crafting_Logic.smelt_gold_rings()
#             MS_Gold_Ringer.switch_screen_1()
#             Random_Generator.switch_screen_wait()
#             # Waiting time for first inventory to finish == 30 - 40 sec
#             #Random_Generator.wait_inventory_2screens()
#         elif(counter == 150):
#             break
#         else:
#             # Were in position where we want to store items and run furnace again on one screen then other and forever loop
#             Crafting_Logic.store_items()
#             Random_Generator.jump_acc()
#             Crafting_Logic.smelt_gold_rings()
#             Random_Generator.jump_acc()
#             MS_Gold_Ringer.switch_screen_2()
#             Random_Generator.switch_screen_wait()
#             Crafting_Logic.store_items()
#             Random_Generator.jump_acc()
#             Crafting_Logic.smelt_gold_rings()
#             Random_Generator.jump_acc()
#             MS_Gold_Ringer.switch_screen_1()
#             Random_Generator.switch_screen_wait()
#             # Wait time to finish inventory and start again
#             #Random_Generator.wait_inventory_2screens()
# except KeyboardInterrupt:
#     pass
time.sleep(2)
try: 
    while (running):
        counter = counter + 1
        if (counter == 1):
            Crafting_Logic.smelt_emerald_necklaces()
            MS_Gold_Ringer.switch_screen_2()
            Random_Generator.switch_screen_wait()
            Crafting_Logic.smelt_emerald_necklaces()
            MS_Gold_Ringer.switch_screen_1()
            Random_Generator.switch_screen_wait()
        elif (counter == 150):
            break
        else:
            Crafting_Logic.store_emeralds()
            Random_Generator.jump_acc()
            Crafting_Logic.smelt_emerald_necklaces()
            Random_Generator.jump_acc()
            MS_Gold_Ringer.switch_screen_2()
            Random_Generator.switch_screen_wait()
            Crafting_Logic.store_emeralds()
            Random_Generator.jump_acc()
            Crafting_Logic.smelt_emerald_necklaces()
            MS_Gold_Ringer.switch_screen_1()
            Random_Generator.switch_screen_wait()
            time.sleep(6)

except KeyboardInterrupt:
    pass