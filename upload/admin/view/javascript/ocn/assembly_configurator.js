$(document).ready(function () {
  let checkedModifications = [];
  let checkedExtensions = [];

  /**
   * Refresh list modifications
   */
  $('#tab-modifications').on('click', '#form-modifications button[name=refresh]', refreshModifications);
  function refreshModifications() {
    checkedModifications = [];
    $('#form-modifications-table').html('');
    lockElements($('#form-modifications button[name=refresh]'), 'fa-refresh');

    $("#form-modifications-table").load(
      $('#form-modifications').data('refresh'),
      function (response, status, xhr) {
        if (status === "error") {
          showAlert($('#main'), 'danger', 'Error!', msg + xhr.status + " " + xhr.statusText);
        }
        unLockElements($('#form-modifications button[name=refresh]'), 'fa-refresh');
      });
  }

  /**
   * Selected modifications
   */
  $('#tab-modifications').on('click', '#form-modifications-select-all', function () {
    checkedModifications = [];
    $('#form-modifications input[name*="modifications"]:not(:disabled)').prop('checked', this.checked);
    if (this.checked) {
      $('#form-modifications input[name*="modifications"]:checked').each(function() {
        checkedModifications.push(this.value);
      });
    }
    checkModificationsSelectedStatus();
    checkModificationsButtonsStatus();
  })
  $('#tab-modifications').on('change', 'input[name*="modifications"]', function () {
    if (this.checked) {
      checkedModifications.push(this.value);
    } else {
      checkedModifications.splice(checkedModifications.indexOf(this.value), 1);
    }
    checkModificationsSelectedStatus();
    checkModificationsButtonsStatus();
  })
  function checkModificationsSelectedStatus() {
    let status = false;
    if (checkedModifications.length != 0 && checkedModifications.length == $('#form-modifications input[name*="modifications"]:not(:disabled)').length) {
      status = true;
    }
    $('#form-modifications #form-modifications-select-all').prop('checked', status);
  }
  function checkModificationsButtonsStatus() {
    let status = true;
    if (checkedModifications.length > 0) {
      status = false;
    }
    $('#form-modifications #form-modifications-button-install').attr('disabled', status);
  }

  /**
   * Install/Update
   */
  // Action
  $('#tab-modifications').on('click', 'button[name=install]', installModifications);
  // Function
  function installModifications() {
    lockElements($('#form-modifications button[name=install]'), 'fa-plus');
    $.ajax({
      type: 'post',
      url: $('#form-modifications').attr('action'),
      data: {modifications: checkedModifications},
      dataType: 'json',
      success: function (response) {
        if (response.status) {
          color = response.color;
          status = response.text_status;
          message = response.text_message;
          showAlert($('#main'), color, status, message);
        }
      },
      error: function (xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      },
      complete: function () {
        refreshModifications();
        unLockElements($('#form-modifications button[name=install]'), 'fa-plus');
      }
    });
  }

  /**
   * Extensions
   */

  /**
   * Refresh list extensions
   */
  $('#tab-extensions').on('click', '#form-extensions button[name=refresh]', refreshExtensions);
  function refreshExtensions() {
    checkedExtensions = [];
    $('#form-extensions-table').html('');
    lockElements($('#form-extensions button[name=refresh]'), 'fa-refresh');

    $("#form-extensions-table").load(
      $('#form-extensions').data('refresh'),
      function (response, status, xhr) {
        if (status === "error") {
          showAlert($('#main'), 'danger', 'Error!', msg + xhr.status + " " + xhr.statusText);
        }
        unLockElements($('#form-extensions button[name=refresh]'), 'fa-refresh');
        checkExtensionsButtonsStatus();
      });
  }


  /**
   * Selected extensions
   */
  $('#tab-extensions').on('click', '#form-extensions-select-all', function () {
    checkedExtensions = [];
    $('#form-extensions input[name*="extensions"]:not(:disabled)').prop('checked', this.checked);
    if (this.checked) {
      $('#form-extensions input[name*="extensions"]:checked').each(function() {
        checkedExtensions.push(this.value);
      });
    }
    checkExtensionsSelectedStatus();
    checkExtensionsButtonsStatus();
  })
  $('#tab-extensions').on('change', 'input[name*="extensions"]', function () {
    if (this.checked) {
      checkedExtensions.push(this.value);
    } else {
      checkedExtensions.splice(checkedExtensions.indexOf(this.value), 1);
    }
    checkExtensionsSelectedStatus();
    checkExtensionsButtonsStatus();
  })
  function checkExtensionsSelectedStatus() {
    let status = false;
    if (checkedExtensions.length !== 0 && checkedExtensions.length === $('#form-extensions input[name*="extensions"]:not(:disabled)').length) {
      status = true;
    }
    $('#form-extensions #form-extensions-select-all').prop('checked', status);
  }
  function checkExtensionsButtonsStatus() {
    let status = true;
    if (checkedExtensions.length > 0) {
      status = false;
    }
    $('#form-extensions #form-extensions-button-install').attr('disabled', status);
  }

  /**
   * Install/Update
   */
  // Action
  $('#tab-extensions').on('click', 'button[name=install]', installExtensions);
  // Function
  function installExtensions() {
    lockElements($('#form-extensions button[name=install]'), 'fa-plus');
    $.ajax({
      type: 'post',
      url: $('#form-extensions').attr('action'),
      data: { extensions: checkedExtensions },
      dataType: 'json',
      success: function (response) {
        if (response.status) {
          color = response.color;
          status = response.text_status;
          message = response.text_message;
          showAlert($('#main'), color, status, message);
        }
      },
      error: function (xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      },
      complete: function () {
        refreshExtensions();
        unLockElements($('#form-extensions button[name=install]'), 'fa-plus');
      }
    });
  }


  /**
   * General
   */

  /**
   * Developer Settings
   */
  $('#button-setting').on('click', function () {
    $.ajax({
      url: $(this).data('url'),
      dataType: 'html',
      beforeSend: function () {
        $('#button-setting').button('loading');
      },
      complete: function () {
        $('#button-setting').button('reset');
      },
      success: function (html) {
        $('#modal-developer').remove();
        $('body').prepend('<div id="modal-developer" class="modal">' + html + '</div>');
        $('#modal-developer').modal('show');
      },
      error: function (xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
    });
  });

  /**
   * Refresh modifications
   */
  $('#button-modification').on('click', function () {
    clearAlerts($('#main.container-fluid'));
    const buttonRefreshModification = $(this);
    $.ajax({
      type: 'get',
      url: $(this).data('url'),
      dataType: 'json',
      beforeSend: function() {
        lockElements(buttonRefreshModification, 'fa-refresh');
      },
      complete: function() {
        unLockElements(buttonRefreshModification, 'fa-refresh');
      },
      success: function(response) {
        let alertMessage = response.success;
        let alertBlock = '<div class="alert alert-success alert-dismissible"><i class="fa fa-exclamation-circle"></i>' + alertMessage + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>';
        $('#main.container-fluid').prepend(alertBlock);
      },
      error: function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
    });
  })

  // Alerts
  function showAlert(block, color, status, text) {
    block.find('> .alert').hide('slow');
    const alertBlock = '<div class="alert alert-' + color + ' alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>' + status + '</strong> ' + text + '</div>';
    block.prepend(alertBlock);
  }
  function clearAlerts(block = false) {
    if (block) {
      block.find('> .alert').hide('slow');
    } else {
      $('.alert').hide('slow');
    }
  }

  // Lock/Unlock
  function lockElements(lockElement, faClass) {
    lockElement.find('i.fa').removeClass(faClass).addClass('fa-spinner fa-pulse');
    $('#form-modifications button[name=refresh]').prop('disabled', true);
    $('#form-modifications button[name=install]').prop('disabled', true);
    $('#button-modification').prop('disabled', true);
  }
  function unLockElements(unLockElement, faClass) {
    unLockElement.find('i.fa').removeClass('fa-spinner fa-pulse').addClass(faClass);
    $('#form-modifications button[name=refresh]').prop('disabled', false);
    $('#button-modification').prop('disabled', false);
  }
});
