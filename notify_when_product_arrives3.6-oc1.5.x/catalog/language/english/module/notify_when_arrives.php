<?php

$_['heading_title'] = 'Subscribe for stock updates';

#text---------------------------------------------------------------------------

$_['text_description']  = 'Enter your email to be informed when this product arrives:';

$_['text_description_2']  = 'Fill this form to be informed when this product arrives:';

$_['text_success'] =  'DONE:<br/>Now you are subscribed to stock updates!<br/>You will be informed when this product arrives. Thank You!';

$_['mail_admin_subject'] =  'New request for out of stock product - {product_name}';

$_['mail_admin_body'] =  '
<b>Request Details</b>
<br/><br/>
Customer name: {customer_name}
<br/><br/>
Customer e-mail: {customer_email}
<br/><br/>
Customer phone: {customer_phone}
<br/><br/>
Customer {custom_field}: {customer_custom}
<br/><br/>
Product: {product_name}
';

$_['text_error_mail']  = 'This e-mail is not valid!';
$_['text_error_name']  = 'This name is not valid!';
$_['text_error_phone']  = 'This phone is not valid!';
$_['text_error_custom']  = '{custom_name} data is not valid!';
$_['text_error_captcha']  = 'Captcha code does not match!';

$_['text_error_data'] = 'Invalid form data.';
#entry
$_['nwa_entry_name'] = 'Name';
$_['nwa_entry_phone'] = 'Phone';
$_['nwa_entry_mail'] = 'E-mail';
$_['nwa_entry_captcha'] = 'Please enter the text below:';
#buttons---------------------------------------------------------------------------

$_['button_register']  = 'Send';
$_['button_category'] = 'Notify me!';
$_['button_close'] = 'Close';

?>