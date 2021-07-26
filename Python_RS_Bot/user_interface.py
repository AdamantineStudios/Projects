import time

class User_Interface:
    def welcome_menu():
        print ('-----------------------------------------')
        print ('        Edgeville Crafting bot')
        print ('-----------------------------------------')
        print ('Intitializing...')
        time.sleep(1)
        

    def instructions():
        print ('-----------------------------------------')
        print ('Please select a bot that you wish to run. \n')
        print ('After selecting a bot, you will have about \n'
         '3 seconds to TAB into your OSRS window')
        print ('-----------------------------------------')

    def bot_options():
        #bot_id = selected_bot
        while_loop = False
        while (while_loop == False):
            try:
                print ('1. Edgeville Gold Ring bot')
                print ('2. Edgeville Emerald Ring bot')
                print ('-----------------------------------------')
                option = input('Please enter your value: ')
                option = int(option)
                while_loop = True
            except ValueError:
                print ('-----------------------------------------')
                print ('Please enter a valid option!')
                print ('Please try again.')
                print ('-----------------------------------------')
        return option

    def option_one_bot():
        print ('-----------------------------------------')
        print ('Starting script...')
        print ('-----------------------------------------')
        print ('Running a Edgeville Gold Ring script')
        print ('-----------------------------------------')
        time.sleep(2.5)
    

        
