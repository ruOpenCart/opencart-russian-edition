<?php
// Text
$_['text_new_card']                      = '+ Добавить новую карту';
$_['text_loading']                       = 'Загрузка... Пожалуйста, подождите...';
$_['text_card_details']                  = 'Детали карты';
$_['text_saved_card']                    = 'Использовать сохраненную карту:';
$_['text_card_ends_in']                  = 'Оплата существующей картой %s, оканчивающейся на XXXX XXXX XXXX %s';
$_['text_card_number']                   = 'Номер карты:';
$_['text_card_expiry']                   = 'Окончание карты (ММ/ГГ):';
$_['text_card_cvc']                      = 'Код безопасности карты (CVC):';
$_['text_card_zip']                      = 'Почтовый индекс карты:';
$_['text_card_save']                     = 'Сохранить карту для использования в будущем?';
$_['text_trial']                         = '%s каждые %s %s для %s оплаты тогда ';
$_['text_recurring']                     = '%s каждые %s %s';
$_['text_length']                        = ' для %s оплаты';
$_['text_cron_subject']                  = 'Сводка Square CRON job';
$_['text_cron_message']                  = 'Вот список всех задач CRON, выполняемых вашим расширением Square:';
$_['text_squareup_profile_suspended']    = ' Ваши регулярные платежи приостановлены. Пожалуйста, свяжитесь с нами, для более подробной информации.';
$_['text_squareup_trial_expired']        = ' Ваш пробный период истек.';
$_['text_squareup_recurring_expired']    = ' Срок действия Ваших регулярных платежей истек. Это был Ваш последний платеж.';
$_['text_cron_summary_token_heading']    = 'Обновление токена доступа:';
$_['text_cron_summary_token_updated']    = 'Токен доступа успешно обновлен!';
$_['text_cron_summary_error_heading']    = 'Ошибки транзакции:';
$_['text_cron_summary_fail_heading']     = 'Неудачные транзакции (профили заблокированы):';
$_['text_cron_summary_success_heading']  = 'Успешные транзакции:';
$_['text_cron_fail_charge']              = 'Профиль <strong>#%s</strong> не может быть наполнен с <strong>%s</strong>';
$_['text_cron_success_charge']           = 'Профиль <strong>#%s</strong> был наполнен с <strong>%s</strong>';
$_['text_card_placeholder']              = 'XXXX XXXX XXXX XXXX';
$_['text_cvv']                           = 'CVV';
$_['text_expiry']                        = 'ММ/ГГ';
$_['text_default_squareup_name']         = 'Кредитная / Дебетовая карта';
$_['text_token_issue_customer_error']    = 'В нашей платежной системе произошел технический сбой. Пожалуйста, попробуйте позже.';
$_['text_token_revoked_subject']         = 'Ваш токен доступа к Square был отозван!';
$_['text_token_revoked_message']         = 'Доступ расширения Square для платежей к Вашей учетной записи Square был отменен через Square Dashboard. Вам необходимо подтвердить учетные данные своего приложения в настройках расширения и подключиться снова.';
$_['text_token_expired_subject']         = 'Срок действия вашего токена доступа Square истек!';
$_['text_token_expired_message']         = 'Срок действия токена доступа расширения для оплаты Square, соединяющего его с Вашей учетной записью Square, истек. Вам необходимо подтвердить учетные данные приложения и задание CRON в настройках расширения и подключиться снова..';

// Error
$_['error_browser_not_supported']        = 'Ошибка: Платежная система больше не поддерживает Ваш браузер. Пожалуйста, обновите или используйте другой.';
$_['error_card_invalid']                 = 'Ошибка: Карта недействительна!';
$_['error_squareup_cron_token']          = 'Ошибка: Не удалось обновить токен доступа. Подключите расширение Square Payment через панель администратора OpenCart.';

// Warning
$_['warning_test_mode']                  = 'Предупреждение: Включен режим песочницы! Транзакции будут выполнены, но плата не будет взиматься.';

// Statuses
$_['squareup_status_comment_authorized'] = 'Операция по карте была авторизована, но еще не зафиксирована.';
$_['squareup_status_comment_captured']   = 'Операция по карте была авторизована и впоследствии зафиксирована (т.е. завершена).';
$_['squareup_status_comment_voided']     = 'Операция по карте была авторизована и впоследствии аннулирована (т.е. Отменена).';
$_['squareup_status_comment_failed']     = 'Операция по карте не удалась.';

// Override errors
$_['squareup_override_error_billing_address.country']  = 'Страна платежного адреса недействительна. Пожалуйста, измените это и попробуйте снова.';
$_['squareup_override_error_shipping_address.country'] = 'Страна доставки не действительна. Пожалуйста, измените это и попробуйте снова.';
$_['squareup_override_error_email_address']            = 'Ваш адрес электронной почты клиента недействителен. Пожалуйста, измените это и попробуйте снова.';
$_['squareup_override_error_phone_number']             = 'Ваш номер телефона клиента недействителен. Пожалуйста, измените это и попробуйте снова.';
$_['squareup_error_field']                             = ' Поле: %s';