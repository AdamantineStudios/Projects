   M S B A M L   `   `   `  ����\  XEBC_Meeting_Centre_Tomas_Jerousek, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullU/clr-namespace:EBC_Meeting_Centre_Tomas_Jerousek!EBC_Meeting_Centre_Tomas_Jerousek  5   	   2    ,EBC_Meeting_Centre_Tomas_Jerousek.MainWindow   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   Alocal/clr-namespace:EBC_Meeting_Centre_Tomas_Jerousek     5   	   -   5          � Title$  
MainWindow��5   	   $	��950��6   $	��800��6)   
���iii�.��5	      � .+�5
   
   ]� .+�5      o� $	��Top=�6   .@�5      m� -   5        $
��Save��5      6)   m� 5      -   5        $��Import Data��5      60   m� 5      -   5        $
��Exit��5      6)   5      �� 5      -   5        $	��900��5      $	��700��6&   $	��Top=�62   .@�5      �� $��Meeting Centres and Rooms��6   $
��Bold"�6=   .��5      � .+�5      �� $
��Left=�6%   $	��350��6@   
�������.+�5      �� $��Meeting Centres��6$   $
��Bold"�6>   $��15(�6P   �� 5      -   5         ��Name$
 lbMC��5   &   $	��150��64   $	��300��6A   $��0,5,0,10q�6M   
�������6�   �� 5      $��25��6)    �� Orientation$ 
Horizontal=�65   $	��320��6N   .+�5   "   �� -   5         ��Name$ btnMCDelete��5   L   $��Delete��6)   $
��Bold"�6:   $��10,0,0,0q�6a   
���  ��6�   �� 5   "   -   5        $ 	btnMCEdit��5   8   $
��Edit��6)   $
��Bold"�6K   $��	175,0,0,0q�6]   
����ح�6�   �� 5   "   -	   5        $ btnMCAdd��5   7   $	��Add��6)   $
��Bold"�6I   $��32,0,0,0q�6[   
������6�   5      �� 5      $ ��Meeting Centre Information��6$   $
��Bold"�6I   $��13(�6[   $��0,10,0,0q�6i   6}   �� 5      $
��Name��6$   $
��Bold"�63   6G   �� 5      -
   5         ��Name$ tbMCName��5   &   $	��200��68   $��	0,5,125,0q�6D    �� 
IsReadOnly . 
�������6�   �� 5      $
��Code��6$   $
��Bold"�63   6G   �� 5      -   5        $ tbMCCode��5   &   $	��200��68   $��	0,5,125,0q�6D    . 
�������6�   �� 5       $��Description��6$   $
��Bold"�6:   6N   �� 5!      -   5        $ tbMCDescription��5!   &   $	��200��6?   $��	0,5,125,0q�6K    . 
�������6�   5#      �� 5%      $
��Left=�6%   $	��350��6@   $��	350,0,0,0q�6L   
�������.+�5&      �� $��Meeting Rooms��6$   $
��Bold"�6<   $��15(�6N   6^   �� 5'      -   5        $
 lbMR��5'   &   $	��150��64   $	��300��6A   $��0,5,0,10q�6M   
�������6�   �� 5(      $��25��6)   $ 
Horizontal=�65   $	��320��6N   .+�5)   "   �� -   5        $ btnMRDelete��5)   L   $��Delete��6)   $
��Bold"�6:   $��10,0,0,0q�6a   
���  ��6�   �� 5*   "   -   5        $ 	btnMREdit��5*   8   $
��Edit��6)   $
��Bold"�6K   $��	175,0,0,0q�6]   
����ح�6�   �� 5+   "   -   5        $ btnMRAdd��5+   7   $	��Add��6)   $
��Bold"�6I   $��32,0,0,0q�6[   
������6�   5,      �� 5-      $��Meeting Room Information��6$   $
��Bold"�6G   $��13(�6Y   $��0,10,0,0q�6g   6{   �� 5.      $
��Name��6$   $
��Bold"�63   6G   �� 5/      -   5        $ tbMRName��5/   &   $	��200��68   $��	0,5,125,0q�6D    . 
�������6�   �� 50      $
��Code��6$   $
��Bold"�63   6G   �� 51      -   5        $ tbMRCode��51   &   $	��200��68   $��	0,5,125,0q�6D    . 
�������6�   �� 52      $��Description��6$   $
��Bold"�6:   6N   �� 53      -   5        $ tbMRDescription��53   &   $	��200��6?   $��	0,5,125,0q�6K    . 
�������6�   �� 54      $��Capacity��6$   $
��Bold"�67   6K   �� 55      -   5        $ tbMRCapacity��55   &   $	��200��6<   $��	0,5,125,0q�6H    . 
�������6�   �� 56      -   5         ��Name$ cbMRVideoConference��56   B   $��Video Conference��6'   $��	10,15,0,0q�6_   
�������6�   57      58      59      �� 5:      -   5         ��Name$ tabReservations��5:   0   $��Reservations��6   $
��Bold"�6I   .��5;      � .+�5<      �� $
��Left=�6%   $	��350��6@   
�������.+�5=      �� $��Reservation Settings��6$   $
��Bold"�6C   $��15(�6U   6e   �� 5>      $��Meeting Centres��6$   $
��Bold"�6>   6R   �� 5?      -   5         ��Name$ cbMCReservation��5?   '   $��0,5,0,0q�6k   
�������6�   �� 5@      $��Meeting Rooms��6$   $
��Bold"�6<   $��0,5,0,0q�6N   6a   �� 5A      -   5        $ cbMRReservation��5A   '   $��0,5,0,0q�6k   
�������6�   �� 5B      $��Reservation Date��6$   $
��Bold"�6?   $��0,5,0,0q�6Q   6d   (  "System.Windows.Controls.DatePicker  5C      -   5        	  Name$	 dpReservationDate��5C   )   $��0,5,0,0q�6t   
�������6�   �� 5D      $��Reserved Dates��6$   $
��Bold"�6=   $��0,5,0,0q�6O   6b   �� 5E      -   5        $ lbReservations��5E   &   $	��150��6>   $	��300��6K   $��0,5,0,10q�6W   
�������6�   �� 5F      $��25��6)   $ 
Horizontal=�65   $	��320��6N   .+�5G   "   �� -   5        $ btnReservationDelete��5G   L   $��Delete��6)   $
��Bold"�6:   $��10,0,0,0q�6j   
���  ��6�   �� 5H   "   -   5        $ btnReservationEdit��5H   8   $
��Edit��6)   $
��Bold"�6T   $��	175,0,0,0q�6f   
����ح�6�   �� 5I   "   -   5        $ bReservationAdd��5I   7   $	��Add��6)   $
��Bold"�6P   $��32,0,0,0q�6b   
������6�   5J      5M      �� 5N      $
��Left=�6%   $	��350��6@   $��	350,0,0,0q�6L   
�������.+�5O      �� $��Reservation Information��6$   $
��Bold"�6F   $��15(�6X   6h   �� 5P      $��Customer��6$   $
��Bold"�67   6K   �� 5Q      -   5        $ tbReservationCustomer��5Q   &   $	��200��6E   $��	0,5,125,0q�6Q   
������� . 6�   �� 5R      $��Expected Persons Count��6$   $
��Bold"�6E   6Y   �� 5S      -   5        $&  tbReservationExpectedPersonCount��5S   &   $	��200��6P   $��	0,5,125,0q�6\   
������� . 6�   �� 5T      $
��Note��6$   $
��Bold"�63   6G   �� 5U      -    5        $ tbReservationNote��5U   &   $	��200��6A   $��	0,5,125,0q�6M    . 
�������6�   �� 5V      $
��Time��6$   $
��Bold"�63   6G   �� 5W      $ 
Horizontal=�6)   .+�5X   "   �� -!   5        $ 
tbFromHour��5X   *   $��50��6>   $��10,0,0,0q�6I    . 
�������6�   �� 5Y   "   $��:��6(   66   �� 5Z   "   -"   5        $ tbFromMinute��5Z   *   $��50��6@   $��10,0,0,0q�6K    . 
�������6�   �� 5[   "   $��---->��6(   6:   �� 5\   "   -#   5        $ tbToHour��5\   *   $��50��6<   $��10,0,0,0q�6G    . 
�������6�   �� 5]   "   $��:��6(   66   �� 5^   "   -$   5        $ 
tbToMinute��5^   *   $��50��6>   $��10,0,0,0q�6I    . 
�������6�   5_      �� 5`      -%   5        $" cbVideoConferenceInformation��5`   m   $��Video Conference��6'   $��5,10,0,0q�6B   
 J� IsHitTestVisible
 .  
�������6�   �� 5a      -&   5        $ btnReservationExportClick��5a   H   $��Export��6%   $
��Bold"�66   $��	0,147,0,0q�6k   
��� ���6�   5b      5c      5d      5e      5f      5h      5i      