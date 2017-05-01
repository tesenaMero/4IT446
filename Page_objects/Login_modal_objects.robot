*** Variables ***
${logInForm}        css=div#popup-login.open
${userNameField}	id=frm-name
${passwordField}	id=frm-password
${submitLogin}		css=button.submit
${errorMessagesUser}	css=label[for=frm-name].input-error
${errorMessagesPass}	css=label[for=frm-password].input-error
${modalClose}  //a[@aria-label="zavřít"]