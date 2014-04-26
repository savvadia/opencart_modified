<?php echo $header; ?>
<div id="content">
    <div class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
        <?php } ?>
    </div>
    <?php if ($error_warning) { ?>
        <div class="warning"><?php echo $error_warning; ?></div>
    <?php } ?>
    <div class="box">
        <div class="heading">
            <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
            <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
        </div>
        <div class="content">
            <div id="tabs" class="htabs">
                <a href="#tab-general"><?php echo $tab_general; ?></a>
                <a href="#tab-mail"><?php echo $tab_mail; ?></a>
                <a href="#tab-statistics"><?php echo $tab_statistics; ?></a>
            </div>
            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
                <div id="tab-general">
                    <table class="form">
                        <tr>
                            <td><?php echo $entry_install; ?></td>
                            <td> 
                                <?php
                                if ($notify_when_arrives_installed == 1) {

                                    echo $text_installed;
                                } elseif ($notify_when_arrives_installed == 2) {

                                    echo $text_installed;
                                } else {
                                    echo $text_install_error;
                                }
                                ?>
                                <input type="hidden" name="notify_when_arrives_installed" value="<?php echo $notify_when_arrives_installed; ?> "/>
                            </td>
                        </tr>

                        <tr>
                            <td><?php echo $entry_status; ?></td>
                            <td><select style="min-width: 100px;" name="notify_when_arrives_status">
                                    <?php if ($notify_when_arrives_status) { ?>
                                        <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                        <option value="0"><?php echo $text_disabled; ?></option>
                                    <?php } else { ?>
                                        <option value="1"><?php echo $text_enabled; ?></option>
                                        <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                    <?php } ?>
                                </select></td>
                        </tr>
           
                        <tr>
                            <td><?php echo $entry_notify_mode; ?><?php echo $tip_notify_mode; ?></td>
                            <td>
                                <?php if ($notify_mode) { ?>
                                    <input type="radio"  name="notify_mode" value="0" id="nf1"/><label for="nf1"><?php echo $text_notify_manual; ?></label>
                                    <input type="radio" checked="checked" name="notify_mode" value="1" id="nf2"/><label for="nf2"><?php echo $text_notify_auto; ?></label>
                                <?php } else { ?>
                                    <input type="radio" checked="checked" name="notify_mode" value="0" id="nf1"/><label for="nf1"><?php echo $text_notify_manual; ?></label>
                                    <input type="radio"  name="notify_mode" value="1" id="nf2"/><label for="nf2"><?php echo $text_notify_auto; ?></label>
                                <?php } ?>
                            </td>
                        </tr>
                        <tr>
                            <td><?php echo $entry_notify_button; ?></td>
                            <td>
                                <?php if ($notify_button) { ?>
                                    <input type="radio" checked="checked"  name="notify_button" value="1" id="nfb1"/><label for="nfb1"><?php echo $text_enabled; ?></label>
                                    <input type="radio" name="notify_button" value="0" id="nfb2"/><label for="nfb2"><?php echo $text_disabled; ?></label>
                                <?php } else { ?>
                                    <input type="radio"  name="notify_button" value="1" id="nfb1"/><label for="nfb1"><?php echo $text_enabled; ?></label>
                                    <input type="radio"  checked="checked"  name="notify_button" value="0" id="nfb2"/><label for="nfb2"><?php echo $text_disabled; ?></label>
                                <?php } ?>
                            </td>
                        </tr>
                         <tr>
                            <td><?php echo $entry_notify_admin; ?></td>
                            <td>
                                <?php if ($notify_admin) { ?>
                                    <input type="radio" checked="checked"  name="notify_admin" value="1" id="nfa1"/><label for="nfa1"><?php echo $text_enabled; ?></label>
                                    <input type="radio" name="notify_admin" value="0" id="nfa2"/><label for="nfa2"><?php echo $text_disabled; ?></label>
                                <?php } else { ?>
                                    <input type="radio"  name="notify_admin" value="1" id="nfa1"/><label for="nfa1"><?php echo $text_enabled; ?></label>
                                    <input type="radio"  checked="checked"  name="notify_admin" value="0" id="nfa2"/><label for="nfa2"><?php echo $text_disabled; ?></label>
                                <?php } ?>
                            </td>
                        </tr>  
  
                        <tr>
                            <td><?php echo $entry_fields; ?></td>
                            
                             <td>
                                <input disabled="disabled" id="use_email" type="checkbox" name="nwa_use_email" value="" checked="checked" />
                                <label for="use_email" style="color:gray" ><?php echo $text_use_email; ?></label>
                             
                                <input id="use_name" type="checkbox" name="nwa_use_name" value="1" <?php if ($nwa_use_name){?>checked="checked"<?php }?> />
                                <label for="use_name"><?php echo $text_use_name; ?></label>    
                             
                                <input id="use_phone" type="checkbox" name="nwa_use_phone" value="1" <?php if ($nwa_use_phone){?>checked="checked"<?php }?> />
                                <label for="use_phone"><?php echo $text_use_phone; ?></label>  
                                  <br/>  <br/>
                                <input id="use_custom" type="checkbox" name="nwa_use_custom" value="1" <?php if ($nwa_use_custom){?>checked="checked"<?php }?> />
                                <label for="use_custom"><?php echo $text_use_custom; ?></label>  
                       
                                 <div id="custom" style="display:inline;margin-left: 10px;">
                                <?php echo $entry_custom_name; ?>
                                    <input type="text" name="nwa_custom_name" value="<?php echo $nwa_custom_name;?>" />
                                
                                 <?php echo $entry_custom_type; ?>
                                    <select style="min-width: 100px;" id="custom_type" name="nwa_custom_type">
                                        <?php if (!$nwa_custom_type || $nwa_custom_type == 'number') { ?>
                                            <option value="number"  selected="selected"><?php echo $text_custom_type_number; ?></option>
<!--                                            <option value="text"><?php echo $text_custom_type_text; ?></option>-->
                                            <option value="text_number" ><?php echo $text_custom_type_text_number; ?></option>
                                            <option value="any" ><?php echo $text_custom_type_any; ?></option>
                                        <?php } elseif ($nwa_custom_type == 'text') { ?>
                                            <option value="number"  ><?php echo $text_custom_type_number; ?></option>
                                            <option value="text" selected="selected"><?php echo $text_custom_type_text; ?></option>
                                            <option value="text_number" ><?php echo $text_custom_type_text_number; ?></option>
                                            <option value="any" ><?php echo $text_custom_type_any; ?></option>
                                        <?php } elseif ($nwa_custom_type == 'text_number') { ?>
                                            <option value="number"><?php echo $text_custom_type_number; ?></option>
<!--                                            <option value="text"><?php echo $text_custom_type_text; ?></option>-->
                                            <option value="text_number"   selected="selected"><?php echo $text_custom_type_text_number; ?></option>
                                            <option value="any" ><?php echo $text_custom_type_any; ?></option>
                                        <?php } elseif ($nwa_custom_type == 'any') { ?>
                                            <option value="number"><?php echo $text_custom_type_number; ?></option>
<!--                                            <option value="text"><?php echo $text_custom_type_text; ?></option>-->
                                            <option value="text_number" ><?php echo $text_custom_type_text_number; ?></option>
                                            <option value="any"   selected="selected"><?php echo $text_custom_type_any; ?></option>
                                        <?php } ?>
                                    </select>
                                 </div>
                                 </td>
                        </tr>
                        
                   
                             <tr>
                            <td><?php echo $entry_show_mode; ?></td>
                            <td>
                              <?php if ($notify_when_arrives_show_mode == '4') { ?>
 
                                    <input type="radio"  name="notify_when_arrives_show_mode" value="1" id="s1" /><label for="s1"><?php echo $text_show_both; ?></label>
                                    <br/>
                                    <input type="radio"  name="notify_when_arrives_show_mode" value="2" id="s2" /><label for="s2"><?php echo $text_show_click; ?></label>
                                    <br/>
                                    <input type="radio"  name="notify_when_arrives_show_mode" value="3" id="s3" c/><label for="s3"><?php echo $text_show_redirect; ?></label>
                                    <br/>
                                    <input type="radio"  name="notify_when_arrives_show_mode" value="4" id="s4" checked="checked"/><label for="s4"><?php echo $text_show_popup; ?></label>

                                <?php } elseif ($notify_when_arrives_show_mode == '3') { ?>

                                    <input type="radio"  name="notify_when_arrives_show_mode" value="1" id="s1" /><label for="s1"><?php echo $text_show_both; ?></label>
                                    <br/>
                                    <input type="radio"  name="notify_when_arrives_show_mode" value="2" id="s2" /><label for="s2"><?php echo $text_show_click; ?></label>
                                    <br/>
                                    <input type="radio"  name="notify_when_arrives_show_mode" value="3" id="s3" checked="checked"/><label for="s3"><?php echo $text_show_redirect; ?></label>
                                    <br/>
                                    <input type="radio"  name="notify_when_arrives_show_mode" value="4" id="s4"/><label for="s4"><?php echo $text_show_popup; ?></label>

                                <?php } elseif ($notify_when_arrives_show_mode == '2') { ?>

                                    <input type="radio"  name="notify_when_arrives_show_mode" value="1" id="s1" /><label for="s1"><?php echo $text_show_both; ?></label>
                                    <br/>
                                    <input type="radio"  name="notify_when_arrives_show_mode" value="2" id="s2"  checked="checked"/><label for="s2"><?php echo $text_show_click; ?></label>
                                    <br/>
                                    <input type="radio"  name="notify_when_arrives_show_mode" value="3" id="s3" /><label for="s3"><?php echo $text_show_redirect; ?></label>
                      <br/>
                                    <input type="radio"  name="notify_when_arrives_show_mode" value="4" id="s4"/><label for="s4"><?php echo $text_show_popup; ?></label>

                                <?php } else { ?>

                                    <input type="radio"  name="notify_when_arrives_show_mode" value="1" id="s1" checked="checked" /><label for="s1"><?php echo $text_show_both; ?></label>
                                    <br/>
                                    <input type="radio"  name="notify_when_arrives_show_mode" value="2" id="s2" /><label for="s2"><?php echo $text_show_click; ?></label>
                                    <br/>
                                    <input type="radio"  name="notify_when_arrives_show_mode" value="3" id="s3" /><label for="s3"><?php echo $text_show_redirect; ?></label>
                      <br/>
                                    <input type="radio"  name="notify_when_arrives_show_mode" value="4" id="s4"/><label for="s4"><?php echo $text_show_popup; ?></label>

                                <?php } ?>
                            </td>
                        </tr>
                        <tr>
                            <td><?php echo $entry_nwa_replace_mode; ?></td>
                            <td>
                                <?php if ($nwa_replace_mode == 1) { ?>
                                    <input type="radio"  name="nwa_replace_mode" value="0" id="nd0"/><label for="nd0"><?php echo $text_nwa_replace_default; ?></label>
                                    <br/>
                                    <input type="radio"  checked="checked" name="nwa_replace_mode" value="1" id="nd1"/><label for="nd1"><?php echo $text_nwa_replace_compatibility; ?></label>
                                    <br/>
                                    <input type="radio"  name="nwa_replace_mode" value="2" id="nd2"/><label for="nd2"><?php echo $text_nwa_replace_append; ?></label>
                                    <br/>
                                    <input type="radio"  name="nwa_replace_mode" value="3" id="nd3"/><label for="nd3"><?php echo $text_nwa_replace_popup ?></label>
                                <?php } elseif ($nwa_replace_mode == 2) { ?>
                                    <input type="radio"  name="nwa_replace_mode" value="0" id="nd0"/><label for="nd0"><?php echo $text_nwa_replace_default; ?></label>
                                    <br/>
                                    <input type="radio"  name="nwa_replace_mode" value="1" id="nd1"/><label for="nd1"><?php echo $text_nwa_replace_compatibility; ?></label>
                                    <br/>
                                    <input type="radio"  checked="checked" name="nwa_replace_mode" value="2" id="nd2"/><label for="nd2"><?php echo $text_nwa_replace_append; ?></label>
                                    <br/>
                                    <input type="radio"  name="nwa_replace_mode" value="3" id="nd3"/><label for="nd3"><?php echo $text_nwa_replace_popup ?></label>                              
                                <?php } elseif ($nwa_replace_mode == 3) { ?>
                                    <input type="radio"  name="nwa_replace_mode" value="0" id="nd0"/><label for="nd0"><?php echo $text_nwa_replace_default; ?></label>
                                    <br/>
                                    <input type="radio"  name="nwa_replace_mode" value="1" id="nd1"/><label for="nd1"><?php echo $text_nwa_replace_compatibility; ?></label>
                                    <br/>
                                    <input type="radio"  name="nwa_replace_mode" value="2" id="nd2"/><label for="nd2"><?php echo $text_nwa_replace_append; ?></label>
                                    <br/>
                                    <input type="radio"  name="nwa_replace_mode" checked="checked" value="3" id="nd3"/><label for="nd3"><?php echo $text_nwa_replace_popup ?></label>
                                <?php } else { ?>
                                    <input type="radio"  checked="checked" name="nwa_replace_mode" value="0" id="nd0"/><label for="nd0"><?php echo $text_nwa_replace_default; ?></label>
                                    <br/>
                                    <input type="radio"  name="nwa_replace_mode" value="1" id="nd1"/><label for="nd1"><?php echo $text_nwa_replace_compatibility; ?></label>
                                    <br/>
                                    <input type="radio"  name="nwa_replace_mode" value="2" id="nd2"/><label for="nd2"><?php echo $text_nwa_replace_append; ?></label>
                                    <br/>
                                    <input type="radio"  name="nwa_replace_mode" value="3" id="nd3"/><label for="nd3"><?php echo $text_nwa_replace_popup ?></label>

                                <?php } ?>
                            </td>
                        </tr>
                        <tr>
                            <td><?php echo $entry_stock_status; ?></td>
                            <td><div class="scrollbox">
                                    <?php $class = 'odd'; ?>
                                    <?php foreach ($status_list as $stock_status) { ?>
                                        <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                                        <div class="<?php echo $class; ?>">
                                            <?php if (in_array($stock_status['stock_status_id'], $notify_when_arrives_skip_status)) { ?>
                                                <input id="ss<?php echo $stock_status['stock_status_id']; ?>" type="checkbox" name="notify_when_arrives_skip_status[]" value="<?php echo $stock_status['stock_status_id']; ?>" checked="checked" />
                                                <label for="ss<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></label>
                                            <?php } else { ?>
                                                <input id="ss<?php echo $stock_status['stock_status_id']; ?>" type="checkbox" name="notify_when_arrives_skip_status[]" value="<?php echo $stock_status['stock_status_id']; ?>" />
                                                <label for="ss<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></label>
                                            <?php } ?>
                                        </div>
                                    <?php } ?>
                                </div>
                        </tr>
                        
                          <tr>
                            <td><?php echo $entry_customer_group; ?></td>
                            <td><div class="scrollbox">
                                    <?php $class = 'odd'; ?>
                                     <?php foreach ($customer_groups as $customer_group) { ?>
                                        <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                                        <div class="<?php echo $class; ?>">
                                            <?php if (in_array($customer_group['customer_group_id'], $notify_when_arrives_customer_group)) { ?>
                                                <input id="ss<?php echo $customer_group['customer_group_id']; ?>" type="checkbox" name="notify_when_arrives_customer_group[]" value="<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
                                                <label for="ss<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></label>
                                            <?php } else { ?>
                                                <input id="ss<?php echo $customer_group['customer_group_id']; ?>" type="checkbox" name="notify_when_arrives_customer_group[]" value="<?php echo $customer_group['customer_group_id']; ?>" />
                                                <label for="ss<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></label>
                                            <?php } ?>
                                        </div>
                                    <?php } ?>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td><?php echo $entry_nwa_cron_key; ?></td>
                            <td>
                                <input type="text"  checked="checked"  name="nwa_cron_key" value="<?php echo $nwa_cron_key; ?>"  />
                                <?php echo $entry_nwa_cron_key_tip; ?>
                            </td>
                        </tr>
                        <tr>
                            <td >
                                <?php echo $text_tip_layout; ?>
                            </td>
                            <td>
                                <table id="module" class="list">
                                    <thead>

                                        <tr>
                                            <td class="left"><?php echo $entry_layout; ?></td>
                                            <td class="left"><?php echo $entry_position; ?></td>
                                            <td class="left"><?php echo $entry_status; ?></td>
                                            <td class="right"><?php echo $entry_sort_order; ?></td>
                                            <td></td>
                                        </tr>
                                    </thead>
                                    <?php if ($version == '1.5.0') { ?>
                                        <?php $module_row = 0; ?>
                                        <?php foreach ($modules as $module) { ?>
                                            <tbody id="module-row<?php echo $module_row; ?>">
                                                <tr>
                                                    <td class="left"><select name="notify_when_arrives_<?php echo $module_row; ?>_layout_id">
                                                            <?php foreach ($layouts as $layout) { ?>
                                                                <?php if ($layout['layout_id'] == ${'notify_when_arrives_' . $module . '_layout_id'}) { ?>
                                                                    <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                                                                <?php } else { ?>
                                                                    <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                                                                <?php } ?>
                                                            <?php } ?>
                                                        </select></td>
                                                    <td class="left"><select name="notify_when_arrives_<?php echo $module_row; ?>_position">
                                                            <?php if (${'notify_when_arrives_' . $module . '_position'} == 'content_top') { ?>
                                                                <option value="content_top" selected="selected"><?php echo $text_content_top; ?></option>
                                                            <?php } else { ?>
                                                                <option value="content_top"><?php echo $text_content_top; ?></option>
                                                            <?php } ?>  
                                                            <?php if (${'notify_when_arrives_' . $module . '_position'} == 'content_bottom') { ?>
                                                                <option value="content_bottom" selected="selected"><?php echo $text_content_bottom; ?></option>
                                                            <?php } else { ?>
                                                                <option value="content_bottom"><?php echo $text_content_bottom; ?></option>
                                                            <?php } ?>     
                                                            <?php if (${'notify_when_arrives_' . $module . '_position'} == 'column_left') { ?>
                                                                <option value="column_left" selected="selected"><?php echo $text_column_left; ?></option>
                                                            <?php } else { ?>
                                                                <option value="column_left"><?php echo $text_column_left; ?></option>
                                                            <?php } ?>
                                                            <?php if (${'notify_when_arrives_' . $module . '_position'} == 'column_right') { ?>
                                                                <option value="column_right" selected="selected"><?php echo $text_column_right; ?></option>
                                                            <?php } else { ?>
                                                                <option value="column_right"><?php echo $text_column_right; ?></option>
                                                            <?php } ?>
                                                        </select></td>
                                                    <td class="left"><select name="notify_when_arrives_<?php echo $module_row; ?>_status">
                                                            <?php if (${'notify_when_arrives_' . $module . '_status'}) { ?>
                                                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                                                <option value="0"><?php echo $text_disabled; ?></option>
                                                            <?php } else { ?>
                                                                <option value="1"><?php echo $text_enabled; ?></option>
                                                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                                            <?php } ?>
                                                        </select></td>
                                                    <td class="right"><input type="text" name="notify_when_arrives_<?php echo $module_row; ?>_sort_order" value="<?php echo ${'notify_when_arrives_' . $module . '_sort_order'}; ?>" size="3" />

                                                    </td>
                                                    <td class="left"><a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><span><?php echo $button_remove; ?></span></a></td>
                                                </tr>
                                            </tbody>

                                            <?php $module_row++; ?>
                                        <?php } ?>  
                                        <input type="hidden" name="notify_when_arrives_module" value="<?php echo $notify_when_arrives_module; ?>" />
                                    <?php } else { ?>
                                        <?php $module_row = 0; ?>
                                        <?php foreach ($modules as $module) { ?>
                                            <tbody id="module-row<?php echo $module_row; ?>">
                                                <tr>
                                                    <td class="left"><select name="notify_when_arrives_module[<?php echo $module_row; ?>][layout_id]">
                                                            <?php foreach ($layouts as $layout) { ?>
                                                                <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                                                                    <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                                                                <?php } else { ?>
                                                                    <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                                                                <?php } ?>
                                                            <?php } ?>
                                                        </select></td>
                                                    <td class="left"><select name="notify_when_arrives_module[<?php echo $module_row; ?>][position]">
                                                            <?php if ($module['position'] == 'content_top') { ?>
                                                                <option value="content_top" selected="selected"><?php echo $text_content_top; ?></option>
                                                            <?php } else { ?>
                                                                <option value="content_top"><?php echo $text_content_top; ?></option>
                                                            <?php } ?>  
                                                            <?php if ($module['position'] == 'content_bottom') { ?>
                                                                <option value="content_bottom" selected="selected"><?php echo $text_content_bottom; ?></option>
                                                            <?php } else { ?>
                                                                <option value="content_bottom"><?php echo $text_content_bottom; ?></option>
                                                            <?php } ?>     
                                                            <?php if ($module['position'] == 'column_left') { ?>
                                                                <option value="column_left" selected="selected"><?php echo $text_column_left; ?></option>
                                                            <?php } else { ?>
                                                                <option value="column_left"><?php echo $text_column_left; ?></option>
                                                            <?php } ?>
                                                            <?php if ($module['position'] == 'column_right') { ?>
                                                                <option value="column_right" selected="selected"><?php echo $text_column_right; ?></option>
                                                            <?php } else { ?>
                                                                <option value="column_right"><?php echo $text_column_right; ?></option>
                                                            <?php } ?>
                                                        </select></td>
                                                    <td class="left"><select name="notify_when_arrives_module[<?php echo $module_row; ?>][status]">
                                                            <?php if ($module['status']) { ?>
                                                                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                                                                <option value="0"><?php echo $text_disabled; ?></option>
                                                            <?php } else { ?>
                                                                <option value="1"><?php echo $text_enabled; ?></option>
                                                                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                                                            <?php } ?>
                                                        </select></td>
                                                    <td class="right"><input type="text" name="notify_when_arrives_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
                                                    <td class="left"><a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><span><?php echo $button_remove; ?></span></a></td>
                                                </tr>
                                            </tbody>
                                            <?php $module_row++; ?>
                                        <?php } ?>

                                    <?php } ?>
                                    <tfoot>
                                        <tr>
                                            <td colspan="4"></td>
                                            <td class="left"><a onclick="addModule();" class="button"><span><?php echo $button_add_module; ?></span></a></td>
                                        </tr>
                                    </tfoot>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="tab-mail">
                    <table class="form">
                        <tr>
                            <td colspan="2">
                                <div id="languages" class="htabs">
                                    <?php foreach ($languages as $language) { ?>
                                        <a href="#language<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
                                    <?php } ?>
                                </div> 
                                <?php foreach ($languages as $language) { ?>
                                    <div id="language<?php echo $language['language_id']; ?>">
                                        <table class="form">
                                            <tr>
                                                <td><?php echo $entry_subject_costumer; ?></td>
                                                <td><input size="100" name="notify_when_arrives_subject_<?php echo $language['language_id']; ?>_costumer" value="<?php echo isset($notify_when_arrives_subject[$language['language_id']]['costumer']) ? $notify_when_arrives_subject[$language['language_id']]['costumer'] : ''; ?>"/></td>
                                            </tr>
                                            <tr>
                                                <td><?php echo $entry_mail_costumer; ?></td>
                                                <td><textarea name="notify_when_arrives_mail_<?php echo $language['language_id']; ?>_costumer" cols="100" rows="10"><?php echo isset($notify_when_arrives_mail[$language['language_id']]['costumer']) ? $notify_when_arrives_mail[$language['language_id']]['costumer'] : ''; ?></textarea></td>
                                            </tr>
                                            <tr>
                                                <td><?php echo $entry_subject_admin; ?></td>
                                                <td><input size="100" name="notify_when_arrives_subject_<?php echo $language['language_id']; ?>_admin" value="<?php echo isset($notify_when_arrives_subject[$language['language_id']]['admin']) ? $notify_when_arrives_subject[$language['language_id']]['admin'] : ''; ?>"/></td>
                                            </tr>
                                            <tr>
                                                <td><?php echo $entry_mail_admin; ?></td>
                                                <td><textarea name="notify_when_arrives_mail_<?php echo $language['language_id']; ?>_admin" cols="100" rows="10"><?php echo isset($notify_when_arrives_mail[$language['language_id']]['costumer']) ? $notify_when_arrives_mail[$language['language_id']]['admin'] : ''; ?></textarea></td>
                                            </tr>
                                        </table>
                                    </div>
                                <?php } ?>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="tab-statistics">
                    <?php if (empty($product_statistics)) { ?>
                        <?php echo $text_no_data; ?>
                    <?php } else { ?>
                        <div style="clear:both;">

                            <div style="margin-bottom: 5px;float: left;" id="notify_button"><a class="button" onclick="notifyNow();"><span><?php echo $button_notify; ?> </span></a></div>          

                        </div>
                        <table class="list" id="statistics">
                            <thead>
                                <tr>
                                    <td><?php echo $text_product_name; ?></td>
                                    <td><?php echo $text_product_requested; ?></td>
                                    <td><?php echo $text_product_notified; ?></td>
                                    <td width="350"><?php echo $text_product_emails; ?></td>
                                    <td><?php echo $text_delete_statistic; ?></td>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($product_statistics as $product_id => $product) { ?>
                                    <tr id="statistics_<?php echo $product_id; ?>">
                                        <td style="padding:5px;"><?php echo $product['name']; ?></td>
                                        <td id="statistics_<?php echo $product_id; ?>_requested"><?php echo $product['requested']; ?></td>
                                        <td id="statistics_<?php echo $product_id; ?>_notified"><?php echo $product['notified']; ?></td>
                                        <td>
                                            <?php if ($product['mails']){ ?>
                                            [ <a class="view_mails">
                                                <span><?php echo $text_view_mails; ?></span>
                                                <span style="display:none;"><?php echo $text_hide_mails; ?></span>
                                            </a> ]
                                            <div style="display:none;"><?php echo $product['mails']; ?></div>
                                            <?php }else{  ?>
                                            -
                                            <?php } ?>
                                        </td>
                                        <td>[ <a onclick="deleteStatistic('<?php echo $product_id; ?>')"><span><?php echo $button_remove; ?></span> ]</td>
                                    </tr>
                                <?php } ?>
                            </tbody>
                        </table>
                    <?php } ?>
                </div>
        </div>      
        </form>
    </div>
