<?php
// Heading
$_['heading_title']                  = 'Globalpay Remote';

// Text
$_['text_extension']                 = 'Расширения';
$_['text_success']                   = 'Успешно: Вы изменили Globalpay account details!';
$_['text_edit']                      = 'Редактировать Globalpay Remote';
$_['text_card_type']                 = 'Тип карты';
$_['text_enabled']                   = 'Включено';
$_['text_use_default']               = 'Использовать по умолчанию';
$_['text_merchant_id']               = 'Идентификатор продавца';
$_['text_subaccount']                = 'Субсчет';
$_['text_secret']                    = 'Общий секрет';
$_['text_card_visa']                 = 'Visa';
$_['text_card_master']               = 'Mastercard';
$_['text_card_amex']                 = 'American Express';
$_['text_card_switch']               = 'Switch/Maestro';
$_['text_card_laser']                = 'Laser';
$_['text_card_diners']               = 'Diners';
$_['text_capture_ok']                = 'Получение прошло успешно';
$_['text_capture_ok_order']          = 'Получение прошло успешно, статус заказа обновлен до успешного - выполнено';
$_['text_rebate_ok']                 = 'Скидка прошла успешно';
$_['text_rebate_ok_order']           = 'Скидка прошла успешно, статус заказа обновлен до скидки';
$_['text_void_ok']                   = 'Аннулирование выполнено успешно, статус заказа обновлен до аннулированного';
$_['text_settle_auto']               = 'Авто';
$_['text_settle_delayed']            = 'Задержанный';
$_['text_settle_multi']              = 'Мульти';
$_['text_ip_message']                = 'Вы должны предоставить IP-адрес своего сервера менеджеру своего аккаунта Globalpay, прежде чем начать работу';
$_['text_payment_info']              = 'Платежная информация';
$_['text_capture_status']            = 'Платеж получен';
$_['text_void_status']               = 'Платеж аннулирован';
$_['text_rebate_status']             = 'Платеж возвращен';
$_['text_order_ref']                 = 'Заказ ссылка';
$_['text_order_total']               = 'Всего разрешено';
$_['text_total_captured']            = 'Всего получено';
$_['text_transactions']              = 'Транзакции';
$_['text_confirm_void']              = 'Вы уверены, что хотите аннулировать платеж?';
$_['text_confirm_capture']           = 'Вы уверены, что хотите получить платеж?';
$_['text_confirm_rebate']            = 'Вы уверены, что хотите вернуть платеж?';
$_['text_globalpay_remote']          = '<a target="_blank" href="https://www.globalpaymentsinc.com/en-ie/accept-payments/ecommerce/partners/opencart"><img src="view/image/payment/globalpay.png" alt="Globalpay" title="Globalpay" style="border: 1px solid #EEEEEE;" /></a>';

// Column
$_['text_column_amount']             = 'Количество';
$_['text_column_type']               = 'Тип';
$_['text_column_date_added']         = 'Создан';

// Entry
$_['entry_merchant_id']              = 'Идентификатор продавца';
$_['entry_secret']                   = 'Общий секрет';
$_['entry_rebate_password']          = 'Восстановить пароль';
$_['entry_total']                    = 'Всего';
$_['entry_sort_order']               = 'Порядок сортировки';
$_['entry_geo_zone']                 = 'Геозона';
$_['entry_status']                   = 'Статус';
$_['entry_debug']                    = 'Журнал отладки';
$_['entry_auto_settle']              = 'Тип расчета';
$_['entry_tss_check']                = 'TSS проверка';
$_['entry_card_data_status']         = 'Регистрация информации о карте';
$_['entry_3d']                       = 'Включить 3D secure';
$_['entry_liability_shift']          = 'Принять сценарии перехода без обязательств';
$_['entry_status_success_settled']   = 'Успешно - решен';
$_['entry_status_success_unsettled'] = 'Успешно - не решен';
$_['entry_status_decline']           = 'Сниженный';
$_['entry_status_decline_pending']   = 'Отклонить - автономная аутентификация';
$_['entry_status_decline_stolen']    = 'Отклонить - потерянная или украденная карта';
$_['entry_status_decline_bank']      = 'Отклонить - ошибка банка';
$_['entry_status_void']              = 'Аннулированный';
$_['entry_status_rebate']            = 'Сниженный';

// Help
$_['help_total']                     = 'Общая сумма, которую должен достичь заказ, прежде чем этот метод оплаты станет активным';
$_['help_card_select']               = 'Попросите пользователя выбрать тип своей карты, прежде чем он будет перенаправлен';
$_['help_notification']              = 'Вам необходимо указать этот URL для Globalpay, чтобы получать уведомления о платежах';
$_['help_debug']                     = 'Включение отладки приведет к записи конфиденциальных данных в файл журнала. Вы должны всегда отключать, если не указано иное.';
$_['help_liability']                 = 'Принятие ответственности означает, что Вы по-прежнему будете принимать платежи, когда пользователь отказывается от 3D secure.';
$_['help_card_data_status']          = 'Записывает последние 4 карты, цифры, срок действия, имя, тип и информацию о выдаче банка';

// Tab
$_['tab_api']                        = 'Детали API';
$_['tab_account']                    = 'Счета';
$_['tab_order_status']               = 'Статус заказа';
$_['tab_payment']                    = 'Настройки оплаты';

// Button
$_['button_capture']                 = 'Получить';
$_['button_rebate']                  = 'Скидка / вернуть';
$_['button_void']                    = 'Аннулировать';

// Error
$_['error_merchant_id']              = 'Идентификатор продавца обязателен';
$_['error_secret']                   = 'Общий секрет обязателен';