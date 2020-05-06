<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reg-meter.aspx.cs" Inherits="EDSA.reg_meter" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register Meter</title>
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
            <div class="wizardHeader"><h4>Register Meter</h4></div>
            <telerik:RadWizard RenderMode="Lightweight" ID="RadWizard1" runat="server" Height="420px" OnClientLoad="OnClientLoad" OnClientButtonClicking="OnClientButtonClicking">
                <WizardSteps>
                    <telerik:RadWizardStep ID="RadWizardStep1" Title="Meter Info" runat="server" StepType="Start" ValidationGroup="accountInfo" CausesValidation="true">
                        <div class="inputWapper first">
                            <asp:Label Text="Brand Name:" runat="server" AssociatedControlID="BrandName" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="BrandName" runat="server" ValidationGroup="accountInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="BrandNameRequiredFieldValidator" runat="server" ControlToValidate="BrandName" EnableClientScript="true" ValidationGroup="personalInfo" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Meter Type: *" runat="server" AssociatedControlID="MeterTypeDropDownList" />
                            <telerik:RadDropDownList RenderMode="Lightweight" ID="MeterTypeDropDownList" runat="server" Width="320px">
                                <Items>
                                    <telerik:DropDownListItem Text="" Value="0" />
                                    <telerik:DropDownListItem Text="Single Phase" Value="1" />
                                    <telerik:DropDownListItem Text="3 Phase" Value="2" />
                                </Items>
                            </telerik:RadDropDownList>
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Serial No:" runat="server" AssociatedControlID="SerialNo" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="SerialNo" runat="server" ValidationGroup="accountInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="SerialNoRequiredFieldValidator" runat="server" ControlToValidate="SerialNo" EnableClientScript="true" ValidationGroup="personalInfo" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </telerik:RadWizardStep>
                    <telerik:RadWizardStep Title="Manufactur Details" runat="server" StepType="Step" ValidationGroup="personalInfo">
                        <div class="inputWapper first">
                            <asp:Label Text="Manufacturer: *" runat="server" AssociatedControlID="Manufacturer" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="Manufacturer" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="ManufacturerRequiredFieldValidator" runat="server" ControlToValidate="Manufacturer" EnableClientScript="true" ValidationGroup="personalInfo" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                         <div class="inputWapper">
                            <asp:Label Text="Manufactur Year: *" runat="server" AssociatedControlID="ManufacturYear" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="ManufacturYear" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="ManufacturYearRequiredFieldValidator" runat="server" ControlToValidate="ManufacturYear" EnableClientScript="true" ValidationGroup="personalInfo" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </telerik:RadWizardStep>
                    <telerik:RadWizardStep Title="Vendor Details" runat="server" StepType="Finish" ValidationGroup="ContactDetails">
                        <div class="inputWapper first">
                            <asp:Label Text="Vendor: *" runat="server" AssociatedControlID="Vendor" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="Vendor" runat="server" ValidationGroup="ContactDetails" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="VendorRequiredFieldValidator" runat="server" ControlToValidate="Vendor" EnableClientScript="true" ValidationGroup="ContactDetails" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div> 
                        <div class="inputWapper">
                            <asp:Label Text="Vending Price: *" runat="server" AssociatedControlID="VendingPrice" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="VendingPrice" runat="server" ValidationGroup="ContactDetails" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="VendingPriceRequiredFieldValidator" runat="server" ControlToValidate="VendingPrice" EnableClientScript="true" ValidationGroup="ContactDetails" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div> 
                    </telerik:RadWizardStep>
                </WizardSteps>
            </telerik:RadWizard>
        </div>
    </form>
</body>
</html>
