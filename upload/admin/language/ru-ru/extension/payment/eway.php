<?php
// Heading
$_['heading_title']             = 'eWAY Payment';

// Text
$_['text_extension']            = 'Расширения';
$_['text_success']              = 'Успешно: Вы изменили Ваш eWAY details!';
$_['text_edit']                 = 'Редактировать eWAY';
$_['text_eway']                 = '<a target="_BLANK" href="http://www.eway.com.au/"><img src="view/image/payment/eway.png" alt="eWAY" title="eWAY" style="border: 1px solid #EEEEEE;" /></a>';
$_['text_authorisation']        = 'Авторизация';
$_['text_sale']                 = 'Продажа';
$_['text_transparent']          = 'Прозрачный редирект (форма оплаты на сайте)';
$_['text_iframe']               = 'IFrame (форма оплаты в окне)';
$_['text_connect_eway']         = 'Начните принимать платежи по кредитным картам с помощью eWAY и OpenCart всего за 5 минут. У Вас нет учетной записи eWAY <a target="_blank" href="https://myeway.force.com/success/accelerator-signup?pid=4382&pa=0012000000ivcWf">кликните здесь</a>';
$_['text_eway_image']           = '<a target="_BLANK" href="https://myeway.force.com/success/accelerator-signup?pid=4382&pa=0012000000ivcWf"><img src="view/image/payment/eway_connect.png" alt="eWAY" title="eWAY" class="img-fluid" /></a>';

// Entry
$_['entry_paymode']             = 'Режим оплаты';
$_['entry_test']                = 'Тестовый режим';
$_['entry_order_status']        = 'Статус заказа';
$_['entry_order_status_refund'] = 'Статус возвращенного заказа';
$_['entry_order_status_auth']   = 'Статус авторизованного заказа';
$_['entry_order_status_fraud']  = 'Статус заказа подозреваемого в мошенничества';
$_['entry_status']              = 'Статус';
$_['entry_username']            = 'eWAY API ключ';
$_['entry_password']            = 'eWAY пароль';
$_['entry_payment_type']        = 'Тип оплаты';
$_['entry_geo_zone']            = 'Геозона';
$_['entry_sort_order']          = 'Порядок сортировки';
$_['entry_transaction_method']  = 'Метод транзакции';

// Error
$_['error_permission']          = 'Предупреждение: У Вас нет разрешения на изменение модуля оплаты eWAY';
$_['error_username']            = 'eWAY API ключ обязателен!';
$_['error_password']            = 'eWAY пароль обязателен!';
$_['error_payment_type']        = 'Требуется хотя бы один тип оплаты!';

// Help hints
$_['help_testmode']             = 'Установите Да, чтобы использовать песочницу eWAY.';
$_['help_username']             = 'Ваш eWAY API ключ от Вашей учетной записи MYeWAY.';
$_['help_password']             = 'Ваш eWAY API пароль от Вашей учетной записи MYeWAY.';
$_['help_transaction_method']   = 'Авторизация доступна только для банков Австралии';

// Order page - payment tab
$_['text_payment_info']         = 'Платежная информация';
$_['text_order_total']          = 'Всего разрешено';
$_['text_transactions']         = 'Транзакции';
$_['text_column_transactionid'] = 'eWAY идентификатор транзакции';
$_['text_column_amount']        = 'Количество';
$_['text_column_type']          = 'Тип';
$_['text_column_created']       = 'Создан';
$_['text_total_captured']       = 'Всего получено';
$_['text_capture_status']       = 'Платеж получен';
$_['text_void_status']          = 'Платеж аннулирован';
$_['text_refund_status']        = 'Платеж возвращен';
$_['text_total_refunded']       = 'Всего возвращено';
$_['text_refund_success']       = 'Возврат выполнен!';
$_['text_capture_success']      = 'Получение выполнено!';
$_['text_refund_failed']        = 'Возврат не удался: ';
$_['text_capture_failed']       = 'Получение не удалось: ';
$_['text_unknown_failure']      = 'Неверный заказ или сумма';

