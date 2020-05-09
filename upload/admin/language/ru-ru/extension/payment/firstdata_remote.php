<?php
// Heading
$_['heading_title']                  = 'First Data EMEA Web Service API';

// Text
$_['text_firstdata_remote']          = '<img src="view/image/payment/firstdata.png" alt="First Data" title="First Data" style="border: 1px solid #EEEEEE;" />';
$_['text_extension']                 = 'Расширения';
$_['text_success']                   = 'Успешно: Вы изменили данные учетной записи First Data!';
$_['text_edit']                      = 'Редактировать First Data EMEA Web Service API';
$_['text_card_type']                 = 'Тип карты';
$_['text_enabled']                   = 'Включено';
$_['text_merchant_id']               = 'Идентификатор магазина';
$_['text_subaccount']                = 'Субсчет';
$_['text_user_id']                   = 'Идентификатор пользователя';
$_['text_capture_ok']                = 'Получение прошло успешно';
$_['text_capture_ok_order']          = 'Получение прошло успешно, статус заказа обновлен до успешного - выполнено';
$_['text_refund_ok']                 = 'Возврат прошел успешно';
$_['text_refund_ok_order']           = 'Возврат прошел успешно, статус заказа обновлен до возвращенного';
$_['text_void_ok']                   = 'Аннулирование выполнено успешно, статус заказа обновлен до аннулированного';
$_['text_settle_auto']               = 'Продажа';
$_['text_settle_delayed']            = 'Предварительная аутентификация';
$_['text_mastercard']                = 'Mastercard';
$_['text_visa']                      = 'Visa';
$_['text_diners']                    = 'Diners';
$_['text_amex']                      = 'American Express';
$_['text_maestro']                   = 'Maestro';
$_['text_payment_info']              = 'Платежная информация';
$_['text_capture_status']            = 'Платеж получен';
$_['text_void_status']               = 'Платеж аннулирован';
$_['text_refund_status']             = 'Платеж возвращен';
$_['text_order_ref']                 = 'Заказ ссылка';
$_['text_order_total']               = 'Всего разрешено';
$_['text_total_captured']            = 'Всего получено';
$_['text_transactions']              = 'Транзакции';
$_['text_column_amount']             = 'Количество';
$_['text_column_type']               = 'Тип';
$_['text_column_date_added']         = 'Создан';
$_['text_confirm_void']              = 'Вы уверены, что хотите аннулировать платеж?';
$_['text_confirm_capture']           = 'Вы уверены, что хотите получить платеж?';
$_['text_confirm_refund']            = 'Вы уверены, что хотите вернуть платеж?';

// Entry
$_['entry_certificate_path']         = 'Путь сертификата';
$_['entry_certificate_key_path']     = 'Путь к приватному ключу';
$_['entry_certificate_key_pw']       = 'Пароль к приватному ключу';
$_['entry_certificate_ca_path']      = 'CA путь';
$_['entry_merchant_id']              = 'Идентификатор магазина';
$_['entry_user_id']                  = 'Идентификатор пользователя';
$_['entry_password']                 = 'Пароль';
$_['entry_total']                    = 'Всего';
$_['entry_sort_order']               = 'Порядок сортировки';
$_['entry_geo_zone']                 = 'Геозона';
$_['entry_status']                   = 'Статус';
$_['entry_debug']                    = 'Журнал отладки';
$_['entry_auto_settle']              = 'Тип расчета';
$_['entry_status_success_settled']   = 'Успешно - решен';
$_['entry_status_success_unsettled'] = 'Успешно - не решен';
$_['entry_status_decline']           = 'Сниженный';
$_['entry_status_void']              = 'Аннулированный';
$_['entry_status_refund']            = 'Возвращенный';
$_['entry_enable_card_store']        = 'Включить токены для хранения карт';
$_['entry_cards_accepted']           = 'Типы карт принимаются';

// Help
$_['help_total']                     = 'Общая сумма, которую должен достичь заказ, прежде чем этот метод оплаты станет активным';
$_['help_certificate']               = 'Сертификаты и закрытые ключи должны храниться вне ваших общедоступных веб-папок.';
$_['help_card_select']               = 'Попросите пользователя выбрать тип своей карты, прежде чем он будет перенаправлен';
$_['help_notification']              = 'Вам необходимо указать этот URL для первых данных, чтобы получать уведомления о платежах';
$_['help_debug']                     = 'Включение отладки приведет к записи конфиденциальных данных в файл журнала. Вы должны всегда отключать, если не указано иное.';
$_['help_settle']                    = 'Если Вы используете предварительную авторизацию, Вы должны выполнить действие после авторизации в течение 3-5 дней, в противном случае Ваша транзакция будет отклонена.';

// Tab
$_['tab_account']                    = 'API инфо';
$_['tab_order_status']               = 'Статус заказа';
$_['tab_payment']                    = 'Настройки оплаты';

// Button
$_['button_capture']                 = 'Получить';
$_['button_refund']                  = 'Вернуть';
$_['button_void']                    = 'Аннулировать';

// Error
$_['error_merchant_id']              = 'Идентификатор магазина обязателен';
$_['error_user_id']                  = 'Идентификатор пользователя обязателен';
$_['error_password']                 = 'Пароль обязателен';
$_['error_certificate']              = 'Путь сертификата обязателен';
$_['error_key']                      = 'Ключ сертификата обязателен';
$_['error_key_pw']                   = 'Пароль к ключу сертификата обязателен';
$_['error_ca']                       = 'Центр сертификации (CA) обязателен';