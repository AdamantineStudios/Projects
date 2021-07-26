import cv2 as cv
import numpy as np
import os
import pyautogui
import time
import random
from random_generator import Random_Generator
from user_interface import User_Interface
from get_screenshot import Screenshot
from find_click_positions import Find_Object
from pyclick import HumanClicker, HumanCurve
# from pynput.keyboard import Key, Controller

class MS_Gold_Ringer:

    def human_mouse_movement(pos_x, pos_y):
        # Find current mouse position
        current_mouse_pos = pyautogui.position()
        # Generate random amout of knots and set them
        nodes = Random_Generator.mouse_nodes()
        options = {
            "knotsCount": 80,
        }
        human_curve = HumanCurve(current_mouse_pos, (pos_x, pos_y), **options)
        speed = Random_Generator.mouse_human_speed()
        hc = HumanClicker()
        hc.move((), speed, human_curve)

    def find_compass():
        print ('Scanning for all compasses')
        screenshot = Screenshot.get_screenshot()
        points = Find_Object.findClickPositions('z_compass.jpg', 'active.jpg', 0.8)
        return points

    def find_furnace():
        print ('Screenshot for Furnace')
        screenshot = Screenshot.get_screenshot()
        points = Find_Object.findClickPositions('z_furnace1.jpg', 'active.jpg', 0.70)
        print (points)
        return points

    def find_gold_ring():
        print ('Searching gold ring')
        screenshot = Screenshot.get_screenshot()
        points = Find_Object.findClickPositions('z_gold_ring.jpg', 'active.jpg', 0.85)
        return points

    def find_crafting_lvl_up():
        print ('Scanning for level up')
        screenshot = Screenshot.get_screenshot()
        points = Find_Object.findClickPositions('z_craft_lvl_up.jpg', 'active.jpg', 0.8)
        return points

    def find_bank():
        print ('Find bank')
        creenshot = Screenshot.get_screenshot()
        points = Find_Object.findClickPositions('z_bank_topper.jpg', 'active.jpg', 0.80)
        return points

    def find_store_all():
        print ('Store all')
        screenshot = Screenshot.get_screenshot()
        points = Find_Object.findClickPositions('z_store_items.jpg', 'active.jpg', 0.80)
        return points
    
    def store_gold_rings():
        print ('Store Gold Rings')
        screenshot = Screenshot.get_screenshot()
        points = Find_Object.findClickPositions('z_store_gold_rings.jpg', 'active.jpg', 0.80)
        return points

    def find_mould():
        print ('Get mould')
        screenshot = Screenshot.get_screenshot()
        points = Find_Object.findClickPositions('z_mould_banked.jpg', 'active.jpg', 0.77)
        return points

    def find_gold_bar():
        print ('Get Gold Bar from bank')
        screenshot = Screenshot.get_screenshot()
        points = Find_Object.findClickPositions('z_unique_gb.jpg', 'active.jpg', 0.80)
        return points

    def find_ada_bar():
        print ('Get Gold Bar from bank')
        screenshot = Screenshot.get_screenshot()
        points = Find_Object.findClickPositions('z_ada_bar.jpg', 'active.jpg', 0.80)
        return points

    def testing_func():
        print ('Testing...')
        screenshot = Screenshot.get_screenshot()
        points = Find_Object.findClickPositions('z_test.jpg', 'active.jpg', 0.60)
        print (points)
        return points

    # Emerald Functions

    def find_smelt_emerald():
        print ('Smelting emeralds')
        screenshot = Screenshot.get_screenshot()
        points = Find_Object.findClickPositions('z_smelt_emerald_necklace.jpg', 'active.jpg', 0.90)
        return points

    def store_emerald_necklaces():
        print ('Storing Emeralds')
        screenshot = Screenshot.get_screenshot()
        points = Find_Object.findClickPositions('z_store_emerald_necklace.jpg', 'active.jpg', 0.80)
        return points

    def find_emerald_in_bank():
        print ('Withdrawing banked Emeralds')
        screenshot = Screenshot.get_screenshot()
        points = Find_Object.findClickPositions('z_withdraw_emeralds.jpg', 'active.jpg', 0.85)
        return points



    # Herblore Functions

    def find_toadflax():
        print ('Searching for Toadflax herb in Bank')
        screenshot = Screenshot.get_screenshot()
        points = Find_Object.findClickPositions('z_herb_toadflax_banked.jpg', 'active.jpg', 0.85)
        return points
    
    def find_vial_of_water():
        print ('Searching for Vial of Water in Bank')
        screenshot = Screenshot.get_screenshot()
        points = Find_Object.findClickPositions('z_herb_vial_of_water.jpg', 'active.jpg', 0.85)
        return points

    def find_toadflax_and_vial_inventory():
        print ('Searching for Toadflax and Vial of Water in Inventory')
        screenshot = Screenshot.get_screenshot()
        points = Find_Object.findClickPositions('z_herb_toadflax_vial_inventory.jpg', 'active.jpg', 0.85)
        return points

    def find_herb_edgeville_bank():
        print ('Searching for Edgeville bank')
        screenshot = Screenshot.get_screenshot()
        points = Find_Object.findClickPositions('z_herb_edgeville_bank.jpg', 'active.jpg', 0.85)
        return points

    # Special herblore execution loop
    def execute_herblore_inventory(points):
        counter = 0
        for position in points:
            counter = counter + 1
            if (counter < 5):
                print ('Searching for another object...')
                pixel_offset_x = Random_Generator.pixel_small_generator()
                pixel_offset_y = Random_Generator.pixel_small_generator()
                final_x = int(position[0])
                final_y = int(position[1])
                # Lets find Toadflax in inventory / left from taken screenshot
                toadflax_x =  (final_x - 20) + pixel_offset_x
                # Lets execute left click on found toadflax
                MS_Gold_Ringer.human_mouse_movement(toadflax_x, final_y)
                pyautogui.leftClick()
                # Lets find Vial of water in inv / right from taken screenshot
                vial_of_water_x = (final_x + 20) + pixel_offset_x
                MS_Gold_Ringer.human_mouse_movement(vial_of_water_x, final_y)
                pyautogui.leftClick()
                Random_Generator.wait_spacebar_herblore()
                pyautogui.keyDown('space')
                pyautogui.keyUp('space')
                random_timing = Random_Generator.jump_acc()
                time.sleep(random_timing)
            else:
                pass

    def execute_take_vial_close_bank(points):
        for position in points:
            print ('Searching for another object...')
            pixel_offset_x = Random_Generator.pixel_small_generator()
            pixel_offset_y = Random_Generator.pixel_small_generator()
            final_x = int(position[0] + pixel_offset_x + 25)
            final_y = int(position[1] + pixel_offset_y + 5)
            MS_Gold_Ringer.human_mouse_movement(final_x, final_y)
            pyautogui.leftClick()
            random_timing = Random_Generator.jump_acc()
            time.sleep(random_timing)
            pyautogui.keyDown('esc')
            pyautogui.keyUp('esc')
            random_timing = Random_Generator.jump_acc()
            time.sleep(random_timing)



    # Execution loops

    def execute_dismiss_lvl_up(points):
        for position in points:
            print ('Searching for another object...')
            pixel_offset_x = Random_Generator.pixel_small_generator()
            pixel_offset_y = Random_Generator.pixel_small_generator()
            final_x = int(position[0] + pixel_offset_x)
            final_y = int(position[1] + pixel_offset_y)
            MS_Gold_Ringer.human_mouse_movement(final_x, final_y)
            pyautogui.leftClick()
            pyautogui.keyDown('space')
            pyautogui.keyUp('space')
            wait = Random_Generator.final_random()
            pyautogui.keyDown('space')
            pyautogui.keyUp('space')
            random_timing = Random_Generator.jump_acc()
            time.sleep(random_timing)

    def execute_dismiss_empty(points):
        for position in points:
            print ('Searching for another object...')
            pixel_offset_x = Random_Generator.pixel_small_generator()
            pixel_offset_y = Random_Generator.pixel_small_generator()
            final_x = int(position[0] + pixel_offset_x + 20)
            final_y = int(position[1] + pixel_offset_y)
            MS_Gold_Ringer.human_mouse_movement(final_x, final_y)
            pyautogui.leftClick()
            pyautogui.keyDown('space')
            pyautogui.keyUp('space')
            # random_timing = Random_Generator.final_random()
            # time.sleep(random_timing)
            # pyautogui.keyDown('space')
            # pyautogui.keyUp('space')
            # random_timing = Random_Generator.jump_acc()
            # time.sleep(random_timing)


    def execute_spec_item(points):
        for position in points:
            print ('Searching for another object...')
            pixel_offset_x = Random_Generator.pixel_small_generator()
            pixel_offset_y = Random_Generator.pixel_small_generator()
            final_x = int(position[0] + pixel_offset_x + 20)
            final_y = int(position[1] + pixel_offset_y)
            MS_Gold_Ringer.human_mouse_movement(final_x, final_y)
            pyautogui.leftClick()
            random_timing = Random_Generator.jump_acc()
            time.sleep(random_timing)


    def execute(points):
        counter = 0
        for position in points:
            counter = counter + 1
            if (counter < 5):
                print ('Searching for another object...')
                pixel_offset_x = Random_Generator.pixel_small_generator()
                pixel_offset_y = Random_Generator.pixel_small_generator()
                final_x = int(position[0] + pixel_offset_x)
                final_y = int(position[1] + pixel_offset_y)
                MS_Gold_Ringer.human_mouse_movement(final_x, final_y)
                pyautogui.leftClick()
                random_timing = Random_Generator.jump_acc()
                time.sleep(random_timing)
            else:
                pass


    # def switch_screen_keyboard_1():
    #     keyboard = Controller()
    #     keyboard.press(Key.cmd)
    #     keyboard.press(Key.ctrl)
    #     keyboard.press(Key.left)
    #     keyboard.release(Key.cmd)
    #     keyboard.release(Key.ctrl)
    #     keyboard.release(Key.left)

    # def switch_screen_keyboard_2():
    #     keyboard = Controller()
    #     keyboard.press(Key.cmd)
    #     keyboard.press(Key.ctrl)
    #     keyboard.press(Key.right)
    #     keyboard.release(Key.cmd)
    #     keyboard.release(Key.ctrl)
    #     keyboard.release(Key.right)

    def switch_screen_1():
        screen_control_x = 415
        screen_control_y = 1060
        # screen_control_x = 462
        # screen_control_y = 1058
        MS_Gold_Ringer.human_mouse_movement(screen_control_x, screen_control_y)
        pyautogui.leftClick()
        screen_1_x = 126
        screen_1_y = 71
        MS_Gold_Ringer.human_mouse_movement(screen_1_x, screen_1_y)
        pyautogui.leftClick()

    def switch_screen_2():
        screen_control_x = 415
        screen_control_y = 1060
        # screen_control_x = 462
        # screen_control_y = 1058
        MS_Gold_Ringer.human_mouse_movement(screen_control_x, screen_control_y)
        # pyautogui.moveTo(screen_control_x, screen_control_y)
        pyautogui.leftClick()
        screen_2_x = 294
        screen_2_y = 68
        MS_Gold_Ringer.human_mouse_movement(screen_2_x, screen_2_y)
        #pyautogui.moveTo(screen_2_x, screen_2_y)
        pyautogui.leftClick()
    
    def switch_screen_3():
        screen_control_x = 462
        screen_control_y = 1058
        MS_Gold_Ringer.human_mouse_movement(screen_control_x, screen_control_y)
        #pyautogui.moveTo(screen_control_x, screen_control_y)
        pyautogui.leftClick()
        screen_3_x = 455
        screen_3_y = 71
        MS_Gold_Ringer.human_mouse_movement(screen_3_x, screen_3_y)
        # pyautogui.moveTo(screen_2_x, screen_2_y)
        pyautogui.leftClick()


    # # Create humanlike mouse movement
    # def human_mouse_movement(pos_x, pos_y):
    #     # Find current mouse position
    #     current_mouse_pos = pyautogui.position()
    #     # Generate random amout of knots and set them
    #     nodes = Random_Generator.mouse_nodes()
    #     options = {
    #         "knotsCount": nodes,
    #     }
    #     #human_curve = HumanCurve(current_mouse_pos, (pos_x, pos_y), **options)
    #     speed = Random_Generator.mouse_human_speed()
    #     hc = HumanClicker()
    #     hc.move((pos_x, pos_y), speed)
