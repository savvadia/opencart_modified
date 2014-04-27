<?php

#mail---------------------------------------------------------------------------

$_['default_mail_subject']  = '{store_name}  - Product {product_name} arrived in our store!';

$_['default_mail_body'] = 
'Hi {user_name}!<br/> <br/> 
You asked us to notify you when the product {product_name} arrives in our store.
<br/><br/> 
You can check it out now by clicking here: {product_link}
<br/><br/> 
Thanks for your interest in our products.
<br/> <br/>
Best Regards
<br/> <br/>
{store_name}';


#mail admin--------------------------------------------------------------------

$_['default_mail_subject_admin'] = '{store_name} -  Notices of available product {product_name} delivered.';

$_['default_mail_body_admin'] =
'Hello!
<br/> <br/> 
Notices of product {product_name} availability were delivered.
<br/> <br/> 
Best Regards,
<br/> <br/>
{store_name}';
 

$_['option_warning'] = '
<b style="color:red">Be Carefull:</b>
Before delete an option or option value, 
remember to check if there are users waiting for them, 
{heading_title}, checks stock by "options IDs" and "options values IDs", 
if you remove any, users which have registered for that option / option value will not receive any e-mail.
';

// v 4.0 vars
$_['entry_filter'] = 'Filter Options';
$_['entry_nwa_image_size'] = 'Product Image Size<span class="help">Define the size for the images in e-mail</span>';
$_['entry_nwa_use_captcha'] = 'Use captcha in forms?<span class="help">Captcha is a resource to avoid spam in store forms';
$_['text_filter_last_year'] = 'Last Year';
$_['text_filter_last_6_months']= 'Last 6 months';
$_['text_filter_last_3_months'] = 'Last 3 months';
$_['text_filter_last_month'] = 'Last Month';
$_['text_filter_last_week'] = 'Last Week';
$_['text_filter_all'] = 'All Time';
$_['text_filter_custom'] = 'Custom (use date fields)';

$_['text_filter_date_start'] = 'Date Start';
$_['text_filter_date_end'] = 'Date End';
$_['text_filter_graphic_max'] = 'Chart view Limit';

$_['button_update_statistics'] = 'Update Statistics';
$_['button_multi_delete'] = 'Del checked';
$_['text_confirm_multi_delete'] = 'Are you sure? This action cannot be undone!';

$_['text_heading_system'] = 'SYSTEM OPTIONS';
$_['text_heading_display'] = 'DISPLAY OPTIONS';
$_['text_heading_install'] = 'INSTALL OPTIONS';

// Heading
$_['heading_title'] = 'Notify When Product Arrives 4.0';

$_['button_notify'] = 'Notify now (send e-mails)';
 
$_['entry_show_mode'] = 'Out of stock products in listings :<br/><span class="help">Category, Bestsellers, etc...</span>';

$_['entry_notify_button'] = 'Button gray style: <span class="help">Left "add to cart" button with gray color in categories and other modules?</span>';
$_['entry_notify_admin'] = 'Alert admin for new requests? <span class="help">If enabled, admin will receive an e-mail everytime a user requests a product.</span>';
 
$_['entry_notify_mode'] = 'Notify Mode:';

$_['entry_customer_group'] = 'Skip customer group:<span class="help">Select the customer groups you don&apos;t want module to show.</span>';

$_['entry_nwa_cron_key'] = 'Cron job support<span class="help">
 To setup a cron job, you must define a cron key here to bypass admin login. <br/>(left empty to disable).</span>';

$_['entry_nwa_cron_key_tip'] = '
 <span class="help"> <br/>
 After defining a key, setup your cron job software to access the following link: <br/><br/>
 http://YOURSTORE.COM/admin/index.php?route=module/notify_when_arrives/notify<b style="color:red;">&nwa_cron_key=YOUR_DEFINED_KEY</b>
</span>';

$_['entry_mail_costumer'] = 'Costumer mail body:
  <span class="help">Use the following keywords:<br/>
  <b>{user_name}</b> for customer name<br/>
  <b>{user_phone}</b> for customer phone<br/>
  <b>{user_custom}</b> for customer custom data<br/>
  <b>{product_name}</b> for product name<br/>
  <b>{product_link}</b> for product link<br/>
  <b>{product_href}</b> for product href<br/>
  <b>{product_image}</b> for product image<br/>
  <b>{product_image_href}</b> for product image href<br/>
  <b>{store_name}</b> for store name<br/>
';

$_['entry_mail_admin'] = 'Admin mail body:
  <span class="help">Use the following keywords:<br/>
  <b>{product_name}</b> for product name<br/>
  <b>{product_link}</b> for product link<br/>
  <b>{product_href}</b> for product href<br/>
  <b>{product_image}</b> for product image<br/>
  <b>{product_image_href}</b> for product image href<br/>
  <b>{store_name}</b> for store name<br/>';

