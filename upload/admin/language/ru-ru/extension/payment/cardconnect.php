<?php
// Heading
$_['heading_title']                 = 'CardConnect';

// Tab
$_['tab_settings']                  = 'Настройки';
$_['tab_order_status']              = 'Статус заказа';

// Text
$_['text_extension']                = 'Расширения';
$_['text_success']                  = 'Успешно: Вы изменили модуль оплаты CardConnect!';
$_['text_edit']                     = 'Редактировать CardConnect';
$_['text_cardconnect']              = '<a href="http://www.cardconnect.com" target="_blank"><img src="view/image/payment/cardconnect.png" alt="CardConnect" title="CardConnect"></a>';
$_['text_payment']                  = 'Платеж';
$_['text_authorize']                = 'Авторизовать';
$_['text_live']                     = 'Реальный';
$_['text_test']                     = 'Тестовый';
$_['text_no_cron_time']             = 'Cron еще не был выполнен';
$_['text_payment_info']             = 'Платежная информация';
$_['text_payment_method']           = 'Метод оплаты';
$_['text_card']                     = 'Карта';
$_['text_echeck']                   = 'eCheck';
$_['text_reference']                = 'Ссылка';
$_['text_update']                   = 'Обновить';
$_['text_order_total']              = 'Всего заказов';
$_['text_total_captured']           = 'Всего полученных';
$_['text_capture_payment']          = 'Получение оплаты';
$_['text_refund_payment']           = 'Возврат оплаты';
$_['text_void']                     = 'Аннулировать';
$_['text_transactions']             = 'Транзакции';
$_['text_column_type']              = 'Тип';
$_['text_column_reference']         = 'Ссылка';
$_['text_column_amount']            = 'Количество';
$_['text_column_status']            = 'Статус';
$_['text_column_date_modified']     = 'Дата изменения';
$_['text_column_date_added']        = 'Дата добавления';
$_['text_column_update']            = 'Обновить';
$_['text_column_void']              = 'Аннулировать';
$_['text_confirm_capture']          = 'Вы уверены, что хотите получить платеж?';
$_['text_confirm_refund']           = 'Вы уверены, что хотите вернуть платеж?';
$_['text_inquire_success']          = 'Запрос был успешным';
$_['text_capture_success']          = 'Запрос на получение был успешным';
$_['text_refund_success']           = 'Запрос на возврат был успешным';
$_['text_void_success']             = 'Запрос на аннулирование был успешным';

// Entry
$_['entry_merchant_id']             = 'Идентификатор продавца';
$_['entry_api_username']            = 'Имя пользователя API';
$_['entry_api_password']            = 'Пароль API';
$_['entry_token']                   = 'Секретный токен';
$_['entry_transaction']             = 'Транзакции';
$_['entry_environment']             = 'Окружение';
$_['entry_site']                    = 'Сайт';
$_['entry_store_cards']             = 'Карты магазина';
$_['entry_echeck']                  = 'eCheck';
$_['entry_total']                   = 'Всего';
$_['entry_geo_zone']                = 'Геозона';
$_['entry_status']                  = 'Статус';
$_['entry_logging']                 = 'Журнал отладки';
$_['entry_sort_order']              = 'Порядок сортировки';
$_['entry_cron_url']                = 'URL задания Cron';
$_['entry_cron_time']               = 'Последний запуск задания Cron';
$_['entry_order_status_pending']    = 'В ожидании';
$_['entry_order_status_processing'] = 'В обработке';

// Help
$_['help_merchant_id']              = 'Ваш личный идентификатор продавца в учетной записи CardConnect.';
$_['help_api_username']             = 'Ваше имя пользователя для доступа к API CardConnect.';
$_['help_api_password']             = 'Ваш пароль для доступа к API CardConnect.';
$_['help_token']                    = 'Введите случайный токен для безопасности или используйте сгенерированный.';
$_['help_transaction']              = 'Выберите «Платеж», чтобы немедленно получить платеж, или «Авторизовать», чтобы подтвердить его.';
$_['help_site']                     = 'Это определяет первую часть URL API. Изменять только в случае указания.';
$_['help_store_cards']              = 'Хотите ли Вы хранить карты с помощью токенизации.';
$_['help_echeck']                   = 'Хотите ли Вы предложить возможность оплаты с помощью eCheck.';
$_['help_total']                    = 'Общая сумма должна быть достигнута, прежде чем этот метод оплаты станет активным. Должно быть значением без знака валюты.';
$_['help_logging']                  = 'Включение отладки приведет к записи конфиденциальных данных в файл журнала. Вы должны всегда отключать, если не указано иное.';
$_['help_cron_url']                 = 'Установите задание cron для вызова этого URL, чтобы заказы автоматически обновлялись. Он предназначен для запуска через несколько часов после последнего получения рабочего дня.';
$_['help_cron_time']                = 'Это последний раз, когда URL задания cron был выполнен.';
$_['help_order_status_pending']     = 'Статус заказа, когда заказ должен быть авторизован продавцом.';
$_['help_order_status_processing']  = 'Статус заказа при автоматическом получении заказа.';

// Button
$_['button_inquire_all']            = 'Узнать все';
$_['button_capture']                = 'Получить';
$_['button_refund']                 = 'Вернуть';
$_['button_void_all']               = 'Аннулировать все';
$_['button_inquire']                = 'Узнать';
$_['button_void']                   = 'Аннулировать';

// Error
$_['error_permission']              = 'Предупреждение: У Вас нет разрешения на изменение платежа CardConnect!';
$_['error_merchant_id']             = 'Идентификатор продавца обязателен!';
$_['error_api_username']            = 'Имя пользователя API обязательно!';
$_['error_api_password']            = 'Пароль API обязателен!';
$_['error_token']                   = 'Секретный токен обязателен!';
$_['error_site']                    = 'Сайт обязателен!';
$_['error_amount_zero']             = 'Сумма должна быть выше нуля!';
$_['error_no_order']                = 'Нет информации о заказе!';
$_['error_invalid_response']        = 'Получен неверный ответ!';
$_['error_data_missing']            = 'Отсутствующие данные!';
$_['error_not_enabled']             = 'Модуль не включен!';