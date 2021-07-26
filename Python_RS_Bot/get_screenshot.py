import cv2 as cv
import numpy as np
import os
import pyautogui

class Screenshot:
    def get_screenshot():
        screenshot = pyautogui.screenshot()
        screenshot.save(r'E:\ProjectRunescape\MasterScripts\active.jpg')