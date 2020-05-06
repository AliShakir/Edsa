<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view-application.aspx.cs" Inherits="EDSA.view_application" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Applications</title>
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
    <style>
        .rwzContent{
            height: 500px !important;
        }
    </style>
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
                    <telerik:RadWizardStep ID="RadWizardStep1" Title="Applicant Info" runat="server" StepType="Start" ValidationGroup="accountInfo" CausesValidation="true">
                        <div class="inputWapper first">
                            <asp:Label Text="Full Name: *" runat="server" AssociatedControlID="FullName" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="FullName" runat="server" ValidationGroup="accountInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="UserNameTextBoxRequiredFieldValidator" runat="server" ControlToValidate="FullName" EnableClientScript="true" ValidationGroup="accountInfo" ForeColor="red" ErrorMessage="required field" CssClass="validator"></asp:RequiredFieldValidator>
                        </div>
                        <div class="inputWapper first">
                            <asp:Label Text="Telepho No: *" runat="server" AssociatedControlID="TelephoNo" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="TelephoNo" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="FirstNameRequiredFieldValidator" runat="server" ControlToValidate="TelephoNo" EnableClientScript="true" ValidationGroup="personalInfo" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="inputWapper first">
                            <asp:Label Text="ID No: *" runat="server" AssociatedControlID="IDNo" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="IDNo" runat="server" ValidationGroup="ContactDetails" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="IDNoRequiredFieldValidator" runat="server" ControlToValidate="IDNo" EnableClientScript="true" ValidationGroup="ContactDetails" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Identification Type:" runat="server" AssociatedControlID="IdentificationType" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="IdentificationType" runat="server" ValidationGroup="ContactDetails" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>                            
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Type Of Premise:" runat="server" AssociatedControlID="TypeOfPremise" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="TypeOfPremise" runat="server" ValidationGroup="ContactDetails" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>                                                        
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Address: *" runat="server" AssociatedControlID="Address" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="Address" runat="server" ValidationGroup="personalInfo" Width="320px" TextMode="MultiLine" Rows="3" Wrap="true" CssClass="k-textbox"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="LastNameRequiredFieldValidator" runat="server" ControlToValidate="Address" EnableClientScript="true" ValidationGroup="personalInfo" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                    </telerik:RadWizardStep>
                    <telerik:RadWizardStep Title="Installation Load" runat="server" StepType="Step" ValidationGroup="personalInfo">
                       <div class="table-responsive">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Lighting and Power Points</th>
                                        <th>Qty</th>
                                        <th>Rating(Kw)</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>   
                                        <td><telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox28" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox" Text="Light Points" ReadOnly="true"></telerik:RadTextBox></td>
                                        <td><telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox29" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox" Text="0"></telerik:RadTextBox></td>
                                        <td><telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox30" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox></td>                                       
                                    </tr>
                                    <tr>
                                        <td><telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox27" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox" Text="Lighting and Power Points" ReadOnly="true"></telerik:RadTextBox></td>
                                        <td><telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox25" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox" Text="0"></telerik:RadTextBox></td>
                                        <td><telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox26" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox></td>
                                    </tr>
                                </tbody>
                            </table>
                           <table>
                                <thead>
                                    <tr>
                                        <th>Equipment to be Installed</th>
                                        <th>Qty</th>
                                        <th>Rating(Kw)</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>  
                                        <td><telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox31" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox" Text="Air Condition" ReadOnly="true"></telerik:RadTextBox></td>
                                        <td><telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox32" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox" Text="0"></telerik:RadTextBox></td>
                                        <td><telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox33" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox></td>
                                    </tr>
                                    <tr>
                                        <td><telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox34" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox" Text="Electric Iron" ReadOnly="true"></telerik:RadTextBox></td>
                                        <td><telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox35" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox" Text="0"></telerik:RadTextBox></td>
                                        <td><telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox36" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox></td>
                                    </tr>
                                    <tr>
                                        <td><telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox37" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox" Text="Washing Machine" ReadOnly="true"></telerik:RadTextBox></td>
                                        <td><telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox38" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox" Text="0"></telerik:RadTextBox></td>
                                        <td><telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox39" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox></td>
                                    </tr>
                                    <tr>
                                        <td><telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox40" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox" Text="Electric Dryer" ReadOnly="true"></telerik:RadTextBox></td>
                                        <td><telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox41" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox" Text="0"></telerik:RadTextBox></td>
                                        <td><telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox42" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox></td>
                                    </tr>
                                    <tr>
                                        <td><telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox43" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox" Text="Electric Oven/Stove" ReadOnly="true"></telerik:RadTextBox></td>
                                        <td><telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox44" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox" Text="0"></telerik:RadTextBox></td>
                                        <td><telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox45" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox></td>
                                    </tr>
                                    <tr>
                                        <td><telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox46" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox" Text="Fridge/Freezer" ReadOnly="true"></telerik:RadTextBox></td>
                                        <td><telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox47" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox" Text="0"></telerik:RadTextBox></td>
                                        <td><telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox48" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox></td>
                                    </tr>
                                    <tr>
                                        <td><telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox49" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox" Text="Electric Fans" ReadOnly="true"></telerik:RadTextBox></td>
                                        <td><telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox50" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox" Text="0"></telerik:RadTextBox></td>
                                        <td><telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox51" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox></td>
                                    </tr>
                                    <tr>
                                        <td><telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox52" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox" Text="Electric Bulbs" ReadOnly="true"></telerik:RadTextBox></td>
                                        <td><telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox53" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox" Text="0"></telerik:RadTextBox></td>
                                        <td><telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox54" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox></td>
                                    </tr>
                                    <tr>
                                        <td><telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox55" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox" Text="Computers/Servers" ReadOnly="true"></telerik:RadTextBox></td>
                                        <td><telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox56" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox" Text="0"></telerik:RadTextBox></td>
                                        <td><telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox57" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </telerik:RadWizardStep>

                    <telerik:RadWizardStep Title="Other Details" runat="server" StepType="Step" ValidationGroup="ContactDetails">
                    <div class="inputWapper first">
                            <asp:Label Text="Property Owner Name: *" runat="server" AssociatedControlID="FullName" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox1" runat="server" ValidationGroup="accountInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="FullName" EnableClientScript="true" ValidationGroup="accountInfo" ForeColor="red" ErrorMessage="required field" CssClass="validator"></asp:RequiredFieldValidator>
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Account No: *" runat="server" AssociatedControlID="TelephoNo" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox2" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TelephoNo" EnableClientScript="true" ValidationGroup="personalInfo" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Tariff: *" runat="server" AssociatedControlID="TelephoNo" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox3" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TelephoNo" EnableClientScript="true" ValidationGroup="personalInfo" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Area: *" runat="server" AssociatedControlID="TelephoNo" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox4" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TelephoNo" EnableClientScript="true" ValidationGroup="personalInfo" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Number: *" runat="server" AssociatedControlID="TelephoNo" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox5" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TelephoNo" EnableClientScript="true" ValidationGroup="personalInfo" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Supply Required: *" runat="server" AssociatedControlID="RadDropDownList1" />
                            <telerik:RadDropDownList RenderMode="Lightweight" ID="RadDropDownList1" runat="server" Width="320px">
                                <Items>
                                    <telerik:DropDownListItem Text="" Value="0" />
                                    <telerik:DropDownListItem Text="NC" Value="1" />
                                    <telerik:DropDownListItem Text="SM" Value="2" />
                                    <telerik:DropDownListItem Text="TS" Value="3" />
                                    <telerik:DropDownListItem Text="RWMR" Value="4" />
                                    <telerik:DropDownListItem Text="AWMR" Value="5" />
                                    <telerik:DropDownListItem Text="CT" Value="6" />
                                    <telerik:DropDownListItem Text="CTMR" Value="7" />
                                </Items>
                            </telerik:RadDropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="RadDropDownList1" EnableClientScript="true" ValidationGroup="ContactDetails" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Registration No: *" runat="server" AssociatedControlID="TelephoNo" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox6" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TelephoNo" EnableClientScript="true" ValidationGroup="personalInfo" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Approved By: *" runat="server" AssociatedControlID="TelephoNo" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox7" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TelephoNo" EnableClientScript="true" ValidationGroup="personalInfo" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Registered Date: *" runat="server" AssociatedControlID="TelephoNo" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox8" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="PRM No: *" runat="server" AssociatedControlID="TelephoNo" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox9" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Supply Type: *" runat="server" AssociatedControlID="TelephoNo" />
                            <telerik:RadDropDownList RenderMode="Lightweight" ID="RadDropDownList2" runat="server" Width="320px">
                                <Items>
                                    <telerik:DropDownListItem Text="" Value="0" />
                                    <telerik:DropDownListItem Text="Single Phase" Value="1" />
                                    <telerik:DropDownListItem Text="Three Phase" Value="2" />
                                </Items>
                            </telerik:RadDropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="RadDropDownList3" EnableClientScript="true" ValidationGroup="ContactDetails" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Premised Inspected By: *" runat="server" AssociatedControlID="TelephoNo" />
                            <telerik:RadDropDownList RenderMode="Lightweight" ID="RadDropDownList3" runat="server" Width="320px">
                                <Items>
                                    <telerik:DropDownListItem Text="" Value="0" />
                                    <telerik:DropDownListItem Text="Shakir" Value="1" />
                                    <telerik:DropDownListItem Text="Albert" Value="2" />
                                </Items>
                            </telerik:RadDropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="RadDropDownList3" EnableClientScript="true" ValidationGroup="ContactDetails" ErrorMessage="required field" CssClass="validator" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                         <div class="inputWapper">
                            <asp:Label Text="Date Inspected: *" runat="server" AssociatedControlID="TelephoNo" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox10" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="S/C Form Processed: *" runat="server" AssociatedControlID="TelephoNo" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox11" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Date To Sent: *" runat="server" AssociatedControlID="TelephoNo" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox12" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Contract Permit No: *" runat="server" AssociatedControlID="TelephoNo" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox13" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Date Issued: *" runat="server" AssociatedControlID="TelephoNo" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox14" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Date Invoice: *" runat="server" AssociatedControlID="TelephoNo" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox15" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Date Invoice Paid: *" runat="server" AssociatedControlID="TelephoNo" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox16" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Amount Paid Le: *" runat="server" AssociatedControlID="TelephoNo" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox17" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Tracer No: *" runat="server" AssociatedControlID="TelephoNo" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox18" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Date *" runat="server" AssociatedControlID="TelephoNo" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox19" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Date Of Completion*" runat="server" AssociatedControlID="TelephoNo" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox20" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Installation Tested By*" runat="server" AssociatedControlID="TelephoNo" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox21" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Int. Audi Verification*" runat="server" AssociatedControlID="TelephoNo" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox22" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                        </div>
                        <div class="inputWapper">
                            <asp:Label Text="Date Checked By*" runat="server" AssociatedControlID="TelephoNo" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox23" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
                        </div>
                         <div class="inputWapper">
                            <asp:Label Text="Installation Connection Authorized By*" runat="server" AssociatedControlID="TelephoNo" />
                            <telerik:RadTextBox RenderMode="Lightweight" ID="RadTextBox24" runat="server" ValidationGroup="personalInfo" Width="320px" CssClass="k-textbox"></telerik:RadTextBox>
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
                    </telerik:RadWizardStep>--%>
                </WizardSteps>
            </telerik:RadWizard>
        </div>
    </form>
</body>
</html>
