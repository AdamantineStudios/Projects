from random_generator import Random_Generator
from user_interface import User_Interface 
from functions import MS_Gold_Ringer
import time
from pyclick import HumanClicker, HumanCurve
import pyautogui


class Crafting_Logic:
    
    def smelt_gold_rings():
        # compasses = MS_Gold_Ringer.find_compass()
        # MS_Gold_Ringer.execute(compasses)
        Random_Generator.final_random()

        furnaces = MS_Gold_Ringer.find_furnace()
        MS_Gold_Ringer.execute(furnaces)

        relocation = Random_Generator.character_relocation()
        time.sleep(relocation)
        gold_rings = MS_Gold_Ringer.find_gold_ring()
        MS_Gold_Ringer.execute(gold_rings)

    def store_items():
        # compasses = MS_Gold_Ringer.find_compass()
        # MS_Gold_Ringer.execute(compasses)

        lvl_up = MS_Gold_Ringer.find_crafting_lvl_up()
        MS_Gold_Ringer.execute_dismiss_lvl_up(lvl_up)
        Random_Generator.final_random()

        # no_gb_run = MS_Gold_Ringer.find_ada_bar()
        # MS_Gold_Ringer.execute_dismiss_empty(no_gb_run)

        find_bank = MS_Gold_Ringer.find_bank()
        MS_Gold_Ringer.execute(find_bank)

        relocation = Random_Generator.character_relocation()
        time.sleep(relocation)

        # edit for more human like
        store_unique = MS_Gold_Ringer.store_gold_rings()
        MS_Gold_Ringer.execute_spec_item(store_unique)

        Random_Generator.final_random()
        # Edit for more human like
        # mould = MS_Gold_Ringer.find_mould()
        # MS_Gold_Ringer.execute(mould)
        gold_bar = MS_Gold_Ringer.find_gold_bar()
        MS_Gold_Ringer.execute_spec_item(gold_bar)

    def smelt_emerald_necklaces():
        Random_Generator.final_random()
        furnaces = MS_Gold_Ringer.find_furnace()
        MS_Gold_Ringer.execute(furnaces)
        Random_Generator.character_relocation_run_on()
        # Smelt emeralds
        emerald_necklaces = MS_Gold_Ringer.find_smelt_emerald()
        MS_Gold_Ringer.execute(emerald_necklaces)
        


    def store_emeralds():
        lvl_up = MS_Gold_Ringer.find_crafting_lvl_up()
        MS_Gold_Ringer.execute_dismiss_lvl_up(lvl_up)
        Random_Generator.final_random()

        find_bank = MS_Gold_Ringer.find_bank()
        MS_Gold_Ringer.execute(find_bank)

        Random_Generator.character_relocation_run_on()

        # Store emeralds
        store_emerald = MS_Gold_Ringer.store_emerald_necklaces()
        MS_Gold_Ringer.execute_spec_item(store_emerald)
        Random_Generator.final_random()
        
        withdraw_emeralds = MS_Gold_Ringer.find_emerald_in_bank()
        MS_Gold_Ringer.execute_spec_item(withdraw_emeralds)
        Random_Generator.final_random()
        gold_bar = MS_Gold_Ringer.find_gold_bar()
        MS_Gold_Ringer.execute_spec_item(gold_bar)