</div>
<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript"><!--
<?php foreach ($languages as $language) { ?>
        CKEDITOR.replace('notify_when_arrives_mail_<?php echo $language['language_id']; ?>_costumer', {
            filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
            filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
            filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
            filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
            filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
            filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
        });
        CKEDITOR.replace('notify_when_arrives_mail_<?php echo $language['language_id']; ?>_admin', {
            filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
            filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
            filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
            filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
            filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
            filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
        });
<?php } ?>
    //--></script> 
<script type="text/javascript"><!--
    
    $('#tabs a').tabs(); 
    $('#languages a').tabs(); 
    //--></script>
<script type="text/javascript"><!--
    
   $(function(){
      
        $('#use_custom').change(function(){
 
            if ($(this).is(':checked')){

                $('#custom,#custom input,#custom select').removeAttr('disabled').css('color','black');
                
            }else{

                $('#custom,#custom input,#custom select,').attr('disabled','disabled').css('color','grey');
            }
            
        });
        
           $('#use_custom').trigger('change');
       
   });
    //--></script>
<script type="text/javascript"><!--
    $('.view_mails').live('click',function(){
        
        $(this).parent().children('div').toggle('slow');
        
        $(this).children('span').toggle();
    });
    
    //--></script>

