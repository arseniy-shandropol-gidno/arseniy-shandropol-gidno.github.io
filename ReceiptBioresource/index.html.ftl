<!DOCTYPE html>
<html lang="en, ua">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invoice efish</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="invoice_structure">

        <div class="doc_header_center">
            <p>Квитанція обліку</p>
            <p>добутих (виловлених) водних біоресурсів <b>№ [=journal_number]</b></p>
        </div>

        <div class="invoice_given_date">
            <p>Дата оформлення квитанції <b>[=receipt_gen_date]</b></p>
        </div>

        <div class="fisherie_name">
            <p>Назва рибогосподарського водного об’єкта (його частини): <b>[=water_object_name]</b></p>
        </div>

        <div class="info_about">
            <p>Інформація про сторони</p>
        </div>

        <div class="table_fisherie">
            <table>
                <tr>
                    <th>суб’єкта рибного господарства</th>
                    <th>рибоприймальний пункт</th>
                </tr>
                <tr>
                    <!-- Formatting dates to dd.mm.yyyy is handled in the Groovy script -->
                    <!-- Based on 'is_entrepreneur_flag' toggle data blocks -->
                    [#if is_entrepreneur_flag]
                        <td>
                            ПІБ: <b>[=subject_legalentity_name_ent]</b>
                            <br> РНОКПП: <b>[=subject_legalentity_code_ent]</b>
                        </td>
                    [#else]
                        <td>
                            ПІБ: <b>[=subject_legalentity_dir]</b>
                            <br> ЄДРПОУ: <b>[=subject_legalentity_code]</b>
                            <br>Повне найменування: <b>[=subject_legalentity_name]</b>
                        </td>
                    [/#if]
                    [#if !fishstation_type_own]
                        <td>
                            реєстраційний номер експлуатаційного дозволу: <b>[=fishing_station_permit_reg_number]</b>
                        </td>
                    [#else]
                        <td>
                            особистий реєстраційний номер потужності: <b>[=fishing_station_own_reg_number]</b>
                        </td>
                    [/#if]
                </tr>
            </table>
        </div>

        <div class="info_about">
            <p>Інформація про відповідальних осіб</p>
        </div>

        <div class="table_stakeholder">
            <table>
                <tr>
                    <th>Відповідальний на рибоприймальному пункті</th>
                    <th>Відповідальний за добування (вилов) водних біоресурсів</th>
                </tr>
                    [#if !rnokpp_flag_ship || !rnokpp_flag_fishstation]
                <tr>
                    <td>ПІБ: <b>[=fullname_person_fishstation]</b> <br>РНОКПП: <b>[=rnokpp_person_fishstation]</b></td>
                    <td>ПІБ: <b>[=fullname_person_ship]</b> <br>РНОКПП: <b>[=rnokpp_person_ship]</b></td>
                </tr>
                    [#else]
                <tr>
                    <td>
                        ПІБ: <b>[=fullname_person_fishstation]</b> 
                        <br>Серія та номер паспорту: <b>[=passport_person_fishstation]</b>
                        <br>Ким видано: <b>[=passport_authority_person_fishstation]</b>
                    </td>
                    <td>
                        ПІБ: <b>[=fullname_person_ship]</b> 
                        <br>Серія та номер паспорту: <b>[=passport_person_ship]</b> 
                        <br>Ким видано: <b>[=passport_authority_person_ship]</b>
                    </td>
                </tr>
                    [/#if]
            </table>
        </div>

        <div class="info_about">
            <p>Інформація про вилов водних біоресурсів</p>
        </div>

        <div>
            <table class="custom-table-layout">
                <tr>
                    <th>№ з/п </th> <!-- Dummy header, replace with actual header -->
                    <th>Назва виду добутих (виловлених) водних біоресурсів</th>
                    <th>Обсяги добутих (виловлених) водних біоресурсів, кг</th>
                </tr>
                [#list bioresource_table_data as item]
                <tr>
                    <td>[=(item?index + 1)]</td> <!-- Auto-incremented row number, adjusted for 1-based indexing -->
                    <td>[=(item.resource_name)!]</td>
                    <td>[=(item.resource_amount)!]</td>
                </tr>
                [/#list]
            </table>
        </div>

        <div class="table_signs">
            <table>
                <tr>
                    <th>Підписано в системі відповідальною особою <br>на рибоприймальному пункті</th>
                    <th id="second">Підписано в системі відповідальною особою за <br>добування (вилов) водних біоресурсів</th>
                </tr>
                <tr>
                    <td>[=fishstation_responsible_sign_datetime]</td>
                    <td id="second">[=ship_responsible_sign_datetime]</td>
                </tr>
            </table>
        </div>

</body>
</html>