$_['entry_subject_costumer'] = 'Costumer mail subject:';
$_['entry_subject_admin'] = 'Admin mail subject:';

$_['entry_stock_status'] = 'Skip stock status:<br/>
<span class="help">Check the stock status you don&apos;t want module to show, even product stock is equal to zero.</span>    
';

$_['entry_nwa_replace_mode'] = 'Product Page replace mode:<br/>
<span class="help">If extension is looking ugly (or not showing) on your theme Product Page, try to change to compatibility mode, if the problem persists, contact me from opencart comments system.</span>    
';

$_['entry_fields'] = 'Fields Selection<span class="help">Select which fields you wish to use. Custom field does not support multi-language.</span>';

$_['entry_custom_name'] = 'Field name';
$_['entry_custom_type'] = 'Data type';

$_['entry_install'] = 'Module database:';

$_['entry_layout'] = 'Layout';
$_['entry_position'] = 'Position';
$_['entry_sort_order'] = 'Order';
$_['entry_status'] = 'Module Status:<span class="help">This option enables or disables whole extension.';

$_['text_nwa_replace_default'] = 'Default';
$_['text_nwa_replace_compatibility'] = 'Compatibility mode';
$_['text_nwa_replace_append'] = 'Append, do not remove add to cart button.';
$_['text_nwa_replace_popup'] = 'Display a popup window.';

$_['text_use_email'] = 'Use email field';
$_['text_use_name'] =  'Use name field';
$_['text_use_phone'] = 'Use phone field';
$_['text_use_custom'] = 'Use custom field';

$_['text_custom_type_number'] = 'Only numbers (0-9)';
$_['text_custom_type_text'] = 'Only text (a-z | A-Z)';
$_['text_custom_type_text_number'] = 'Both text and numbers (a-z | A-Z | 0-9)';
$_['text_custom_type_any'] = 'Any data type';
 
$_['text_nwa_not_logged_users'] = 'Not logged users';

$_['text_module'] = 'Modules';

$_['text_success'] = 'Module Notify When Product Arrives modified successfully';

$_['text_show_both'] = 'Display form on "hover" and "click" events.  
                        <span class="help" style="padding-left:18px;">(Not compatible with all themes )</span>';
$_['text_show_click'] = 'Display form on "click" event only.';
$_['text_show_redirect'] = 'Redirect to product page and display form.';
$_['text_show_popup'] = 'Display a popup window.  
                        <span class="help" style="padding-left:18px;">(Works on click only)</span>';

$_['text_no_data'] = 'No data!';

$_['text_tip_layout'] = 'Module call<span class="help">Here you have to add the module in all layouts you plan to use. By default should be <b>Home</b>, <b>Product</b>,<b>Category</b> and <b>Default</b> layouts</span>';

$_['text_product_name'] = 'Product Name';
$_['text_product_requested'] = 'Request times';
$_['text_product_notified'] = 'Notify times';
$_['text_product_emails'] = 'Customers awaiting notify<span class="help">Display order: Name | E-mail | Phone | Custom</span>';

$_['text_view_mails'] = 'Show Customers';
$_['text_hide_mails'] = 'Hide Customers';

$_['text_delete_statistic'] = 'Remove statistic?';
$_['text_delete_ok'] = 'Statistic(s) deleted!';
$_['text_delete_error'] = 'Error deleting!';
$_['text_confirm_delete'] = 'Are you sure you want to delete this statistic?';

$_['text_updated'] = 'Notify list updated!';
$_['text_wait_count'] = 'customer(s) awaiting products';
$_['text_wait_count_cron'] = 'Cron job result: {count_sent} e-mails were sent. {count_wait} customer(s) awaiting products.';

$_['tab_general'] = 'Config';
$_['tab_statistics'] = 'Statistics';
$_['tab_mail'] = 'E - Mail';

$_['text_installed'] = '<span style="color:green">Installed</span>';

$_['text_install_success'] = '<span style="color:green">Installed successfully!</span>';
$_['text_install_error'] = '<span style="color:red"> Error in the installation!</span>
                             <span class="help">
                             The system could not perform the installation of the database.<br/>
                             Run the sql file in module folder manually in your database to proceed with the installation.<br/>
                             The module will not work without database install.
                             </ span> ';

$_['text_notify_auto'] = 'Automatic';
$_['text_notify_manual'] = 'Manual';

$_['tip_notify_mode'] = ' <span class="help">In manual mode you must click "Notify now" button on statistics tab to send e-mails</span>';

$_['text_content_top'] = 'Top Content';
$_['text_content_bottom'] = 'Content Footer';
$_['text_column_left'] = 'Left Column';
$_['text_column_right'] = 'Right Column';

// Error
$_['error_permission'] = 'Warning: you do not have permission to modify the module Notify When Product Arrives! ';
$_['error_product_name'] = '<span style="color:red">Warning: This product (id = %s) is missing on product list!</span>';

?>