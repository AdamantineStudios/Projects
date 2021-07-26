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
from functions import Functions

class Testing_Screen_Switcher:
    def take_Screenshot():
        screenshot = Screenshot.get_screenshot()
        points = Find_Object.findClickPositions('z_compass.jpg', 'active.jpg', 0.8)
        return points

    def execute(points):
        for position in points:
            pixel_offset_x = Random_Generator.pixel_small_generator()
            pixel_offset_y = Random_Generator.pixel_small_generator()
            final_x = position[0] + pixel_offset_x
            final_y = position[1] + pixel_offset_y
            smooth_mouse = Random_Generator.smooth_mouse()
            pyautogui.moveTo(final_x, final_y, smooth_mouse)
            pyautogui.leftClick()
            random_timing = Random_Generator.jump_acc()
            time.sleep(random_timing)

    