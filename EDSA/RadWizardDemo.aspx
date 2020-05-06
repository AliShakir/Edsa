<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RadWizardDemo.aspx.cs" Inherits="EDSA.RadWizardDemo" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Test Demo</title>
    <style>
        html .demo-container .redColor {
            color: red;
        }

        /*Wizard wrapper*/
        #example .demo-container {
            width: 725px;
            margin: 40px auto 80px;
            padding: 0 80px;
            border: 0;
            background: url(Images/shadow.png) no-repeat 0 bottom;
        }

        .demo-container .wizardHeader {
            width: 100%;
            height: 50px;
            background: url(Images/header.jpg) no-repeat 0 0;
        }

        /*Wizard*/
        .demo-container .RadWizard {
            padding: 20px;
            border: 1px solid #f1f1f1;
            border-bottom: 0;
            box-shadow: 0 0 0 1px #fff;
        }

        .background-black .demo-container .RadWizard,
        .background-blackmetrotouch .demo-container .RadWizard,
        .background-glow .demo-container .RadWizard,
        .background-office2010black .demo-container .RadWizard {
            border: 0;
            box-shadow: 0;
        }

        .demo-container .RadWizard_Material .rwzBreadCrumb .rwzText:before {
            display: none;
        }

        .demo-container .RadWizard_Material .rwzBreadCrumb .rwzLink {
            padding-left: 0;
        }


        .rwzImage {
            background-image: url(Images/bread-crumb-icons.png);
        }

        html .RadWizard .rwzBreadCrumb span.rwzImage {
            width: 24px;
            height: 24px;
        }

        .demo-container .accountInfo.rwzImage {
            background-position: 0 0;
        }

        .demo-container .rwzSelected .accountInfo.rwzImage {
            background-position: -25px 0;
        }

        .demo-container .rwzDisabled .accountInfo.rwzImage {
            background-position: -50px 0;
        }


        .demo-container .personalInfo.rwzImage {
            background-position: 0 -25px;
        }

        .demo-container .rwzSelected .personalInfo.rwzImage {
            background-position: -25px -25px;
        }

        .demo-container .rwzDisabled .personalInfo.rwzImage {
            background-position: -50px -25px;
        }


        .demo-container .contactDetails.rwzImage {
            background-position: 0 -50px;
        }

        .demo-container .rwzSelected .contactDetails.rwzImage {
            background-position: -25px -50px;
        }

        .demo-container .rwzDisabled .contactDetails.rwzImage {
            background-position: -50px -50px;
        }


        .demo-container .confirmation.rwzImage {
            background-position: 0 -75px;
        }

        .demo-container .rwzSelected .confirmation.rwzImage {
            background-position: -25px -75px;
        }

        .demo-container .rwzDisabled .confirmation.rwzImage {
            background-position: -50px -75px;
        }


        .demo-container .RadWizard .rwzContent {
            overflow: hidden;
            background-color: #f5f5f6;
            line-height: 2em;
            margin: 0 -20px;
            padding: 0 20px;
        }

        .background-black .demo-container .rwzContent,
        .background-blackmetrotouch .demo-container .rwzContent,
        .background-glow .demo-container .rwzContent,
        .background-office2010black .demo-container .rwzContent {
            background-color: transparent;
            background-color: rgba(255,255,255,0.1);
        }

        .background-silver .demo-container .rwzContent {
            background-color: transparent;
            background-color: rgba(255,255,255,0.5);
        }

        .background-sunset .demo-container .rwzContent {
            background: #f9f5f0;
        }

        /*Wizard content*/
        .demo-container .inputWapper {
            display: inline-block;
            *display: inline;
            width: 320px;
            position: relative;
            zoom: 1;
            margin-right: 35px;
        }

            .demo-container .inputWapper.first {
                margin-right: 35px;
            }

            .demo-container .inputWapper label {
                display: block;
                margin: 5px 0 0;
            }

        .demo-container .validator {
            color: #ff0000;
            position: absolute;
            top: 10px;
            right: 0;
        }

        .demo-container .anti-spam-policy {
            margin-top: 40px;
        }

        .demo-container .conditions {
            display: block;
            color: #a7a7a7;
            font-size: 0.857em;
        }

        .demo-container .inputWapper.date .riLabel {
            position: absolute;
        }

        .demo-container .RadWizard .rwzStep {
            height: 100%;
            position: relative;
        }

        .demo-container .RadWizard.rwzComplete {
            padding-top: 95px;
        }

        .demo-container .rwzStep p {
            margin: 0;
            padding: 10px 0;
        }

        .demo-container .RadWizard .complete {
            height: auto;
            padding: 75px 0;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
         <asp:ScriptManager runat="server" />
    <div class="demo-container">
        <div class="wizardHeader"></div>
        <telerik:RadWizard RenderMode="Lightweight" ID="RadWizard1" runat="server"  Height="420px" OnClientLoad="OnClientLoad" OnClientButtonClicking="OnClientButtonClicking">
            <WizardSteps>
                <telerik:RadWizardStep ID="RadWizardStep1" Title="Personal Info" runat="server" StepType="Start" ValidationGroup="accountInfo" CausesValidation="true">
                    <div class="inputWapper first">
                        <asp:Label Text="First Name: *" runat="server" AssociatedControlID="FirstNameTextBox" />
                        <telerik:RadTextBox RenderMode="Lightweight" ID="FirstNameTextBox" runat="server"  ValidationGroup="accountInfo" Width="320px"></telerik:RadTextBox>
                        <asp:RequiredFieldValidator ID="UserNameTextBoxRequiredFieldValidator" runat="server" ControlToValidate="FirstNameTextBox" EnableClientScript="true" ValidationGroup="accountInfo" ForeColor="red" ErrorMessage="required field" CssClass="validator"></asp:RequiredFieldValidator>
                        
                    </div> 
                    <div class="inputWapper">
                        <asp:Label Text="Middle Name: *" runat="server" AssociatedControlID="MiddleNameTextBox" />
                        <telerik:RadTextBox RenderMode="Lightweight" ID="MiddleNameTextBox" runat="server"  ValidationGroup="accountInfo" Width="320px"></telerik:RadTextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="MiddleNameTextBox" EnableClientScript="true" ValidationGroup="accountInfo" ForeColor="red" ErrorMessage="required field" CssClass="validator"></asp:RequiredFieldValidator>
                        
                    </div>
                    <div class="inputWapper">
                        <asp:Label Text="Last Name: *" runat="server" AssociatedControlID="LastNameTextBox" />
                        <telerik:RadTextBox RenderMode="Lightweight" ID="LastNameTextBox" runat="server"  ValidationGroup="accountInfo" Width="320px"></telerik:RadTextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="LastNameTextBox" EnableClientScript="true" ValidationGroup="accountInfo" ForeColor="red" ErrorMessage="required field" CssClass="validator"></asp:RequiredFieldValidator>
                        
                    </div>
                </telerik:RadWizardStep> 
                <telerik:RadWizardStep Title="Contact Details" runat="server" StepType="Step" ValidationGroup="personalInfo">
                    <div class="inputWapper first">
                        <asp:Label Text="Telepho No: *" runat="server" AssociatedControlID="TelephoNo" />
                        <telerik:RadTextBox RenderMode="Lightweight" ID="TelephoNo" runat="server"  ValidationGroup="personalInfo" Width="320px"></telerik:RadTextBox>
                        <asp:RequiredFieldValidator ID="FirstNameRequiredFieldValidator" runat="server" ControlToValidate="TelephoNo" EnableClientScript="true" ValidationGroup="personalInfo" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <br />
                    <div class="inputWapper">
                        <asp:Label Text="Address: *" runat="server" AssociatedControlID="Address" />
                        <telerik:RadTextBox RenderMode="Lightweight" ID="Address" runat="server"  ValidationGroup="personalInfo" Width="320px" TextMode="MultiLine" Rows="3" Wrap="true"></telerik:RadTextBox>
                        <asp:RequiredFieldValidator ID="LastNameRequiredFieldValidator" runat="server" ControlToValidate="Address" EnableClientScript="true" ValidationGroup="personalInfo" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </telerik:RadWizardStep>
 
                <telerik:RadWizardStep Title="Other Details" runat="server" StepType="Step" ValidationGroup="ContactDetails">
                    <div class="inputWapper first">
                        <asp:Label Text="ID No: *" runat="server" AssociatedControlID="IDNo" />
                        <telerik:RadTextBox RenderMode="Lightweight" ID="IDNo" runat="server"  ValidationGroup="ContactDetails" Width="320px"></telerik:RadTextBox>
                        <asp:RequiredFieldValidator ID="IDNoRequiredFieldValidator" runat="server" ControlToValidate="IDNo" EnableClientScript="true" ValidationGroup="ContactDetails" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="inputWapper">
                        <asp:Label Text="Identification Type: *" runat="server" AssociatedControlID="IdentificationType" />
                        <telerik:RadTextBox RenderMode="Lightweight" ID="IdentificationType" runat="server"  ValidationGroup="ContactDetails" Width="320px"></telerik:RadTextBox>
                        <asp:RequiredFieldValidator ID="IdentificationTypeRequiredFieldValidator" runat="server" ControlToValidate="IdentificationType" EnableClientScript="true" ValidationGroup="ContactDetails" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                    <div class="inputWapper">
                         <asp:Label Text="Specify your gender:" runat="server" AssociatedControlID="GenderDropDownList" />
                        <telerik:RadDropDownList RenderMode="Lightweight" ID="GenderDropDownList" runat="server"  Width="320px">
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
                <telerik:RadWizardStep runat="server" StepType="Complete" CssClass="complete">
                    <p>Congratulations, you have registered successfully!</p>
                    <telerik:RadButton RenderMode="Lightweight" ID="NewRegistrationButton" runat="server"  OnClick="NewRegistrationButton_Click" Text="Create a new registration"></telerik:RadButton>
                </telerik:RadWizardStep>
 
            </WizardSteps>
        </telerik:RadWizard>
    </div>
    </form>
</body>
</html>
<script>
    (function () {

        window.pageLoad = function () {
            var $ = $telerik.$;
            var cssSelectors = ["accountInfo", "personalInfo", "contactDetails", "confirmation"];
            var breadCrumbButtons = $(".rwzBreadCrumb .rwzLI");

            for (var i = 0; i < cssSelectors.length; i++) {
                $(breadCrumbButtons[i]).addClass(cssSelectors[i]);
            }
        }

        window.OnClientLoad = function (sender, args) {
            for (var i = 1; i < sender.get_wizardSteps().get_count(); i++) {
                sender.get_wizardSteps().getWizardStep(i).set_enabled(false);
            }
        }

        window.OnClientButtonClicking = function (sender, args) {
            if (!args.get_nextActiveStep().get_enabled()) {
                args.get_nextActiveStep().set_enabled(true);
            }
        }

        window.AcceptTermsCheckBoxValidation = function (source, args) {
            var termsChecked = $telerik.$("input[id*='AcceptTermsCheckBox']")[0].checked;
            args.IsValid = termsChecked;
        }

        window.UserNameLenghthValidation = function (source, args) {
            var userNameConditions = $telerik.$(".conditions")[0];
            var isValid = (args.Value.length >= 4 && args.Value.length <= 15);
            args.IsValid = isValid;
            $telerik.$(userNameConditions).toggleClass("redColor", !isValid);

        }

        window.PasswordLenghthValidation = function (source, args) {
            var passwordConditions = $telerik.$(".conditions")[1];
            var isValid = args.Value.length >= 6;
            args.IsValid = isValid;
            $telerik.$(passwordConditions).toggleClass("redColor", !isValid);
        }
    })();
</script>
