   M S B A M L   `   `   `  ����\  XEBC_Meeting_Centre_Tomas_Jerousek, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null_4clr-namespace:EBC_Meeting_Centre_Tomas_Jerousek.View&EBC_Meeting_Centre_Tomas_Jerousek.View  5   	   <    6EBC_Meeting_Centre_Tomas_Jerousek.View.ReservationView   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   Flocal4clr-namespace:EBC_Meeting_Centre_Tomas_Jerousek.View     5   	     � Title$  ReservationView��5   	   $	��450��6!   $	��800��6.   
���iii�.��5	      � .+�5
   
   �� $
��Left=�6   $	��400��60   $	��380��6=   $��	10,10,0,0q�6I   $	��Top=�6\   
�������.+�5      �� $��Reservation Settings��6   $
��Bold"�63   $��20(�6E   6U   �� 5      $
��Time��6   $
��Bold"�6#   $��9,10,0,5q�65   6I   �� 5       �� Orientation$ 
Horizontal=�6   .+�5      �� -   5         ��Name$ tbFromHourReservationView��5      $��50��6=   $��10,0,0,0q�6H   
�������6s   �� 5      $��:��6   6&   �� 5      -   5        $! tbFromMinuteReservationView��5      $��50��6?   $��10,0,0,0q�6J   
�������6u   �� 5      $��---->��6   6*   �� 5      -   5        $ tbToHourReservationView��5      $��50��6;   $��10,0,0,0q�6F   
�������6q   �� 5      $��:��6   6&   �� 5      -   5        $ tbToMinuteReservationView��5      $��50��6=   $��10,0,0,0q�6H   
�������6s   5      �� 5      $��Expected person count��6   $
��Left=�64   $��30��6O   $��9,5,0,0q�6[   $	��200��6l   $
��Bold"�6x   �� 5      -   5        $* $tbExpectedPersonCountReservationView��5   c   $
��Left=�6   $��20��61   $��10,0,0,0q�6=    �� TextWrapping$
 Wrap=�6O   $	��290��6�   
�������6�   �� 5      $��Customer��6   $
��Left=�6'   $��30��6B   $��9,5,0,0q�6N   $	��200��6_   $
��Bold"�6k   �� 5      -   5        $ tbReservationCustomerView��5   c   $
��Left=�6   $��20��61   $��10,0,0,0q�6=   $
 Wrap=�6O   $	��290��6�   
�������6�   �� 5      -   5         ��Name$( "cbReservationisVideoConferenceView��5   E   $��Video Conference��6   $��	10,15,0,0q�62   
�������6q   �� 5      $
��Note��6   $
��Left=�6#   $��30��6>   $��9,5,0,0q�6J   $	��200��6[   $
��Bold"�6g   �� 5      -   5        $ tbReservationNoteView��5   c   $
��Left=�6   $��80��61   $��10,0,0,0q�6=   $
 Wrap=�6O   $	��290��6�   
�������6�   �� 5      $��25��6   $ 
Horizontal=�6%   $	��320��6>   $��	-36,0,0,0q�6J   .+�5      �� -	   5         ��Name$ bReservationCancel��5   <   $��Cancel��6   $
��Bold"�6*   $��0,0,0,0q�6X   
���  ��6�   �� 5      -
   5        $ bReservationConfirm��5   +   $��Confirm��6   $
��Bold"�6H   $��	200,0,0,0q�6Z   
������6�   5       5!      5$      5%      