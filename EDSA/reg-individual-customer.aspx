<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="reg-individual-customer.aspx.cs" Inherits="EDSA.reg_individual_customer" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Individual Customer</title>
    <link href="Content/kendo/2020.1.406/kendo.bootstrap-v4.min.css" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/Site.css" rel="stylesheet" />
    <link href="Scripts/toastr/toastr.min.css" rel="stylesheet" />
    <script src="Scripts/kendo/2020.1.406/jquery.min.js"></script>
    <script src="Scripts/kendo/2020.1.406/angular.min.js"></script>
    <script src="Scripts/kendo/2020.1.406/jszip.min.js"></script>
    <script src="Scripts/kendo/2020.1.406/kendo.all.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Scripts/RadStyles.css" rel="stylesheet" />
    <script src="Scripts/RadScripts.js"></script>
    <script src="Scripts/toastr/toastr.min.js"></script>
    <script src="Scripts/Edsa.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" />
        <div class="demo-container">
            <div class="wizardHeader">
                <h4>Individual Customer</h4>
            </div>
            <telerik:RadWizard RenderMode="Lightweight" ID="RadWizard1" runat="server" Height="420px" OnClientLoad="OnClientLoad" OnClientButtonClicking="OnClientButtonClicking">
                <WizardSteps>
                    <telerik:RadWizardStep ID="RadWizardStep1" Title="Personal Info" runat="server" StepType="Start" ValidationGroup="accountInfo" CausesValidation="true">
                        <div class="inputWapper first">
                            <asp:Label Text="First Name: *" runat="server" AssociatedControlID="FirstNameTextBox" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="FirstNameTextBox" runat="server" ValidationGroup="accountInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="UserNameTextBoxRequiredFieldValidator" runat="server" ControlToValidate="FirstNameTextBox" EnableClientScript="true" ValidationGroup="accountInfo" ForeColor="red" ErrorMessage="required field" CssClass="validator"></asp:RequiredFieldValidator>

                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Middle Name:" runat="server" AssociatedControlID="MiddleNameTextBox" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="MiddleNameTextBox" runat="server" ValidationGroup="accountInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>

                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Last Name: *" runat="server" AssociatedControlID="LastNameTextBox" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="LastNameTextBox" runat="server" ValidationGroup="accountInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="LastNameTextBox" EnableClientScript="true" ValidationGroup="accountInfo" ForeColor="red" ErrorMessage="required field" CssClass="validator"></asp:RequiredFieldValidator>

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
                            <asp:Label Text="Address: *" runat="server" AssociatedControlID="Address" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="Address" runat="server" ValidationGroup="personalInfo" Width="320px" TextMode="MultiLine" Rows="3" Wrap="true" CssClass="k-textbox"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="LastNameRequiredFieldValidator" runat="server" ControlToValidate="Address" EnableClientScript="true" ValidationGroup="personalInfo" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </telerik:RadWizardStep>

                    <telerik:RadWizardStep Title="Other Details" runat="server" StepType="Step" ValidationGroup="ContactDetails">
                        <div class="inputWapper first">
                            <asp:Label Text="ID No: *" runat="server" AssociatedControlID="IDNo" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="IDNo" runat="server" ValidationGroup="ContactDetails" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="IDNoRequiredFieldValidator" runat="server" ControlToValidate="IDNo" EnableClientScript="true" ValidationGroup="ContactDetails" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Identification Type: *" runat="server" AssociatedControlID="IdentificationTypeDropDownList" />
                            <telerik:RadDropDownList RenderMode="Lightweight" ID="IdentificationTypeDropDownList" runat="server" Width="320px">
                                <Items>
                                    <telerik:DropDownListItem Text="" Value="0" />
                                    <telerik:DropDownListItem Text="Passport" Value="1" />
                                    <telerik:DropDownListItem Text="National ID" Value="2" />
                                    <telerik:DropDownListItem Text="Driver's License" Value="3" />
                                    <telerik:DropDownListItem Text="Voter's ID" Value="4" />
                                    <telerik:DropDownListItem Text="Other" Value="5" />
                                </Items>
                            </telerik:RadDropDownList>
                            <asp:RequiredFieldValidator ID="IdentificationTypeRequiredFieldValidator" runat="server" ControlToValidate="IdentificationTypeDropDownList" EnableClientScript="true" ValidationGroup="ContactDetails" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Type of Premise: *" runat="server" AssociatedControlID="PremiseDropDownList" />
                            <telerik:RadDropDownList RenderMode="Lightweight" ID="PremiseDropDownList" runat="server" Width="320px">
                                <Items>
                                    <telerik:DropDownListItem Text="" Value="0" />
                                    <telerik:DropDownListItem Text="Private Single" Value="1" />
                                    <telerik:DropDownListItem Text="Flat" Value="2" />
                                    <telerik:DropDownListItem Text="Other" Value="3" />
                                </Items>
                            </telerik:RadDropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="PremiseDropDownList" EnableClientScript="true" ValidationGroup="ContactDetails" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <br />
                        <div class="inputWapper">
                            <asp:Label Text="Username: *" runat="server" AssociatedControlID="Username" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="Username" runat="server" ValidationGroup="ContactDetails" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="UsernameRequiredFieldValidator" runat="server" ControlToValidate="Username" EnableClientScript="true" ValidationGroup="ContactDetails" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Password: *" runat="server" AssociatedControlID="Password" />
                            <telerik:RadTextBox TextMode="Password" RenderMode="Lightweight" ID="Password" runat="server" ValidationGroup="ContactDetails" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="PasswordRequiredFieldValidator" runat="server" ControlToValidate="Password" EnableClientScript="true" ValidationGroup="ContactDetails" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Confirm Password: *" runat="server" AssociatedControlID="CPassword" />
                            <telerik:RadTextBox TextMode="Password" RenderMode="Lightweight" ID="CPassword" runat="server" ValidationGroup="ContactDetails" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="CPasswordRequiredFieldValidator" runat="server" ControlToValidate="CPassword" EnableClientScript="true" ValidationGroup="ContactDetails" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </telerik:RadWizardStep>
                    <telerik:RadWizardStep StepType="Finish" Title="Confirmation" ValidationGroup="Confirmation">
                        <p>Make sure you review our anti-spam, privacy and terms of use policies before you create an account. We take spam very seriously and have a strict permission policy you and your clients will need to abide by.</p>
                        <p class="anti-spam-policy">
                            <asp:CheckBox ID="AcceptTermsCheckBox" runat="server" Text="I agree to the terms of use and will abide by the anti-spam policy." CausesValidation="true" ValidationGroup="Confirmation" />
                            <asp:CustomValidator ID="AcceptTermsCheckBoxCustomValidator" runat="server"
                                EnableClientScript="true" ClientValidationFunction="AcceptTermsCheckBoxValidation" ValidationGroup="Confirmation"
                                ErrorMessage="Please agree to the anti-spam policy" Display="Dynamic"
                                CssClass="checkbox-validator" ForeColor="Red" />
                        </p>
                    </telerik:RadWizardStep>

                </WizardSteps>
            </telerik:RadWizard>
        </div>
    </form>
