<?php
// Text
$_['text_title']          = 'Klarna Invoice - Оплата в течение 14 дней';
$_['text_terms_fee']      = '<span id="klarna_invoice_toc"></span> (+%s)<script type="text/javascript">var terms = new Klarna.Terms.Invoice({el: \'klarna_invoice_toc\', eid: \'%s\', country: \'%s\', charge: %s});</script>';
$_['text_terms_no_fee']   = '<span id="klarna_invoice_toc"></span><script type="text/javascript">var terms = new Klarna.Terms.Invoice({el: \'klarna_invoice_toc\', eid: \'%s\', country: \'%s\'});</script>';
$_['text_additional']     = 'Klarna Invoice требует дополнительной информации, прежде чем они смогут обработать Ваш заказ.';
$_['text_male']           = 'Мужчина';
$_['text_female']         = 'Женщина';
$_['text_year']           = 'Год';
$_['text_month']          = 'Месяц';
$_['text_day']            = 'День';
$_['text_comment']        = 'Klarna\'s идентификатор счета: %s. ' . "\n" . '%s/%s: %.4f';

// Entry
$_['entry_gender']        = 'Пол';
$_['entry_pno']           = 'Персональный номер';
$_['entry_dob']           = 'Дата рождения';
$_['entry_phone_no']      = 'Телефонный номер';
$_['entry_street']        = 'Улица';
$_['entry_house_no']      = 'Дом №';
$_['entry_house_ext']     = 'Дом доб.';
$_['entry_company']       = 'Регистрационный номер компании';

// Help
$_['help_pno']            = 'Пожалуйста, введите здесь свой номер социального страхования.';
$_['help_phone_no']       = 'Пожалуйста введите Ваш номер телефона.';
$_['help_street']         = 'Обратите внимание, что при оплате с помощью Klarna доставка может осуществляться только на зарегистрированный адрес.';
$_['help_house_no']       = 'Пожалуйста, введите номер Вашего дома.';
$_['help_house_ext']      = 'Пожалуйста, отправьте сюда пристройку дома. Например. A, B, C, красный, синий и т. д.';
$_['help_company']        = 'Пожалуйста, введите регистрационный номер Вашей компании';

// Error
$_['error_deu_terms']     = 'Вы должны согласиться с политикой конфиденциальности Klarna (Datenschutz)';
$_['error_address_match'] = 'Адреса выставления счетов и доставки должны совпадать, если Вы хотите использовать счет-фактуру Klarna.';
$_['error_network']       = 'Ошибка при подключении к Klarna. Пожалуйста, попробуйте позже.';