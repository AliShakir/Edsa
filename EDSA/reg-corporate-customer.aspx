<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reg-corporate-customer.aspx.cs" Inherits="EDSA.reg_corporate_customer" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Corporate Customer</title>
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
            <div class="wizardHeader"><h4>Corporate Customer</h4></div>
            <telerik:RadWizard RenderMode="Lightweight" ID="RadWizard1" runat="server" Height="420px" OnClientLoad="OnClientLoad" OnClientButtonClicking="OnClientButtonClicking">
                <WizardSteps>
                    <telerik:RadWizardStep ID="RadWizardStep1" Title="Personal Info" runat="server" StepType="Start" ValidationGroup="accountInfo" CausesValidation="true">
                        <div class="inputWapper first">
                            <asp:Label Text="Registered Name:" runat="server" AssociatedControlID="RegisteredNameTextBox" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="RegisteredNameTextBox" runat="server" ValidationGroup="accountInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                        </div>
                    </telerik:RadWizardStep>
                    <telerik:RadWizardStep Title="Contact Details" runat="server" StepType="Step" ValidationGroup="personalInfo">
                        <div class="inputWapper first">
                            <asp:Label Text="Telepho No: *" runat="server" AssociatedControlID="TelephoNo" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="TelephoNo" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="FirstNameRequiredFieldValidator" runat="server" ControlToValidate="TelephoNo" EnableClientScript="true" ValidationGroup="personalInfo" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <br />
                        <div class="inputWapper">
                            <asp:Label Text="Business Address: *" runat="server" AssociatedControlID="Address" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="Address" runat="server" ValidationGroup="personalInfo" Width="320px" TextMode="MultiLine" Rows="3" Wrap="true" CssClass="k-textbox"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="LastNameRequiredFieldValidator" runat="server" ControlToValidate="Address" EnableClientScript="true" ValidationGroup="personalInfo" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </telerik:RadWizardStep>
                    <telerik:RadWizardStep Title="Other Details" runat="server" StepType="Finish" ValidationGroup="ContactDetails">
                        <div class="inputWapper first">
                             <asp:Label Text="Organisation Type:" runat="server" AssociatedControlID="OrganisationTypeDropDownList" />
                            <telerik:RadDropDownList RenderMode="Lightweight" ID="OrganisationTypeDropDownList" runat="server" Width="320px">
                                <Items>
                                    <telerik:DropDownListItem Text="" Value="0" />
                                    <telerik:DropDownListItem Text="SME" Value="1" />
                                    <telerik:DropDownListItem Text="Large" Value="2" />
                                    <telerik:DropDownListItem Text="Non Profit" Value="3" />
                                    <telerik:DropDownListItem Text="Diplomatic" Value="4" />
                                    <telerik:DropDownListItem Text="Government" Value="5" />
                                    <telerik:DropDownListItem Text="Other" Value="6" />
                                </Items>
                            </telerik:RadDropDownList>                            
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Business Category:" runat="server" AssociatedControlID="BusinessCategoryDropDownList" />
                            <telerik:RadDropDownList RenderMode="Lightweight" ID="BusinessCategoryDropDownList" runat="server" Width="320px">
                                <Items>
                                    <telerik:DropDownListItem Text="" Value="0" />
                                    <telerik:DropDownListItem Text="Trading" Value="1" />
                                    <telerik:DropDownListItem Text="Industry" Value="2" />
                                    <telerik:DropDownListItem Text="Services" Value="3" />
                                    <telerik:DropDownListItem Text="Government Administration" Value="4" />
                                    <telerik:DropDownListItem Text="Other" Value="5" />
                                </Items>
                            </telerik:RadDropDownList>
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Registeration ID No: *" runat="server" AssociatedControlID="IDNo" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="IDNo" runat="server" ValidationGroup="ContactDetails" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Type of Premise: *" runat="server" AssociatedControlID="GenderDropDownList" />
                            <telerik:RadDropDownList RenderMode="Lightweight" ID="GenderDropDownList" runat="server" Width="320px">
                                <Items>
                                    <telerik:DropDownListItem Text="" Value="0" />
                                    <telerik:DropDownListItem Text="Private Single" Value="1" />
                                    <telerik:DropDownListItem Text="Flat" Value="2" />
                                    <telerik:DropDownListItem Text="Other" Value="3" />
                                </Items>
                            </telerik:RadDropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="GenderDropDownList" EnableClientScript="true" ValidationGroup="ContactDetails" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </telerik:RadWizardStep>

                    <%--<telerik:RadWizardStep StepType="Finish" Title="Confirmation" ValidationGroup="Confirmation">
                    <p>Make sure you review our anti-spam, privacy and terms of use policies before you create an account. We take spam very seriously and have a strict permission policy you and your clients will need to abide by.</p>
                    <p class="anti-spam-policy">
                        <asp:CheckBox ID="AcceptTermsCheckBox" runat="server" Text="I agree to the terms of use and will abide by the anti-spam policy." CausesValidation="true" ValidationGroup="Confirmation" />
                        <asp:CustomValidator ID="AcceptTermsCheckBoxCustomValidator" runat="server"
                            EnableClientScript="true" ClientValidationFunction="AcceptTermsCheckBoxValidation" ValidationGroup="Confirmation"
                            ErrorMessage="Please agree to the anti-spam policy" Display="Dynamic"
                            CssClass="checkbox-validator" ForeColor="Red" />
                    </p>
                </telerik:RadWizardStep> 
                <telerik:RadWizardStep runat="server" StepType="Complete" CssClass="complete">
                    <p>Congratulations, you have registered successfully!</p>
                    <telerik:RadButton RenderMode="Lightweight" ID="NewRegistrationButton" runat="server"  OnClick="NewRegistrationButton_Click" Text="Create a new registration"></telerik:RadButton>
                </telerik:RadWizardStep>--%>
                </WizardSteps>
            </telerik:RadWizard>
        </div>
    </form>
</body>
</html>
