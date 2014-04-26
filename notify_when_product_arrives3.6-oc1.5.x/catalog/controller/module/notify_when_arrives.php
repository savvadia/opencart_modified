<?php

class ControllerModuleNotifyWhenArrives extends Controller {

    public function index() {

        if ($this->config->get('notify_when_arrives_status')) {

            $skip_customer_group = (array) explode(',', $this->config->get('notify_when_arrives_customer_group'));

            $customer_group = $this->customer->getCustomerGroupId() ? $this->customer->getCustomerGroupId() : 'not_logged';

            if (in_array($customer_group, $skip_customer_group)) {

                return; // skip
            }

            $this->language->load('module/notify_when_arrives');
            $this->load->model('module/notify_when_arrives');
            $this->load->model('catalog/product');

            $this->data['heading_title'] = $this->language->get('heading_title');
            $this->data['text_description'] = $this->language->get('text_description');
            $this->data['text_stock'] = $this->language->get('text_stock');

            $this->data['button_register'] = $this->language->get('button_register');
            $this->data['button_category'] = $this->language->get('button_category');
            $this->data['button_close'] = $this->language->get('button_close');

            $this->data['notify_product_id'] = null;
            $this->data['notify_email'] = $this->customer->getEmail();
            $this->data['notify_name'] = $this->customer->getFirstName() . ' ' . $this->customer->getLastName();
            $this->data['notify_phone'] = $this->customer->getTelephone();

            $this->data['out_stock_product'] = false;

            $this->data['out_stock_option'] = false;

            $this->data['gray_style'] = $this->config->get('notify_button');

            $this->data['nwa_list_show_mode'] = $this->config->get('notify_when_arrives_show_mode');
            $this->data['nwa_product_show_mode'] = (int) $this->config->get('nwa_replace_mode');

            $this->data['nwa_entry_mail'] = '';
            $this->data['nwa_entry_name'] = $this->language->get('nwa_entry_name');
            $this->data['nwa_entry_phone'] = $this->language->get('nwa_entry_phone');
            $this->data['nwa_entry_custom'] = $this->config->get('nwa_custom_name');

            $this->data['nwa_use_name'] = (bool) $this->config->get('nwa_use_name');
            $this->data['nwa_use_phone'] = (bool) $this->config->get('nwa_use_phone');
            $this->data['nwa_use_custom'] = (bool) $this->config->get('nwa_use_custom');

            if ($this->data['nwa_use_name'] || $this->data['nwa_use_phone'] || $this->data['nwa_use_custom']) {

                $this->data['text_description'] = $this->language->get('text_description_2');
                $this->data['nwa_entry_mail'] = $this->language->get('nwa_entry_mail');
            }

            $this->data['out_stock_list'] = false;

            if (isset($this->request->get['product_id'])) {

                $this->data['notify_product_id'] = $this->request->get['product_id'];

                $product = $this->model_catalog_product->getProduct($this->request->get['product_id']);

                if ($product) {

                    if (!isset($product['stock_status_id'])) {

                        $product['stock_status_id'] = $this->model_module_notify_when_arrives->getProductStatusId($product['product_id']);
                    }

                    $skip_list = (array) explode(',', $this->config->get('notify_when_arrives_skip_status'));

                    if ((int) $product['quantity'] <= 0 && !in_array($product['stock_status_id'], $skip_list)) {

                        $this->data['out_stock_product'] = true;
                    }

                    if (!in_array($product['stock_status_id'], $skip_list)) {

                        $this->data['out_stock_option'] = true;
                    }
                }
            }

            $out_stock_list = $this->model_module_notify_when_arrives->getOutOfstockList();

            $this->data['out_stock_list'] = implode(',', $out_stock_list);

            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/notify_when_arrives.tpl')) {

                $this->template = $this->config->get('config_template') . '/template/module/notify_when_arrives.tpl';
            } else {

                $this->template = 'default/template/module/notify_when_arrives.tpl';
            }

            $this->render();
        }
    }

    public function register() {

        $this->language->load('module/notify_when_arrives');

        if (isset($this->request->post['notify_email']) && isset($this->request->post['notify_product_id'])) {

            $email = $this->request->post['notify_email'];
            $phone = $this->request->post['notify_phone'] != 'undefined' ? $this->request->post['notify_phone']: '';
            $name = $this->request->post['notify_name']!= 'undefined' ? $this->request->post['notify_name']: '';
            $custom = $this->request->post['notify_custom']!= 'undefined' ? $this->request->post['notify_custom']: '';

            $product_id = (int) $this->request->post['notify_product_id'];
            $option_id = (isset($this->request->post['notify_option_id'])) ? $this->request->post['notify_option_id'] : null;
            $option_value_id = (isset($this->request->post['notify_option_value_id'])) ? $this->request->post['notify_option_value_id'] : null;

            if ($this->validate()) {

                $this->load->model('module/notify_when_arrives');

                $reg_status = $this->model_module_notify_when_arrives->register($email, $name, $phone, $custom, $product_id, $option_id, $option_value_id);

                if ($reg_status) {

                    if ($reg_status !== 'exists' && $this->config->get('notify_admin')) {

                        $product_name = $this->model_module_notify_when_arrives->getProductName($product_id);

                        if ($option_id && $option_value_id) {

                            $option_name = $this->model_module_notify_when_arrives->getOptionName($option_id);

                            $option_value_name = $this->model_module_notify_when_arrives->getOptionValueName($option_value_id);

                            $product_name.= ' (' . $option_name . ' : ' . $option_value_name . ')';
                        }

                        $subject = str_replace('{product_name}', $product_name, $this->language->get('mail_admin_subject'));

                        $message = str_replace(
                                array(
                            '{customer_name}',
                            '{customer_email}',
                            '{customer_phone}',
                            '{custom_field}',
                            '{customer_custom}',
                            '{product_name}'), array(
                            $name,
                            $email,
                            $phone,
                            $this->config->get('nwa_custom_name'),
                            $custom,
                            $product_name)
                                , $this->language->get('mail_admin_body'));


                        $this->sendEmail($subject, $message);
                    }

                    $json = array('sucess' => $reg_status, 'msg' => $this->language->get('text_success'));
                } else {

                    $json = array('sucess' => $reg_status, 'msg' => $this->language->get('text_error_mail'));
                }
            } else {

                $json = array('sucess' => false, 'msg' => $this->data['text_error']);
            }
        } else {

            $json = array('sucess' => false, 'msg' => $this->language->get('text_error_data'));
        }

        $this->response->setOutput(json_encode($json));
    }

    private function validate() {

        $this->data['text_error'] = false;

        $email = isset($this->request->post['notify_email']) ? $this->request->post['notify_email'] : '';

        if (!$email || !preg_match('/^[A-Za-z0-9._%+-]+@(?:[a-zA-Z0-9-]+\.)+[a-zA-Z]{2,4}$/', $email)) {

            $this->data['text_error'] = $this->language->get('text_error_mail');
        }

        $name = isset($this->request->post['notify_name']) ? $this->request->post['notify_name'] : '';

        if ($this->config->get('nwa_use_name') && (!$name || (utf8_strlen($name) < 3) || (utf8_strlen($name) > 32))) {

            $this->data['text_error'] = $this->language->get('text_error_name');
        }

        $phone = isset($this->request->post['notify_phone']) ? $this->request->post['notify_phone'] : '';

        if ($this->config->get('nwa_use_phone') && ((utf8_strlen($phone) < 3) || (utf8_strlen($phone) > 32))) {

            $this->data['text_error'] = $this->language->get('text_error_phone');
        }

        if ($this->config->get('nwa_use_custom')) {

            $custom = isset($this->request->post['notify_custom']) ? $this->request->post['notify_custom'] : '';

            switch ($this->config->get('nwa_custom_type')) {
                case 'number':
                    $exp = '/[0-9]{1,255}/';
                    break;
                case 'text':
                    $exp = '/[A-z\ ]{1,255}/';
                    break;
                case 'text_number':
                    $exp = '/[A-z0-9\ ]{1,255}/';
                    break;
                case 'any':
                    $exp = '/.{1,255}/';
                    break;
                default:
                    $exp = '/.{1,255}/';
                    break;
            }

            if (!$custom || !preg_match($exp, $custom)) {

                $this->data['text_error'] = str_replace('{custom_name}', $this->config->get('nwa_custom_name'), $this->language->get('text_error_custom'));
            }
        }
        return !$this->data['text_error'];
    }

    private function sendEmail($subject, $message) {

        if (!isset($this->notify_mail)) {

            $this->notify_mail = new Mail();
            $this->notify_mail->protocol = $this->config->get('config_mail_protocol');
            $this->notify_mail->parameter = $this->config->get('config_mail_parameter');
            $this->notify_mail->hostname = $this->config->get('config_smtp_host');
            $this->notify_mail->username = $this->config->get('config_smtp_username');
            $this->notify_mail->password = $this->config->get('config_smtp_password');
            $this->notify_mail->port = $this->config->get('config_smtp_port');
            $this->notify_mail->timeout = $this->config->get('config_smtp_timeout');
        }

        $this->notify_mail->setFrom($this->config->get('config_email'));
        $this->notify_mail->setSender($this->config->get('config_name'));
        $this->notify_mail->setTo($this->config->get('config_email'));

        $this->notify_mail->setSubject($subject);
        $this->notify_mail->setHtml($message);
        #$this->notify_mail->setText(html_entity_decode($text, ENT_QUOTES, 'UTF-8'));
        #$this->notify_mail->setSender($order_info['store_name']);
        #$this->notify_mail->addAttachment(DIR_IMAGE . $this->config->get('config_logo'), md5(basename($this->config->get('config_logo'))));

        $this->notify_mail->send();
    }

}

?>