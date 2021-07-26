using Microsoft.Win32;
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
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.IO;
using System.Collections.ObjectModel;
using System.Xml.Serialization;
using System.Collections.Specialized;
using EBC_Meeting_Centre_Tomas_Jerousek.View;
using EBC_Meeting_Centre_Tomas_Jerousek.DataFileManagement;
using EBC_Meeting_Centre_Tomas_Jerousek.Validation;
using EBC_Meeting_Centre_Tomas_Jerousek.Exceptions;
using EBC_Meeting_Centre_Tomas_Jerousek.Entities;
using EBC_Meeting_Centre_Tomas_Jerousek.Comparers;
using EBC_Meeting_Centre_Tomas_Jerousek.DataFileManagement.CSV;
using EBC_Meeting_Centre_Tomas_Jerousek.DataFileManagement.XML;
using EBC_Meeting_Centre_Tomas_Jerousek.DataFileManagement.JSON;

namespace EBC_Meeting_Centre_Tomas_Jerousek
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private List<MeetingRoom> meetingRooms = new List<MeetingRoom>();
        private List<MeetingCentre> meetingCentres = new List<MeetingCentre>();
        private List<MeetingRoom> lastMeetingRoom = new List<MeetingRoom>();
        private List<MeetingCentre> lastMeetingCentre = new List<MeetingCentre>();
        private ObservableCollection<Reservation> reservations = new ObservableCollection<Reservation>();


        //private MeetingRoom meetingRoom;
        //private MeetingCentre meetingCentre;


        private CSVReader csvReader = new CSVReader();
        private CSVWriter csvWriter = new CSVWriter();
        private XMLSerializer xmlSerializer = new XMLSerializer();
        private XMLDeserializer xmlDeserializer = new XMLDeserializer();
        private JSONWriter jsonWriter = new JSONWriter();


        public delegate void RefreshMeetingCenterList();
        public delegate void RefreshMeetingRoomList();
        public delegate void RefreshReservationList();

        public event RefreshMeetingCenterList RefreshMeetingCenterListEvent;
        public event RefreshMeetingRoomList RefreshMeetingRoomListEvent;
        public event RefreshReservationList RefreshReservationListEvent;


        private bool dataChange = false;

        private MeetingRoom selectedMR = null;
        private MeetingCentre selectedMC = null;

        //Propojeni frontendu s backendem, dulezite metody, ktere nam pomuzi pri behu programu, celkove vyobrazeni a logika
        public MainWindow()
        {
            InitializeComponent();

            if (File.Exists(CSVWriter.path))
            {
                csvReader.ParseCSV(CSVWriter.path, meetingRooms, meetingCentres);

                lastMeetingCentre = meetingCentres.ConvertAll(x => new MeetingCentre(x.name, x.code, x.description));
                lastMeetingRoom = meetingRooms.ConvertAll(y => new MeetingRoom(y.name, y.code, y.description, y.isVideoConference, y.meetingRoomCode, y.capacity));
                lbMC.ItemsSource = meetingCentres;
                
            }

            if (File.Exists(XMLSerializer.path)){
                reservations = xmlDeserializer.XMLDeserialization<Reservation>(XMLSerializer.path);
            }
            reservations.CollectionChanged += ReservationCollectionChanged;
        }

        private void ReservationCollectionChanged(object sender, NotifyCollectionChangedEventArgs nccea)
        {
            dataChange = true;
        }


        private void MenuItem_Click(object sender, RoutedEventArgs e)
        {

        }

        private void MenuExit_Click(object sender, RoutedEventArgs xccea)
        {
            Application.Current.Shutdown();
        }
        
        //Načtení CSV souborů
        private void MenuImport_Click(object sender, RoutedEventArgs sccea)
        {
            OpenFileDialog importFile = new OpenFileDialog
            {
                Title = "Choose your desired CSV file!",
                CheckFileExists = true,
                CheckPathExists = true,
                DefaultExt = "csv",
                Filter = "csv files(*.csv)|*.csv",
            };

            if(importFile.ShowDialog() == true)
            {
                try
                {
                    csvReader.ParseCSV(importFile.FileName, meetingRooms, meetingCentres);
                }
                catch(IOException exception)
                {
                    MessageBox.Show(exception.Message, "Import failed!", MessageBoxButton.YesNoCancel);
                }
                lbMC.ItemsSource = meetingCentres;
            }

            //Metoda, která po importu refreshne visibilitu daných list boxů
            RefreshMeetingCentreListBox();
        }

        //Zjisteni plnosti jednotlivych objektu pokud obsahuji nejake informace tak vyplnit a pokud ne tak nechat prazdne
        private void SelectedCentreFilling(MeetingCentre meetinCentre)
        {
            tbMCName.Text = meetinCentre?.name ?? "";
            tbMCCode.Text = meetinCentre?.code ?? "";
            tbMCDescription.Text = meetinCentre?.description ?? "";
        }

        private void SelectedRoomFilling(MeetingRoom meetinRoom)
        {
            tbMRName.Text = meetinRoom?.name ?? "";
            tbMRCode.Text = meetinRoom?.code ?? "";
            tbMRDescription.Text = meetinRoom?.description ?? "";
            tbMRCapacity.Text = meetinRoom?.capacity.ToString() ?? "";
            cbMRVideoConference.IsChecked = meetinRoom?.isVideoConference ?? false;
        }

        private void SelectedReservationFilling(Reservation reservation)
        {
            tbFromHour.Text = reservation?.timeFrom.Hour.ToString("D2") ?? "";

            tbFromMinute.Text = reservation?.timeFrom.Minute.ToString("D2") ?? "";

            tbToHour.Text = reservation?.timeTo.Hour.ToString("D2") ?? "";

            tbToMinute.Text = reservation?.timeTo.Minute.ToString("D2") ?? "";

            tbReservationExpectedPersonCount.Text = reservation?.expectedPersonCount.ToString() ?? "";

            tbReservationCustomer.Text = reservation?.customer ?? "";

            tbReservationNote.Text = reservation?.note ?? "";

        }

        //Metody ktere nam budou updatovat obsah overtime
        private void RefreshMeetingCentreListBox()
        {
            lbMC.Items.Refresh();
            lbMC.ItemsSource = meetingCentres;
            SelectedCentreFilling((MeetingCentre)lbMC.SelectedItem);
        }

        private void RefreshMeetingRoomListBox()
        {
            lbMR.Items.Refresh();
            lbMR.ItemsSource = GetRoomSource(selectedMC);
            SelectedRoomFilling((MeetingRoom)lbMR.SelectedItem);
        }

        private void RefreshReservationListBox()
        {
            MeetingRoom selectedMR = (MeetingRoom)cbMRReservation.SelectedItem;

            lbReservations.Items.Refresh();

            lbReservations.ItemsSource = reservations.Where(reservation => reservation.reservationDate == dpReservationDate.SelectedDate && reservation.meetingRoom.code == selectedMR.code);

            SelectedReservationFilling((Reservation)lbReservations.SelectedItem);
        }

        private List<MeetingRoom> GetRoomSource(MeetingCentre meetinCentre)
        {
            return meetingRooms.FindAll(mr => mr.meetingRoomCode == meetinCentre.code);
        }
        //Zmena obsahu po kliknuti na tab prehozeni okna
        private void TabSelectionChangeControl(object sender, SelectionChangedEventArgs xccea)
        {
            string itemTab = ((sender as TabControl).SelectedItem as TabItem).Header as string;
            switch (itemTab)
            {
                case "Reservations":
                    cbMCReservation.ItemsSource = meetingCentres;
                    break;
            }
        }


        private void lbMCSelection(object sender, SelectionChangedEventArgs kccea)
        {
            if(lbMC.SelectedItem != null)
            {
                selectedMC = (MeetingCentre)lbMC.SelectedItem;
                lbMR.ItemsSource = GetRoomSource(selectedMC);
                
            }
        }

        private void lbMRSelection (object sender, SelectionChangedEventArgs tccea)
        {
            if(lbMR.SelectedItem != null)
            {
                selectedMR = (MeetingRoom)lbMR.SelectedItem;
                SelectedRoomFilling(selectedMR);
            }
        }
        //combo box na vyber mistnosti
        private void cbMRReservationSelected(object sender, RoutedEventArgs tccea)
        {
            if(cbMRReservation.SelectedItem != null && cbMCReservation != null && dpReservationDate.SelectedDate != null)
            {
                RefreshReservationListBox();
            }
                
        }

        private void lbReservationsSelected(object sender, RoutedEventArgs tccea)
        {
            if(lbReservations.SelectedItem != null)
            {
                SelectedReservationFilling((Reservation)lbReservations.SelectedItem);
            }
        }


        //mr delete btn
        private void bMRDeleteClick (object sender, RoutedEventArgs tccea)
        {
            MeetingRoom removeRoom = meetingRooms.Find(room => room.code == selectedMR.code);
            meetingRooms.Remove(removeRoom);
            lbMR.ItemsSource = GetRoomSource(selectedMC);
            SelectedRoomFilling(null);
        }
        //Mc delete btn
        private void bMCDeleteClick(object sender, RoutedEventArgs tccea)
        {
            MeetingCentre removeMeetingCentre = meetingCentres.Find(centre => centre.code == selectedMC.code);
            meetingCentres.Remove(removeMeetingCentre);
            meetingRooms.RemoveAll(room => room.meetingRoomCode == selectedMC.code);
            lbMC.ItemsSource = meetingCentres;
            lbMC.Items.Refresh();
            SelectedCentreFilling(null);
            lbMR.ItemsSource = GetRoomSource(null);
            
        }

        private void bMCAddCick(object sender, RoutedEventArgs tccea)
        {
            MeetingCentreView viewCenterList = new MeetingCentreView(null, meetingCentres);
            RefreshMeetingCenterListEvent += new RefreshMeetingCenterList(RefreshMeetingCentreListBox);
            viewCenterList.update = RefreshMeetingCenterListEvent;
            viewCenterList.Show();
        }

        private void bMCEditClick(object sender, RoutedEventArgs tccea)
        {
            MeetingCentreView viewMeetingCentreUdate = new MeetingCentreView(selectedMC, meetingCentres);
            RefreshMeetingCenterListEvent += new RefreshMeetingCenterList(RefreshMeetingCentreListBox);
            viewMeetingCentreUdate.update = RefreshMeetingCenterListEvent;
            viewMeetingCentreUdate.Show();
        }
        
        private void bMRAddClick(object sender, RoutedEventArgs tccea)
        {
            if (selectedMC != null)
            {
                MeetingRoomView viewRoomList = new MeetingRoomView(meetingRooms, null, selectedMC);
                RefreshMeetingRoomListEvent += new RefreshMeetingRoomList(RefreshMeetingRoomListBox);
                viewRoomList.roomUpdate = RefreshMeetingRoomListEvent;
                viewRoomList.Show();
            }
            else
            {
                MessageBox.Show("You have to choose a centre first");
            }

        }

        //Metoda na export dat do json
        private void bReservationExportClick(object sender, RoutedEventArgs eccea)
        {
            try
            {
                SaveFileDialog saveFile = new SaveFileDialog();
                saveFile.DefaultExt = "json";
                saveFile.AddExtension = true;
                saveFile.Filter = "JSON Files (*.json)|*.json";
                if(saveFile.ShowDialog() == true)
                {
                    jsonWriter.SaveJSON(reservations, meetingRooms, saveFile.FileName);
                    MessageBox.Show("Date were successfully exported", "Thank you", MessageBoxButton.OK, MessageBoxImage.Information);

                }
            }catch(Exception alert)
            {
                MessageBox.Show(alert.Message);
            }
        }


        private void bMREditClick(object sender, RoutedEventArgs tccea)
        {
            if(selectedMC != null)
            {
                MeetingRoomView viewRoomList = new MeetingRoomView(meetingRooms, selectedMR, selectedMC);
                RefreshMeetingRoomListEvent += new RefreshMeetingRoomList(RefreshMeetingRoomListBox);
                viewRoomList.roomUpdate = RefreshMeetingRoomListEvent;
                viewRoomList.Show();
            }
            else
            {
                MessageBox.Show("You have to select room first!");
            }
        }


        //save data for next session
        private void MenuItemSave_Click(object sender, RoutedEventArgs tccea)
        {
            csvWriter.SaveData(meetingCentres, meetingRooms);
            xmlSerializer.XMLSerialization<Reservation>(reservations);
            MessageBox.Show("Data saved successfully", "Sucess!", MessageBoxButton.OK, MessageBoxImage.Information);
        }

        //ukonceni programu a dotazani na ulozeni dat
        private void CloseMainWindow(object sender, System.ComponentModel.CancelEventArgs xccea)
        {
            IEnumerable<MeetingRoom> changeOfAMeetingRooms = meetingRooms.Except(lastMeetingRoom, new MeetingRoomComparer());
            IEnumerable<MeetingCentre> changeOfMeetingCentre = meetingCentres.Except(lastMeetingCentre, new MeetingCentreComparer());

            if((changeOfAMeetingRooms.ToList().Count != 0 || changeOfMeetingCentre.ToList().Count != 0 ||
                meetingCentres.Count != lastMeetingCentre.Count || meetingRooms.Count != lastMeetingRoom.Count
                || dataChange == true))
            {
                MessageBoxResult userAnswer = MessageBox.Show("Do you want to save?", "Thank you", MessageBoxButton.YesNoCancel, MessageBoxImage.Question);
                if(userAnswer == MessageBoxResult.Yes)
                {
                    csvWriter.SaveData(meetingCentres, meetingRooms);
                    xmlSerializer.XMLSerialization<Reservation>(reservations);
                }
                if(userAnswer == MessageBoxResult.No)
                {
                    Application.Current.Shutdown();
                }
            }
        }

        private void ReservationManagerView(Reservation active)
        {
            if(cbMCReservation.SelectedItem != null && cbMRReservation.SelectedItem != null && dpReservationDate.SelectedDate != null)
            {
                ReservationView reservationView = new ReservationView(reservations, (MeetingRoom)cbMRReservation.SelectedItem, (MeetingCentre)cbMCReservation.SelectedItem,
                    (DateTime)dpReservationDate.SelectedDate, active);
                RefreshReservationListEvent += new RefreshReservationList(RefreshReservationListBox);
                reservationView.reservationUpdate = RefreshReservationListEvent;
                reservationView.Show();
            }
            else
            {
                MessageBox.Show("You should select Centre, Room and Date before you procceed!");
            }
        }

        private void cbMCReservationSelected(object sender, RoutedEventArgs cbxxcea)
        {
            cbMRReservation.ItemsSource = GetRoomSource((MeetingCentre)cbMCReservation.SelectedItem);
            
        }

        private void dpReservationDateSelected(object sender, RoutedEventArgs dxccea)
        {
            if(cbMRReservation.SelectedItem != null && cbMCReservation != null && dpReservationDate.SelectedDate != null)
            {
                RefreshReservationListBox();
            }
        }
        

        private void bReservationAddClick(object sender, RoutedEventArgs accea)
        {
            ReservationManagerView(null);
        }


        private void bReservationEditClick(object sender, RoutedEventArgs tccea)
        {
            ReservationManagerView((Reservation)lbReservations.SelectedItem);
        }

        private void bReservationDeleteClick(object sender, RoutedEventArgs tccea)
        {
            reservations.Remove((Reservation)lbReservations.SelectedItem);
            SelectedReservationFilling(null);
            RefreshReservationListBox();
        }







    }
}
