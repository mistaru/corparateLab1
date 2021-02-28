<#import "parts/common.ftl" as c>
<@c.page>
    <div class="container">

        <div style="text-align: center;"><h3>История заказов</h3></div>

        <table class="table">
            <thead>
            <tr>
                <th>Номер набора</th>
                <th>Блюдо</th>
                <th>Кол-во порций</th>
            </tr>
            </thead>

            <tbody>
            <#if reportList??>
                <#list reportList as reportList>
                    <tr>
                        <td>${reportList.table.toString()}</td>
                        <td>${reportList.dish.nameDish}</td>
                        <td>${reportList.count}</td>
                    </tr>
                <#else>
                    Список пуст. Добавьте заказы.
                </#list>
            </#if>
            </tbody>
        </table>
    </div>
</@c.page>


