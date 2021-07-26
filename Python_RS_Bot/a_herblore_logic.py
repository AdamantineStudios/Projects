from random_generator import Random_Generator
from user_interface import User_Interface 
from functions import MS_Gold_Ringer
import time
from pyclick import HumanClicker, HumanCurve
import pyautogui


class Herblore_Logic:
    # We want to take herbs and vials from bank
    def take_toadflax_ingredients():
        toadflax_banked = MS_Gold_Ringer.find_toadflax()
        MS_Gold_Ringer.execute_spec_item(toadflax_banked)

        vial_of_water = MS_Gold_Ringer.find_vial_of_water()
        MS_Gold_Ringer.execute_take_vial_close_bank(vial_of_water)
        Random_Generator.wait_inventory_herbs()
        # Random_Generator.final_random()
        make_potions = MS_Gold_Ringer.find_toadflax_and_vial_inventory()
        MS_Gold_Ringer.execute_herblore_inventory(make_potions)



    # We want to store all items 

    def store_all_items():
        # Find a bank, open, store all
        edgeville_bank = MS_Gold_Ringer.find_herb_edgeville_bank()
        MS_Gold_Ringer.execute(edgeville_bank)
        # Store all
        Random_Generator.final_random()
        store_all = MS_Gold_Ringer.find_store_all()
        MS_Gold_Ringer.execute(store_all)