<script type="text/javascript"><!--
    
    
    function deleteStatistic(product_id){
        
        if (window.confirm('<?php echo $text_confirm_delete; ?>')){
            
            $.ajax({
                type: 'POST',
                url: 'index.php?route=module/notify_when_arrives/delete&token=<?php echo $token; ?>',
                dataType: 'json',
                data: 'product_id=' + product_id,
                beforeSend: function() {
                    $(this).after('<img style="vertical-align:center" src="view/image/loading.gif" alt="" id="loading" />');
                },
                complete: function() {
  
                    $('#loading').remove();
                },
                success: function(json) {
 
                    if (json['error']) {
			
                        alert('<?php echo $text_delete_error; ?>');
                    }
			
                    if (json['success']) {
                            
                        $('#statistics_'+ product_id).remove();
         
                        alert('<?php echo $text_delete_ok; ?>');
		 
                    }
                        
                        
                }
               
                
            });
        
        }
    }
    
    function notifyNow(){
          
        $.ajax({
            type: 'POST',
            url: 'index.php?route=module/notify_when_arrives/notify&token=<?php echo $token; ?>',
            dataType: 'json',
            data: '',
            beforeSend: function() {
                $('#notify_button').after('<img style="vertical-align:center" src="view/image/loading.gif" alt="" id="loading" />');
            },
            complete: function() {
	 
                $('#loading').remove();
            },
            success: function(json) {
                var  html = '';
		
                if (json){
   
                    var  statistic  = null;
                            
                    for(var i in json){

                        statistic = json[i];
           
                        html+='<tr id="statistics_' + i + '">';
                        html+='<td style="padding:5px;">' + statistic['name'] + '</td>';
                        html+='<td id="statistics_' + i + '_requested">' + statistic['requested'] + '</td>';
                        html+='<td id="statistics_' + i + '_notified">' + statistic['notified'] + '</td>';
                        html+='<td>';
                        if (statistic['mails']){
                            
                            html+='[ <a class="view_mails">';
                            html+=' <span><?php echo $text_view_mails; ?></span>';
                            html+=' <span style="display:none;"><?php echo $text_hide_mails; ?></span>';
                            html+=' </a> ]';
                            html+=' <div style="display:none;" class="statistics_mails">' + statistic['mails'] + '</div>';
                        
                        }else{
                            
                             html+='-';
                        }
                        
                     
                        html+='  </td>';
                        html+=' <td>[ <a onclick="deleteStatistic(\'' + i + '\')"><span><?php echo $button_remove; ?></span> ]</td>';
                        html+=' </tr>';
  
                    }
      
                    $('#statistics tbody').html(html);
             
                }
                        
                if ($('#msg_update').length ==0){
                        
                    $('#notify_button').after('<span id="msg_update" style="color:green;margin-left:10px;"><?php echo $text_updated; ?></span>');
       
                }
            }
        });
       
        
    }

    
    
    //--></script>
