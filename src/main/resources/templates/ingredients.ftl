<#import "parts/common.ftl" as c>
<@c.page>
    <div class="container">
        <div style="text-align: center;"><h3>Список ингридиентов</h3></div>

        <table class="table">
            <thead>
            <tr>
                <th>Название</th>
                <th>Единицы измерения</th>
                <th>Цена</th>
                <th>Действие</th>
            </tr>
            </thead>
            <tbody>
            <#if Ingredients??>
                <#list Ingredients as Ingredients>
                    <tr>
                        <td>${Ingredients.getProductName()}</td>
                        <td>${Ingredients.getEnumUnit()}</td>
                        <td>${Ingredients.getPrice()}</td>
                        <td><a href="/delete/${Ingredients.id}">Удалить</a></td>
                    </tr>
                <#else>
                    Список пуст. Добавьте ингридиенты.
                </#list>
            </#if>
            </tbody>
        </table>
    </div>

</@c.page>
