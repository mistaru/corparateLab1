<#import "parts/common.ftl" as c>
<@c.page>
    <div class="container">
        <div style="text-align: center;"><h1>Меню</h1></div>

        <table class="table">
                <thead>
                <tr>
                    <th>Название</th>
                    <th>Цена</th>
                    <th>Описание</th>
                    <th>Действия</th>
                </tr>
                </thead>
            <tbody>
            <#if menuDishes??>
                <#list menuDishes as menuDishes>
                    <tr>
                        <td>${menuDishes.nameDish}</td>
                        <td>${menuDishes.price}</td>
                        <td>${menuDishes.description}</td>
                        <td>
                            <a href="/details/${menuDishes.id}">Детально</a>/
                            <a href="/delete/${menuDishes.id}">Удалить</a>
                        </td>
                    </tr>
                <#else>
                    Список пуст. Добавьте блюдо.
                </#list>
            </#if>
            </tbody>
            </table>
        </div>








     <#--   <table class="table table-dark table-striped">
            <thead>
            <tr>
                <th>Название</th>
                <th>Цена</th>
                <th>Описание</th>
                <th>Действия</th>
            </tr>
            </thead>
            <tbody>
      <#if menuDishes??>
            <#list menuDishes as menuDishes>
                <tr>
                    <td>${menuDishes.nameDish}</td>
                    <td>${menuDishes.price}</td>
                    <td>${menuDishes.description}</td>
                    <td><a href="/delete/${menuDishes.id}">Удалить</a></td>
                </tr>
            <#else>
                Список пуст. Добавьте блюдо.
            </#list>
      </#if>
            </tbody>
        </table>
    </div>
-->
</@c.page>