<?php if ($version == '1.5.0') { ?>

    <script type="text/javascript"><!--
        var module_row = <?php echo $module_row; ?>;

        function addModule() {	
            html  = '<tbody id="module-row' + module_row + '">';
            html += '  <tr>';
            html += '    <td class="left"><select name="notify_when_arrives_' + module_row + '_layout_id">';
    <?php foreach ($layouts as $layout) { ?>
                html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>';
    <?php } ?>
            html += '    </select></td>';
            html += '    <td class="left"><select name="notify_when_arrives_' + module_row + '_position">';
            html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
            html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
            html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
            html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
            html += '    </select></td>';
            html += '    <td class="left"><select name="notify_when_arrives_' + module_row + '_status">';
            html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
            html += '      <option value="0"><?php echo $text_disabled; ?></option>';
            html += '    </select></td>';
            html += '    <td class="right"><input type="text" name="notify_when_arrives_' + module_row + '_sort_order" value="" size="3" /></td>';
            html += '    <td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><span><?php echo $button_remove; ?></span></a></td>';
            html += '  </tr>';
            html += '</tbody>';
                        	
            $('#module tfoot').before(html);
                        	
            module_row++;
        }

        $('#form').bind('submit', function() {
            var module = new Array(); 

            $('#module tbody').each(function(index, element) {
                module[index] = $(element).attr('id').substr(10);
            });
                        	
            $('input[name=\'notify_when_arrives_module\']').attr('value', module.join(','));
        });
        //--></script>

<?php } else { ?>
    <script type="text/javascript"><!--
        var module_row = <?php echo $module_row; ?>;

        function addModule() {	
            html  = '<tbody id="module-row' + module_row + '">';
            html += '  <tr>';
            html += '    <td class="left"><select name="notify_when_arrives_module[' + module_row + '][layout_id]">';
    <?php foreach ($layouts as $layout) { ?>
                html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>';
    <?php } ?>
            html += '    </select></td>';
            html += '    <td class="left"><select name="notify_when_arrives_module[' + module_row + '][position]">';
            html += '      <option value="content_top"><?php echo $text_content_top; ?></option>';
            html += '      <option value="content_bottom"><?php echo $text_content_bottom; ?></option>';
            html += '      <option value="column_left"><?php echo $text_column_left; ?></option>';
            html += '      <option value="column_right"><?php echo $text_column_right; ?></option>';
            html += '    </select></td>';
            html += '    <td class="left"><select name="notify_when_arrives_module[' + module_row + '][status]">';
            html += '      <option value="1" selected="selected"><?php echo $text_enabled; ?></option>';
            html += '      <option value="0"><?php echo $text_disabled; ?></option>';
            html += '    </select></td>';
            html += '    <td class="right"><input type="text" name="notify_when_arrives_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
            html += '    <td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><span><?php echo $button_remove; ?></span></a></td>';
            html += '  </tr>';
            html += '</tbody>';
                        	
            $('#module tfoot').before(html);
                        	
            module_row++;
        }
        //--></script>
<?php } ?>
<?php echo $footer; ?> 