
var EdsaApp = function () {

    // To authenticate normal users
    var handleLogin = function () {
        if ($('#Username').val() == '' || $('#Password').val() == '') {
            toastr.error('Both fields are required', "Error");
        } else {
            var UserObj = {
                username: $('#Username').val(),
                password: $('#Password').val(),
                rememberMe: $('#ckb1').is(':checked')
            }

            $.ajax({
                url: "/Login/Login",
                type: 'POST',
                data: JSON.stringify(UserObj),
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.success) {
                        window.location.href = "/Dashboard/Index";

                    } else {
                        toastr.error(response.responseText, "Error");
                    }
                }
            });
        }
    }

    // To authenticate Internal users.
    var handleInternalUserLogin = function () {
        if ($('#Username').val() == '' || $('#Password').val() == '') {
            toastr.error('Both fields are required', "Error");
        } else {
            var UserObj = {
                username: $('#Username').val(),
                password: $('#Password').val(),
                rememberMe: $('#ckb1').is(':checked'),
                userType: $('#userType option:selected').text()
            }
            $.ajax({
                url: "/Login/InternalUserLogin",
                type: 'POST',
                data: JSON.stringify(UserObj),
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (response) {
                    if (response.success) {
                        if ($('#userType option:selected').text() == 'System Admin') {
                            window.location.href = "/Dashboard/Index";
                        } else if ($('#userType option:selected').text() == 'EDSA Admin') {
                            window.location.href = "/Vendor/AdminDashboard";
                        }
                    } else {
                        toastr.error(response.responseText, "Error");
                    }
                }
            });
        }
    }

    // Add New Individual Customer.
    var addIndCustomer = function (UserObj) {
        $.ajax({
            url: "/User/AddIndividualUser",
            type: 'POST',
            data: JSON.stringify(UserObj),
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response.success) {
                    toastr.success(response.responseText, "Message");
                }
            }
        });
        setTimeout(function () {
            location.reload();
        }, 1500);
    }

    // Update Individual Customer.
    var updateIndCustomer = function (UserObj) {
        $.ajax({
            url: "/User/UpdateIndividualUser",
            type: 'POST',
            data: JSON.stringify(UserObj),
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response.success) {
                    toastr.success(response.responseText, "Message");
                }
            }
        });
        setTimeout(function () {
            location.reload();
        }, 1500);
    }

    // Apply for meter.
    var applyForMeter = function (UserObj) {
        $.ajax({
            url: "/Dashboard/ConfirmApply",
            type: 'POST',
            data: JSON.stringify(UserObj),
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response.success) {
                    toastr.success(response.responseText, "Message");
                }
            }
        });
    }

    // Delete Meter Application
    var deleteMeterApplication = function (id) {
        $('#modalDelete').modal('show');
        $('#btnYes').on('click', function () {
            $.ajax({
                url: "/Dashboard/DeleteApplication/" + id,
                type: 'POST',
                contentType: 'application/json; charset=uft-8',
                dataType: 'json',
                success: function (response) {
                    if (response.success) {
                        toastr.success(response.responseText, "Message");
                    }
                }
            });
            setTimeout(function () {
                location.reload();
            }, 1500);
        });
    }

    // Add New Internal User
    var addInternalUser = function () {
        var password = $('#Password').val();
        var cpassword = $('#CPassword').val();
        var fileInput = $("#fileInput")[0].files.length;
        if ($('#FullName').val() == '' ||
            $('#Username').val() == '' ||
            $('#Password').val() == '' ||
            $('#Email').val() == '' ||
            $('#Phone').val() == '' ||
            $('#UserRoles option:selected').text() =='--User Category--'||
            fileInput === 0) {
            toastr.error('All fields are required.', 'Error')
        } else if (password != cpassword) {
            toastr.error('Password do not match', 'Error')
        } else if (CheckPassword($('#Password').val())) {
            toastr.error('Password should contains atleast 6 alpha numeric characters.', 'Error')
        }
        else {
            
            // We need to post mixed data (text and image).
            // So we will use FormData to post
            var formData = new FormData();
            var files = $("#fileInput").get(0).files;
            formData.append("file", files[0]);
            formData.append("FullName", $('#FullName').val());
            formData.append("Username", $('#Username').val());
            formData.append("Password", $('#Password').val());
            formData.append("Email", $('#Email').val());
            formData.append("PhoneNumber", $("#Phone").val());
            formData.append("RoleId", $('#UserRoles option:selected').val());
            formData.append("Photo", files[0].name);
            debugger;
            // Ajax Requuest.
            $.ajax({
                type: 'POST',
                url: "/User/AddInternalUser",
                data: formData,
                cache: false,
                contentType: false,
                processData: false,
                success: function (response) {
                    if (response.success) {
                        displayLoader();
                        $.ajax({
                            url: "/User/SendEmail",
                            type: 'POST',
                            data: formData,
                            cache: false,
                            contentType: false,
                            processData: false,
                            success: function (response) {
                                if (response.success) {
                                    toastr.success(response.responseText, "Message");
                                } 
                            },
                            complete: function () {
                                HoldOn.close();
                            }
                        });
                        setTimeout(function () {
                            location.reload();
                        }, 2000);
                    } else {
                        toastr.warning(response.responseText, "Warning");
                    }
                   
                }
            })
            
        }
    }

    // Filter Users By User Category.
    var handleFilterUsers = function (searchVal) {
        $("#UsersTable > tbody").empty();
        $.ajax({
            url: "/User/FilterUser/",
            type: 'GET',
            contentType: 'application/json; charset=uft-8',
            dataType: 'json',
            data: { searchVal: searchVal },
            success: function (data) {
                $.each(JSON.parse(data), function (i, item) {
                    $('#UsersTable').append('<tr class="c-table__row"><td class="c-table__cell" style="display:none">@item.Id</td>\
                        <td class= "c-table__cell">'+ item.edsaUsers.FullName + '</td>\
                            <td class="c-table__cell">'+ item.edsaUsers.Email + '</td>\
                            <td class="c-table__cell">'+ item.edsaUsers.Username + '</td>\
                            <td class="c-table__cell">'+ item.edsaUsers.PhoneNumber + '</td>\
                            <td class="c-table__cell">\
                                <div class="o-media">\
                                    <div class="o-media__img u-mr-xsmall">\
                                        <div class="c-avatar c-avatar--small">\
                                            <img class="c-avatar__img" src="/Content/admin/img/1-t.png"/>\
                                        </div>\
                                    </div>\
                                    <div class="o-media__body">\
                                        <small class="u-block u-text-mute" style="visibility:hidden">Moscow Office</small>\
                                        Mike Tyson\
                                    </div>\
                                </div>\
                            </td>\
                            <td class="c-table__cell">\
                                <button class="c-btn c-btn--info btnEdit" id="btnEdit">Edit</button>\
                                <button class="c-btn c-btn--danger btnDelete" id="btnDelete">Delete</button>\
                            </td></tr>')
                    //if (item.OrderStatus == 'Completed') {
                    //    $('#ItemsTable').append('<tr class="c-table__row"><td class="c-table__cell" style="display:none">' + item.id + '</td><td class="c-table__cell">' + item.Customer + '</td><td class="c-table__cell">' + parseFloat(item.TotalCharges).toFixed(2) + '</td><td class="c-table__cell">' + item.TotalQty + '</td><td class="c-table__cell">' + item.TotalAmount + '</td><td class="c-table__cell"><div class="c-choice c-choice--checkbox is-disabled"><input class="c-choice__input" id="chk_' + item.id + '" name="chk_' + item.id + '" type="checkbox" checked disabled><label class="c-choice__label" for="chk_' + item.id + '">Completed</label></div></td><td class="c-table__cell"><button class="c-btn c-btn--info btnEdit" id="btnEdit_' + item.id + '" onclick="RedirectPage(' + item.id + ')">Edit</button><button class="c-btn c-btn--danger btnDelete" id="btnDel_' + item.id + '" onclick="DeleteOrder(' + item.id + ')">Delete</button></td></tr>')
                    //} else {
                    //    $('#ItemsTable').append('<tr class="c-table__row"><td class="c-table__cell" style="display:none">' + item.id + '</td><td class="c-table__cell">' + item.Customer + '</td><td class="c-table__cell">' + item.TotalCharges + '</td><td class="c-table__cell">' + item.TotalQty + '</td><td class="c-table__cell">' + item.TotalAmount + '</td><td class="c-table__cell"><div class="c-choice c-choice--checkbox"><input class="c-choice__input" id="chk_' + item.id + '" name="chk_' + item.id + '" type="checkbox"><label class="c-choice__label" for="chk_' + item.id + '">Completed</label></div></td><td class="c-table__cell"><button class="c-btn c-btn--info btnEdit" id="btnEdit_' + item.id + '" onclick="RedirectPage(' + item.id + ')">Edit</button><button class="c-btn c-btn--danger btnDelete" id="btnDel_' + item.id + '" onclick="DeleteOrder(' + item.id + ')">Delete</button></td></tr>')
                    //}
                });
            },
            complete: function () {

            }
        });
    }

    // Delete Internal User
    var deleteInternalUser = function (id) {
        $('#modalDelete').modal('show');
        $('#btnYes').on('click', function () {
            $.ajax({
                url: "/User/DeleteUser/" + id,
                type: 'POST',
                contentType: 'application/json; charset=uft-8',
                dataType: 'json',
                success: function (response) {
                    if (response.success) {
                        toastr.success(response.responseText, "Message");
                    }
                }
            });
            setTimeout(function () {
                location.reload();
            }, 1500);
        });
    }

    // Approve/Reject meter application.
    var updateMeterApplicationStatus = function (UserObj) {        
        $.ajax({
            url: "/Vendor/UpdateApplicationStatus",
            type: 'POST',
            data: JSON.stringify(UserObj),
            contentType: "application/json;charset=utf-8",
            dataType: "json",
            success: function (response) {
                if (response.success) {
                    toastr.success(response.responseText, "Message");
                }
            },
            complete: function () {
                location.href = "/Vendor/MeterApplications";
            }
        });
    }

    // To filter meter applications by selected item Approved/Rejected/Pending.
    var filterMeterApplicationByStatus = function () {
        var val = $('#ddlFilter option:selected').text();
        var filterVal;
        var FullName;
        if (val == 'Approved') {
            filterVal = 'Approve'
        } else if (val == 'Rejected') {
            filterVal = 'Reject'
        }
        // Appending rows to table.
        $("#ApplicationsTable > tbody").empty();
        $.ajax({
            url: "/Vendor/FilterApplication/",
            type: 'GET',
            contentType: 'application/json; charset=uft-8',
            dataType: 'json',
            data: { filterVal: filterVal },
            success: function (data) {
                $.each(JSON.parse(data), function (i, item) {
                    FullName = item.edsaIndividualUser.FirstName + " " + item.edsaIndividualUser.MiddleName + " " + item.edsaIndividualUser.LastName
                    $('#ApplicationsTable').append('<tr class="c-table__row">\
                                                        <td class="c-table__cell" style="display:none">'+ item.edsaIndividualUser.id + '</td>\
                                                        <td class="c-table__cell">'+ FullName + '</td>\
                                                        <td class="c-table__cell">'+ item.edsaIndividualUser.TelNo + '</td>\
                                                        <td class="c-table__cell">'+ item.edsaIndividualUser.IdentificationType + '</td>\
                                                        <td class="c-table__cell">'+ item.edsaIndividualUser.TypeOfPremise + '</td>\
                                                        <td class="c-table__cell">\
                                                            <button class="c-btn c-btn--info btnReview" id="btnReview" onclick="ReviewApplication('+ item.edsaIndividualUser.id + ')><i class="fa fa-eye"></i>&nbsp; Review</button>\
                                                        </td>\
                                                    </tr>')

                });
            },
            complete: function () {

            }
        });
    }

    return {
        UserLogin: function () {
            handleLogin();
        },
        GetAddIndCustomer: function (UserObj) {
            addIndCustomer(UserObj);
        },
        GetUpdateIndCustomer: function (UserObj) {
            updateIndCustomer(UserObj);
        },
        GetApplyForMeter: function (UserObj) {
            applyForMeter(UserObj);
        },
        GetDeleteMeterApplication: function (id) {
            deleteMeterApplication(id);
        },
        GetAddInternalUser: function () {
            addInternalUser();
        },
        GetFilterlUser: function (searchVal) {
            handleFilterUsers(searchVal);
        },
        GetInternalUser: function (id) {
            deleteInternalUser(id);
        },
        InternalUserLogin: function () {
            handleInternalUserLogin();
        },
        GetUpdateMeterApplicationStatus: function (UserObj) {
            updateMeterApplicationStatus(UserObj);
        },
        GetfilterMeterApplicationByStatus: function () {
            filterMeterApplicationByStatus();
        },
    }
}();

