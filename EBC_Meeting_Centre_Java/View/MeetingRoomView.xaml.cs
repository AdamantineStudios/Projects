using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using EBC_Meeting_Centre_Tomas_Jerousek.Entities;
using EBC_Meeting_Centre_Tomas_Jerousek.Validation;
using EBC_Meeting_Centre_Tomas_Jerousek.Exceptions;
using EBC_Meeting_Centre_Tomas_Jerousek.DataFileManagement;

namespace EBC_Meeting_Centre_Tomas_Jerousek.View
{
    /// <summary>
    /// Interaction logic for MeetingRoomView.xaml
    /// </summary>
    public partial class MeetingRoomView : Window
    {
        private List<MeetingRoom> meetingRooms = new List<MeetingRoom>();
        private MeetingRoom selectedMeetingRoom;
        private MeetingCentre meetingCentre;
        private ValidateMeetingRoom meetingRoomValidator = new ValidateMeetingRoom();
        public Delegate roomUpdate;

        public MeetingRoomView(List<MeetingRoom> meetingRooms, MeetingRoom selectedMeetingRoom, MeetingCentre meetingCentre)
        {
            InitializeComponent();

            this.meetingRooms = meetingRooms;
            this.selectedMeetingRoom = selectedMeetingRoom;
            this.meetingCentre = meetingCentre;

            SetMeetingRoom(selectedMeetingRoom);
        }

        private void bCancelClick(object sender, RoutedEventArgs cancel)
        {
            this.Close();
        }

        private void SetMeetingRoom(MeetingRoom meetingRoom)
        {
            tbName.Text = meetingRoom?.name ?? String.Empty;
            tbCoode.Text = meetingRoom?.code ?? String.Empty;
            tbDescription.Text = meetingRoom?.description ?? String.Empty;
            tbCapacity.Text = meetingRoom?.capacity.ToString() ?? String.Empty;
            cbVideoConference.IsChecked = meetingRoom?.isVideoConference ?? false;

           
        }
        private void bConfirmClick(object sender, RoutedEventArgs confirm)
        {
            try
            {
                MeetingRoom meetingRoom = new MeetingRoom(tbName.Text, tbCoode.Text, tbDescription.Text, (bool)cbVideoConference.IsChecked, meetingCentre.code, Convert.ToInt32(tbCapacity.Text));
                meetingRoomValidator.Validate(meetingRoom);
                if (selectedMeetingRoom == null)
                {
                    meetingRooms.Add(meetingRoom);
                }
                else
                {
                    MeetingRoom editRoom = meetingRooms.Find(meetinRoom => meetinRoom.code == selectedMeetingRoom.code);
                    editRoom.name = meetingRoom.name;
                    editRoom.code = meetingRoom.code;
                    editRoom.description = meetingRoom.description;
                    editRoom.meetingRoomCode = meetingCentre.code;
                    editRoom.isVideoConference = meetingRoom.isVideoConference;
                    editRoom.capacity = editRoom.capacity;
                }
                roomUpdate.DynamicInvoke();
                this.Close();
                
            }
            catch(ExceptionValidation ev)
            {
                MessageBox.Show(ev.Message);   
            }
            catch (FormatException)
            {
                MessageBox.Show("Capacity has to be integer!");
            }
            catch(Exception exc)
            {
                MessageBox.Show(exc.Message);
            }
        }
    }
}
