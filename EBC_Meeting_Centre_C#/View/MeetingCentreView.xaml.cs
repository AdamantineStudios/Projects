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

namespace EBC_Meeting_Centre_Tomas_Jerousek.View
{
    /// <summary>
    /// Interaction logic for MeetingCentreView.xaml
    /// </summary>
    public partial class MeetingCentreView : Window
    {
        private MeetingCentre meetingCentre;
        private List<MeetingCentre> meetingCentres = new List<MeetingCentre>();
        private ValidateMeetingCentre validator = new ValidateMeetingCentre();
        public Delegate update;

        public MeetingCentreView(MeetingCentre meetingCentre, List<MeetingCentre> meetingCentres)
        {
            InitializeComponent();

            this.meetingCentre = meetingCentre;
            this.meetingCentres = meetingCentres;

            tbNameMC.Text = meetingCentre?.name ?? String.Empty;
            tbCoodeMC.Text = meetingCentre?.code ?? String.Empty;
            tbDescriptionMC.Text = meetingCentre?.description ?? String.Empty;
            
        }
        private void bCancelClick(object sender, RoutedEventArgs xs)
        {
            this.Close();
        }

        private void bConfirmClick(object sender, RoutedEventArgs xs)
        {
            MeetingCentre meetinCentre = new MeetingCentre(tbNameMC.Text, tbCoodeMC.Text, tbDescriptionMC.Text);
            try
            {
                validator.Validate(meetinCentre);
                if(meetingCentre == null)
                {
                    meetingCentres.Add(new MeetingCentre(tbNameMC.Text, tbCoodeMC.Text, tbDescriptionMC.Text));
                }
                else
                {
                    MeetingCentre editCentre = meetingCentres.Find(x => x.code == meetingCentre.code);
                    editCentre.code = tbCoodeMC.Text;
                    editCentre.name = tbNameMC.Text;
                    editCentre.description = tbDescriptionMC.Text;
                }
                update.DynamicInvoke();
                this.Close();
            }
            catch(ExceptionValidation xv)
            {
                MessageBox.Show(xv.Message);
            }
            catch(FormatException)
            {
                MessageBox.Show("Capacity has to be integer");
            }
            catch(Exception exc)
            {
                MessageBox.Show(exc.Message);
            }
        }
    }
}
