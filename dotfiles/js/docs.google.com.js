if (/Time tracking/.test($('.ss-form-title').text())) {
  var date = document.getElementById('entry_0');
  date.value = new Date().toLocaleDateString('pt-BR');

  var time = document.getElementById('entry_1');
  time.value = 8;

  var description = document.getElementById('entry_2');
  description.focus();

  var email = document.getElementById('emailReceipt');
  email.checked = false;
}
