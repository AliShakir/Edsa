<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reg-vendor.aspx.cs" Inherits="EDSA.reg_vendor" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register Vendor</title>
    <link href="Content/kendo/2020.1.406/kendo.bootstrap-v4.min.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <script src="Scripts/kendo/2020.1.406/jquery.min.js"></script>
    <script src="Scripts/kendo/2020.1.406/angular.min.js"></script>
    <script src="Scripts/kendo/2020.1.406/jszip.min.js"></script>
    <script src="Scripts/kendo/2020.1.406/kendo.all.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Scripts/RadStyles.css" rel="stylesheet" />
    <script src="Scripts/RadScripts.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" />
        <div class="demo-container">
            <div class="wizardHeader"><h4>Register Vendor</h4></div>
            <telerik:RadWizard RenderMode="Lightweight" ID="RadWizard1" runat="server" Height="420px" OnClientLoad="OnClientLoad" OnClientButtonClicking="OnClientButtonClicking">
                <WizardSteps>
                    <telerik:RadWizardStep ID="RadWizardStep1" Title="Personal Info" runat="server" StepType="Start" ValidationGroup="accountInfo" CausesValidation="true">
                        <div class="inputWapper first">
                            <asp:Label Text="Registerd Name:" runat="server" AssociatedControlID="RegisterdName" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="RegisterdName" runat="server" ValidationGroup="accountInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                        </div>
                    </telerik:RadWizardStep>
                    <telerik:RadWizardStep Title="Contact Details" runat="server" StepType="Step" ValidationGroup="personalInfo">
                        <div class="inputWapper first">
                            <asp:Label Text="Telepho No: *" runat="server" AssociatedControlID="TelephoNo" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="TelephoNo" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="FirstNameRequiredFieldValidator" runat="server" ControlToValidate="TelephoNo" EnableClientScript="true" ValidationGroup="personalInfo" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                         <div class="inputWapper">
                            <asp:Label Text="Email: *" runat="server" AssociatedControlID="Email" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="Email" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="EmailRequiredFieldValidator" runat="server" ControlToValidate="Email" EnableClientScript="true" ValidationGroup="personalInfo" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Contact Person: *" runat="server" AssociatedControlID="ContactPerson" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="ContactPerson" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="ContactPersonRequiredFieldValidator" runat="server" ControlToValidate="ContactPerson" EnableClientScript="true" ValidationGroup="personalInfo" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <br />
                        <div class="inputWapper">
                            <asp:Label Text="Address: *" runat="server" AssociatedControlID="Address" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="Address" runat="server" ValidationGroup="personalInfo" Width="320px" TextMode="MultiLine" Rows="3" Wrap="true" CssClass="k-textbox"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="LastNameRequiredFieldValidator" runat="server" ControlToValidate="Address" EnableClientScript="true" ValidationGroup="personalInfo" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </telerik:RadWizardStep>
                    <telerik:RadWizardStep Title="Other Details" runat="server" StepType="Finish" ValidationGroup="ContactDetails">
                        <div class="inputWapper first">
                            <asp:Label Text="Vending License Area Coverage *" runat="server" AssociatedControlID="LicenseArea" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="LicenseArea" runat="server" ValidationGroup="ContactDetails" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="LicenseAreaRequiredFieldValidator" runat="server" ControlToValidate="LicenseArea" EnableClientScript="true" ValidationGroup="ContactDetails" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>                        
                    </telerik:RadWizardStep>
                </WizardSteps>
            </telerik:RadWizard>
        </div>
    </form>
</body>
</html>