$_['text_confirm_capture']      = 'Вы уверены, что хотите получить платеж?';
$_['text_confirm_release']      = 'Вы уверены, что хотите разблокировать платеж?';
$_['text_confirm_refund']       = 'Вы уверены, что хотите вернуть платеж?';

$_['text_empty_refund']         = 'Пожалуйста, введите сумму для возврата';
$_['text_empty_capture']        = 'Пожалуйста, введите сумму, чтобы получить';

$_['btn_refund']                = 'Вернуть';
$_['btn_capture']               = 'Получить';

// Validation Error codes
$_['text_card_message_V6000']   = 'Неопределенная ошибка проверки';
$_['text_card_message_V6001']   = 'Неверный IP-адрес клиента';
$_['text_card_message_V6002']   = 'Неверный идентификатор устройства';
$_['text_card_message_V6011']   = 'Неверное количество';
$_['text_card_message_V6012']   = 'Неверное описание счета';
$_['text_card_message_V6013']   = 'Неверный номер счета';
$_['text_card_message_V6014']   = 'Неверная ссылка на счет';
$_['text_card_message_V6015']   = 'Неверный код валюты';
$_['text_card_message_V6016']   = 'Оплата обязательна';
$_['text_card_message_V6017']   = 'Код валюты платежа обязателен';
$_['text_card_message_V6018']   = 'Неизвестный код валюты платежа';
$_['text_card_message_V6021']   = 'Имя владельца карты обязательно';
$_['text_card_message_V6022']   = 'Номер карты обязателен';
$_['text_card_message_V6023']   = 'CVN обязателен';
$_['text_card_message_V6031']   = 'Неверный номер карты';
$_['text_card_message_V6032']   = 'Неверный CVN';
$_['text_card_message_V6033']   = 'Неверная дата истечения срока действия';
$_['text_card_message_V6034']   = 'Неверный номер выпуска';
$_['text_card_message_V6035']   = 'Неверная дата начала';
$_['text_card_message_V6036']   = 'Неверный месяц';
$_['text_card_message_V6037']   = 'Неверный год';
$_['text_card_message_V6040']   = 'Неверный идентификатор клиента токена';
$_['text_card_message_V6041']   = 'Клиент обязателен';
$_['text_card_message_V6042']   = 'Имя клиента обязательно';
$_['text_card_message_V6043']   = 'Фамилия клиента обязательна';
$_['text_card_message_V6044']   = 'Код страны клиента обязателен';
$_['text_card_message_V6045']   = 'Название клиента обязательно';
$_['text_card_message_V6046']   = 'Идентификатор клиента токена обязателен';
$_['text_card_message_V6047']   = 'URL перенаправления обязателен';
$_['text_card_message_V6051']   = 'Неверное имя';
$_['text_card_message_V6052']   = 'Неверная фамилия';
$_['text_card_message_V6053']   = 'Неверный код страны';
$_['text_card_message_V6054']   = 'Неверный адрес электронной почты';
$_['text_card_message_V6055']   = 'Неверный телефон';
$_['text_card_message_V6056']   = 'Неверный мобильный';
$_['text_card_message_V6057']   = 'Неверный факс';
$_['text_card_message_V6058']   = 'Неверный заголовок';
$_['text_card_message_V6059']   = 'Неверный URL перенаправления';
$_['text_card_message_V6060']   = 'Неверный URL перенаправления';
$_['text_card_message_V6061']   = 'Неверная ссылка';
$_['text_card_message_V6062']   = 'Неверное название компании';
$_['text_card_message_V6063']   = 'Неверное описание работы';
$_['text_card_message_V6064']   = 'Неверная улица1';
$_['text_card_message_V6065']   = 'Неверная улица2';
$_['text_card_message_V6066']   = 'Неверный город';
$_['text_card_message_V6067']   = 'Неверная область';
$_['text_card_message_V6068']   = 'Неверный почтовый индекс';
$_['text_card_message_V6069']   = 'Неверный адрес электронной почты';
$_['text_card_message_V6070']   = 'Неверный телефон';
$_['text_card_message_V6071']   = 'Неверный мобильный';
$_['text_card_message_V6072']   = 'Неверный комментарий';
$_['text_card_message_V6073']   = 'Неверный факс';
$_['text_card_message_V6074']   = 'Неверный адрес';
$_['text_card_message_V6075']   = 'Неверное имя адреса доставки';
$_['text_card_message_V6076']   = 'Неверная фамилия адреса доставки';
$_['text_card_message_V6077']   = 'Неверная улица1 адреса доставки';
$_['text_card_message_V6078']   = 'Неверная улица2 адреса доставки';
$_['text_card_message_V6079']   = 'Неверный город адреса доставки';
$_['text_card_message_V6080']   = 'Неверная область адреса доставки';
$_['text_card_message_V6081']   = 'Неверный почтовый индекс адреса доставки';
$_['text_card_message_V6082']   = 'Неверный эл. адрес адреса доставки';
$_['text_card_message_V6083']   = 'Неверный телефон адреса доставки';
$_['text_card_message_V6084']   = 'Неверная страна адреса доставки';
$_['text_card_message_V6091']   = 'Неизвестный код страны';
$_['text_card_message_V6100']   = 'Неверное имя карты';
$_['text_card_message_V6101']   = 'Неверное месяц истечения срока действия карты';
$_['text_card_message_V6102']   = 'Неверное год истечения срока действия карты';
$_['text_card_message_V6103']   = 'Неверное месяц начала карты';
$_['text_card_message_V6104']   = 'Неверное год начала карты';
$_['text_card_message_V6105']   = 'Неверный номер выпуска карты';
$_['text_card_message_V6106']   = 'Неверная карта CVN';
$_['text_card_message_V6107']   = 'Неверный код доступа';
$_['text_card_message_V6108']   = 'Неверный адрес хоста клиента';
$_['text_card_message_V6109']   = 'Неверный пользовательский агент';
$_['text_card_message_V6110']   = 'Неверный номер карты';
$_['text_card_message_V6111']   = 'Несанкционированный доступ к API, учетная запись не сертифицирована PCI';
$_['text_card_message_V6112']   = 'Данные резервной карты, кроме года и месяца истечения срока действия';
$_['text_card_message_V6113']   = 'Неверная транзакция для возврата';
$_['text_card_message_V6114']   = 'Ошибка проверки шлюза';
$_['text_card_message_V6115']   = 'Неверное направление запроса возврата, идентификатор транзакции';
$_['text_card_message_V6116']   = 'Неверные данные карты на оригинальном идентификаторе транзакции';
$_['text_card_message_V6124']   = 'Неверные позиции. Позиции были предоставлены, однако итоги не совпадают с полем общая сумма';
$_['text_card_message_V6125']   = 'Выбранный тип оплаты не включен';
$_['text_card_message_V6126']   = 'Неверный номер зашифрованной карты, расшифровка не удалась';
$_['text_card_message_V6127']   = 'Неверно зашифрован cvn, расшифровка не удалась';
$_['text_card_message_V6128']   = 'Неверный метод для типа оплаты';
$_['text_card_message_V6129']   = 'Транзакция не была авторизована для получения/отмены';
$_['text_card_message_V6130']   = 'Общая ошибка информации о клиенте';
$_['text_card_message_V6131']   = 'Общая ошибка информации о доставке';
$_['text_card_message_V6132']   = 'Транзакция уже завершена или аннулирована, операция не разрешена';
$_['text_card_message_V6133']   = 'Оформление заказа недоступно для типа оплаты';
$_['text_card_message_V6134']   = 'Неверная аутентификация идентификатора транзакции для получения/аннулирования';
$_['text_card_message_V6135']   = 'Ошибка PayPal при обработке возврата';
$_['text_card_message_V6140']   = 'Аккаунт продавца приостановлен';
$_['text_card_message_V6141']   = 'Неверные данные учетной записи PayPal или подпись API';
$_['text_card_message_V6142']   = 'Авторизация недоступна для банка/филиала';
$_['text_card_message_V6150']   = 'Неверная сумма возврата';
$_['text_card_message_V6151']   = 'Сумма возврата больше оригинальной транзакции';
$_['text_card_message_D4406']   = 'Неизвестная ошибка';
$_['text_card_message_S5010']   = 'Неизвестная ошибка';
