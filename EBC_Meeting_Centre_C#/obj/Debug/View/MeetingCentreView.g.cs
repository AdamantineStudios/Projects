#pragma checksum "..\..\..\View\MeetingCentreView.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "6CEDD0C6C5AEA8CBCC11567E611037CF963C17DD23B36954F65C560D9AA19076"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using EBC_Meeting_Centre_Tomas_Jerousek.View;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace EBC_Meeting_Centre_Tomas_Jerousek.View {
    
    
    /// <summary>
    /// MeetingCentreView
    /// </summary>
    public partial class MeetingCentreView : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        
        #line 13 "..\..\..\View\MeetingCentreView.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox tbNameMC;
        
        #line default
        #line hidden
        
        
        #line 15 "..\..\..\View\MeetingCentreView.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox tbCoodeMC;
        
        #line default
        #line hidden
        
        
        #line 17 "..\..\..\View\MeetingCentreView.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox tbDescriptionMC;
        
        #line default
        #line hidden
        
        
        #line 18 "..\..\..\View\MeetingCentreView.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button bCancelMC;
        
        #line default
        #line hidden
        
        
        #line 19 "..\..\..\View\MeetingCentreView.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button bConfirmMC;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/EBC_Meeting_Centre_Tomas_Jerousek;component/view/meetingcentreview.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\View\MeetingCentreView.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.tbNameMC = ((System.Windows.Controls.TextBox)(target));
            return;
            case 2:
            this.tbCoodeMC = ((System.Windows.Controls.TextBox)(target));
            return;
            case 3:
            this.tbDescriptionMC = ((System.Windows.Controls.TextBox)(target));
            return;
            case 4:
            this.bCancelMC = ((System.Windows.Controls.Button)(target));
            
            #line 18 "..\..\..\View\MeetingCentreView.xaml"
            this.bCancelMC.Click += new System.Windows.RoutedEventHandler(this.bCancelClick);
            
            #line default
            #line hidden
            return;
            case 5:
            this.bConfirmMC = ((System.Windows.Controls.Button)(target));
            
            #line 19 "..\..\..\View\MeetingCentreView.xaml"
            this.bConfirmMC.Click += new System.Windows.RoutedEventHandler(this.bConfirmClick);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

