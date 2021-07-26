import random
import time

class Random_Generator:
    # Edit this function so we enter there custom values SO FAR SO SHIT
    def min_range():
        min = random.uniform(0.4, 0.7)
        return min

    def max_range():
        max = random.uniform(0.7, 1.1)
        return max

    def character_relocation():
        min = random.uniform(9, 9.7)
        max = random.uniform(9.8, 11.1)
        result = random.uniform(min, max)
        time.sleep(result)

    def character_relocation_run_on():
        min = random.uniform(5.9, 6.7)
        max = random.uniform(6.8, 7.9)
        result = random.uniform(min, max)
        time.sleep(result)

    def switch_screen_wait():
        min = random.uniform(0.6, 0.85)
        max = random.uniform(0.90, 1.07)
        result = random.uniform(min, max)
        print ('Sleeping for: ', result)
        time.sleep(result)

    def switch_screen_wait_keyboard_switch():
        min = random.uniform(0.35, 0.45)
        max = random.uniform(0.45, 0.51)
        result = random.uniform(min, max)
        print ('Sleeping for: ', result)
        time.sleep(result)

    def wait_inventory():
        min = random.uniform(40, 47)
        max = random.uniform(48, 60)
        result = random.uniform(min, max)
        time.sleep(result)

    def wait_inventory_2screens():
        min = random.uniform(29, 34)
        max = random.uniform(35, 46)
        result = random.uniform(min, max)
        print ('Sleeping for: ', result)
        time.sleep(result)

    def pixel_generator():
        min = random.uniform(1, 2)
        max = random.uniform(3, 8)
        result = random.uniform(min, max)
        return result

    def pixel_small_generator():
        min = random.randrange(1, 2)
        max = random.randrange(3, 6)
        result = random.randrange(min, max)
        return result

    def wait_spacebar_herblore():
        min = random.uniform(0.35, 0.45)
        max = random.uniform(0.45, 0.61)
        result = random.uniform(min, max)
        time.sleep(result)

    def final_random():
        min = random.uniform(0.4, 0.7)
        max = random.uniform(0.7, 1.1)
        result = random.uniform(min, max)
        time.sleep(result)
        #return result

    def emergency_wait():
        min = random.uniform(2, 3)
        max = random.uniform(3.1, 4.3)
        result = random.uniform(min, max)
        return result

    def jump_acc():
        min = random.uniform(0.24, 0.32)
        max = random.uniform(0.33, 0.43)
        result = random.uniform(min, max)
        return result

    def wait_inventory_herbs():
        min = random.uniform(0.80, 0.85)
        max = random.uniform(0.85, 0.90)
        result = random.uniform(min, max)
        return result

    def smooth_mouse():
        min = random.uniform(0.5, 0.9)
        max = random.uniform(1.3, 1.7)
        result = random.uniform(min, max)
        return result

    def mouse_human_speed():
        min = random.uniform(0.28, 0.31)
        max = random.uniform(0.31, 0.38)
        result = random.uniform(min, max)
        return result
        
    def mouse_nodes():
        min = random.randrange(1, 2)
        max = random.randrange(2, 3)
        result = random.randrange(min, max)
        return result