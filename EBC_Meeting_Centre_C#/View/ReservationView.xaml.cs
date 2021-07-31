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
using System.Collections.ObjectModel;
using EBC_Meeting_Centre_Tomas_Jerousek.Entities;
using EBC_Meeting_Centre_Tomas_Jerousek.Validation;
using EBC_Meeting_Centre_Tomas_Jerousek.Exceptions;
using EBC_Meeting_Centre_Tomas_Jerousek.DataFileManagement;

namespace EBC_Meeting_Centre_Tomas_Jerousek.View
{
    /// <summary>
    /// Interaction logic for ReservationView.xaml
    /// </summary>
    public partial class ReservationView : Window
    {
        private ObservableCollection<Reservation> reservations = new ObservableCollection<Reservation>();

        private MeetingCentre meetingCentre;
        private MeetingRoom meetingRoom;

        private DateTime reservationDate;

        public Delegate reservationUpdate;

        private Reservation selectedReservation;

        private ValidateReservation validateReservation = new ValidateReservation();
     

        
        public ReservationView(ObservableCollection<Reservation> reservations, MeetingRoom meetingRoom,
            MeetingCentre meetingCentre, DateTime reservationDate, Reservation selectedReservation)
        {
            InitializeComponent();
            this.reservations = reservations;
            this.meetingRoom = meetingRoom;
            this.meetingCentre = meetingCentre;
            this.reservationDate = reservationDate;
            this.selectedReservation = selectedReservation;

            SetReservationInfo(selectedReservation);



        }

        private void SetReservationInfo(Reservation reservation)
        {
            tbFromHourReservationView.Text = reservation?.timeFrom.Hour.ToString("D2") ?? String.Empty;
            tbFromMinuteReservationView.Text = reservation?.timeFrom.Minute.ToString("D2") ?? String.Empty;
            tbToHourReservationView.Text = reservation?.timeTo.Hour.ToString("D2") ?? String.Empty;
            tbToMinuteReservationView.Text = reservation?.timeTo.Minute.ToString("D2") ?? String.Empty;
            tbExpectedPersonCountReservationView.Text = reservation?.expectedPersonCount.ToString() ?? String.Empty;
            tbReservationCustomerView.Text = reservation?.customer ?? String.Empty;
            cbReservationisVideoConferenceView.IsChecked = reservation?.videoConference ?? false;
            tbReservationNoteView.Text = reservation?.note ?? String.Empty;

            
        }

        private void bReservationConfirmClick(object sender, RoutedEventArgs cccea)
        {
            try
            {
                DateTime timeFrom = new DateTime(2000, 01, 01, Convert.ToInt32(tbFromHourReservationView.Text), Convert.ToInt32(tbFromMinuteReservationView.Text), 0);
                DateTime timeTo = new DateTime(2000, 01, 01, Convert.ToInt32(tbToHourReservationView.Text), Convert.ToInt32(tbToMinuteReservationView.Text), 0);

                Reservation reservation = new Reservation(meetingRoom, reservationDate, timeFrom, timeTo, Convert.ToInt32(tbExpectedPersonCountReservationView.Text), 
                    tbReservationCustomerView.Text, (bool)cbReservationisVideoConferenceView.IsChecked, tbReservationNoteView.Text);

                validateReservation.Validate(reservation);
                if (selectedReservation == null)
                {
                    reservations.Add(reservation);
                }
                else
                {
                    reservations.Remove(selectedReservation);
                    reservations.Add(reservation);
                }
                reservationUpdate.DynamicInvoke();
                this.Close();
            }
            catch(ExceptionValidation alert)
            {
                MessageBox.Show(alert.Message);

            }
            catch(FormatException)
            {
                MessageBox.Show("Expected count must be a number");
            }
            catch(Exception alert2)
            {
                MessageBox.Show(alert2.Message);
            }
        }


        private void bReservationCancelClick(object sender, RoutedEventArgs tccea)
        {
            this.Close();
        }
    }
}