</body>
</html>
<script type="text/javascript">
    $(document).ready(function () {
        $('.rwzFinish').click(function () {
            if ($('#AcceptTermsCheckBox').is(":checked")) {
                // Check if passowrd do not match...
                var password = $('#Password').val();
                var cpassword = $('#CPassword').val();
                if (password != cpassword) {
                    toastr.error("Password do not match.", "Error");
                } else {
                    // Get Premise type
                    var PremiseDropDown = $find("<%=PremiseDropDownList.ClientID %>");
                    // Get Identification type
                    var Identification = $find("<%=IdentificationTypeDropDownList.ClientID %>");
                    // Populate Json Object.
                    var UserObj = {
                        FirstName: $('#FirstNameTextBox').val(),
                        MiddleName: $('#MiddleNameTextBox').val(),
                        LastName: $('#LastNameTextBox').val(),
                        Address: $('#Address').val(),
                        TelNo: $('#TelephoNo').val(),
                        IdentificationType: Identification.get_selectedItem().get_text(),
                        IDNo: $('#IDNo').val(),
                        TypeOfPremise: PremiseDropDown.get_selectedItem().get_text(),
                        username: $('#Username').val(),
                        password: $('#Password').val()
                    }
                    // Save
                    EdsaApp.GetAddIndCustomer(UserObj);
                }
            }
        });
    });
</script>
